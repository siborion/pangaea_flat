import QtQuick 2.7
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import "moduls/"

ApplicationWindow
{
    id: main
    visible: true
    height: 520
    width:  1104
    color: "#EBECEC"
    property int presetNom: head.presetNom
    property string markEdit: " "
    property string devName: ""
    property string markConnect: "Disconnected"
    property bool editable: false

    title: qsTr("AMT Pangaea " + devName + " v.0.3.1637b "  + markConnect + " Bank " + head.bank + " Preset " + head.preset + markEdit)

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
                editable: main.editable
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
                enabled: editable
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
        id : msgSave
        property int saveParam: 0
        title: "Save preset"
        standardButtons: StandardButton.Save | StandardButton.No | StandardButton.Cancel
        onAccepted: _core.setValue("save_up_down", saveParam)
        onNo:       _core.setValue("set_preset_nom", saveParam)
        onVisibilityChanged:
        {
            //            mBank.keyDeactive();
            //            mPreset.keyDeactive();
        }
    }

    MBusy
    {
        id: mBusy
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
        onSgSaveWithParam:
        {
            msgSave.saveParam = inChangePreset;
            msgSave.visible = true;
        }
        onSgReadText:
        {
            if(nameParam==("open_port"))
                markConnect = value;
            if(nameParam==("close_port"))
                markConnect = "Disconnected";
        }
        onSgReadValue:
        {
            if(nameParam==("preset_edit"))
                markEdit = (value==1)?" * ":"   ";
            if(nameParam==("wait"))
                mBusy.busy = value;
            if(nameParam=="editable")
                main.editable=value
        }
    }
}
