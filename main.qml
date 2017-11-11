import QtQuick 2.7
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import "moduls/"



ApplicationWindow
//Item
{
    id: main
    visible: true
    height: 520
    width:  1104
    //    color: "#EBECEC"
    property int presetNom: head.presetNom
    property string markEdit: edit?" * ":" "
    property string devName: ""
    property string markConnect: "Disconnected"
    property bool editable: true
    property bool edit: false
    property bool wait: false
    property bool irOn: moduls.irOn
    //    property string
    title: qsTr("AMT Pangaea " + devName + " v.1.0.1661a "  + markConnect + " Bank " + head.bank + " Preset " + head.preset + markEdit)

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
        onAccepted: _core.setValue("save_change", saveParam)
        onNo:       _core.setValue("set_preset_change", saveParam)
    }

    Dialog
    {
        id: msgAnswerError
        standardButtons: StandardButton.Ok
    }

    MBusy
    {
        id: mBusy
        busy: main.wait
    }

    Connections
    {
        target: _core
        onSignal: console.log("The application data changed!")
        onSgPortError:
        {
            msg.text = str;
            msg.visible = true;
        }
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
                markConnect = value;
                msgAnswerError.close();
            }
            if(nameParam==("close_port"))
            {
                markConnect = "Disconnected";
                msgAnswerError.title = markConnect
                msgAnswerError.visible = true;
            }
            if(nameParam==("no_answer"))
            {
                msgAnswerError.title = "Answer error \""+value+"\""
                msgAnswerError.visible = true;
            }
        }
        onSgReadValue:
        {
            if(nameParam==("preset_edit"))
                edit = value;
            if(nameParam==("wait"))
                wait = value; //mBusy.busy = value;
            if(nameParam=="editable")
                main.editable=value

            if(nameParam==("type_dev"))
            {
                switch (value)
                {
                case 1: devName = "CP-100";  break;
                case 2: devName = "CP-16M";  break;
                case 3: devName = "CP-16PA"; break;
                case 3: devName = "CP-100PA"; break;
                }
            }
        }
    }
}

