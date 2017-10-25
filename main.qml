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
    property string markEdit: ""
    property string devName: ""
    property string markConnect: "Disconnected"

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
        onAccepted: _core.setValue("save", saveParam)           //_core.slSave(saveParam)
        onNo:       _core.setValue("set_preset_nom", saveParam) //_core.setPresetNom(saveParam)
        onVisibilityChanged:
        {
            //            mBank.keyDeactive();
            //            mPreset.keyDeactive();
        }
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
            if(nameParam.indexOf("open_port")==0)
                markConnect = value;
            if(nameParam.indexOf("close_port")==0)
                markConnect = "Disconnected";
        }
    }
}




