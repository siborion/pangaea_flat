import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
//import Qt.labs.platform 1.0
import "moduls/"

ApplicationWindow
//Item
{
    id: main
    visible: true
    height: 520
    width:  1104
    //    color: "#EBECEC"
    //    signal closeAccepted()
    property int presetNom: head.presetNom
    property string markEdit: edit?" * ":" "
    property string devName: ""
    property string markConnect: connect?"Connected":"Disconnected"
    property bool editable: false
    property bool edit: false
    property bool connect: false
    property bool wait: true
    property bool irOn: moduls.irOn
    //    property string
    title: qsTr("AMT Pangaea " + devName + " v.1.0.1674a "  + markConnect + " Bank " + head.bank + " Preset " + head.preset + markEdit)

    Item
    {
        focus: true
        anchors.fill: parent

        Column
        {
            anchors.fill: parent
            spacing: 2
            Item
            {
                width:  parent.width
                height: parent.height/1000*150
                Head
                {
                    id: head
                    onSetImpuls: msg.visible = true;
                    editable: main.editable & (!main.wait)
                    edit:     main.edit
                    irOn: main.irOn
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*850
                Moduls
                {
                    id: moduls
                    eqPost: head.eqPost
                    presetNom: main.presetNom
                    enabled: editable & (!main.wait)
                }
            }
        }

        Keys.onPressed:
        {
            console.log(event.key);
            if( event.key === Qt.Key_Tab )
            {
                _core.slTabKey(event.modifiers & Qt.ShiftModifier);
            }
            if( event.key === Qt.Key_Up )
            {
                _core.slUpDown(1);
            }
            if( event.key === Qt.Key_Down )
            {
                _core.slUpDown(0);
            }
        }

    }

    FileDialog
    {
        id: fileSaveLog
        title: "Save log file"
        visible: false
        selectExisting: false
        onAccepted:
        {
            _core.slAnswerErrSave(fileUrl);
        }
    }

    MFileOpen
    {
        id: msg
        onAccepted: moduls.irEnable(true);
    }


    Dialog
    {
        id: msgPresetUpDownSave
        property int saveParam: 0
        title: "Save preset"
        standardButtons: StandardButton.Save | StandardButton.No | StandardButton.Cancel
        onAccepted: _core.setValue("save_up_down", saveParam)
        onNo:       _core.setValue("set_preset_updown", saveParam)
    }
    Dialog
    {
        id: msgPresetChangeSave
        property int saveParam: 0
        title: "Save preset"
        standardButtons: StandardButton.Save | StandardButton.No | StandardButton.Cancel
        onAccepted: _core.setValue("save_change", saveParam);
        onNo:
        {
            console.log("saveParam", saveParam);
            if(saveParam==(-2))
                _core.setValue("esc", 0);
            else
                _core.setValue("set_preset_change", saveParam);
        }
        onRejected: saveParam = 0;
    }

    Dialog
    {
        id: msgAnswerError
        standardButtons: StandardButton.Ok
    }

    Dialog
    {
        id: msgAnswerErrSave
        width: 300
        visible: false
        Column
        {
            Text
            {
                id: tCommand
                text: ""
            }
            Text
            {
                id: tError
                text: qsTr("Error.\r\nSave log exchange?")
            }
        }
        standardButtons: StandardButton.Yes  | StandardButton.No
        onYes:
        {
            fileSaveLog.open();
        }
    }

    MBusy
    {
        id: mBusy
        busy: main.wait
        z:1
    }

    Connections
    {
        target: _core
        onSignal: console.log("The application data changed!");

        onSgAnswerErrSave:
        {
            msgAnswerErrSave.visible = true;
            tCommand.text = "Command: " + strCom;
        }

        //        onSgPortError:
        //        {
        //            msg.text = str;
        //            msg.visible = true;
        //        }
        onSgPresetUpDownStage1:
        {
            msgPresetUpDownSave.saveParam = inChangePreset;
            msgPresetUpDownSave.visible = true;
        }
        onSgPresetChangeStage1:
        {
            msgPresetChangeSave.saveParam = inChangePreset;
            msgPresetChangeSave.visible = true;
        }
        onSgReadText:
        {
            if(nameParam==("open_port"))
            {
                connect = true;
                msgAnswerError.close();
            }
            if(nameParam==("close_port"))
            {
                connect = false;
                msgAnswerError.title = markConnect;
                msgAnswerError.visible = true;
                main.editable = false;
            }
            //            if(nameParam==("no_answer"))
            //            {
            //                msgAnswerError.title = "Answer error \""+value+"\""
            //                msgAnswerError.visible = true;
            //            }
        }
        onSgReadValue:
        {
            if(nameParam==("preset_edit"))
                edit = value;
            if(nameParam==("wait"))
            {
                wait = value;
                if(msgPresetChangeSave.saveParam==(-2))
                {
                    if(!value && (!msgPresetChangeSave.visible) && (msgPresetChangeSave.saveParam==(-2)))
                        Qt.quit();
                }
            }
            if(nameParam=="editable")
                main.editable=value

            if(nameParam==("type_dev"))
            {
                switch (value)
                {
                case 0: devName = "";  break;
                case 1: devName = "CP-100";  break;
                case 2: devName = "CP-16M";  break;
                case 3: devName = "CP-16PA"; break;
                case 4: devName = "CP-100PA"; break;
                }
            }
        }
    }

    //    function closing()
    onClosing:
    {
        if(main.edit && main.connect)
        {
            msgPresetChangeSave.saveParam = (-2);
            msgPresetChangeSave.visible = true;
            close.accepted = false;
            //            main.closeAccepted();
            //            return false;
        }
        //        else
        //            return true;
    }
}

