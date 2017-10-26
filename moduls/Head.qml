import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property bool eqPost: (switchPostPre.value==0)
    property int  presetNom: bank.value*10+preset.value
    property int  bank:   bank.value
    property int  preset: preset.value
    property bool editable: true
    signal setImpuls()
    anchors.fill: parent
    id: main

    Row
    {
        id: row
        anchors.fill: parent
        spacing: 2
        property int widthWithoutSpase: width-spacing*10

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            Presets
            {
                id: bank
                anchors.fill: parent
                text: "BANK"
                nameValue: "bank"
                onChValue:  _core.setValue("bank_change", up?1:0)
                enabled: main.editable
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            OutputType
            {
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            SaveComp
            {
                anchors.fill: parent
                editable: main.editable
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*7+4
            Rectangle
            {
                id: impuls
                anchors.fill: parent
                color: "MediumSeaGreen"
                Text
                {
                    anchors.fill: parent
                    id: impulsTxt
                    text: "empty"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment:   Text.AlignVCenter
                    font.bold: true
                    font.pixelSize: parent.height/4
                    wrapMode: Text.Wrap
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: main.setImpuls()
                }
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            CopyPast
            {
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            SwitchPostPre
            {
                id: switchPostPre
                enabled: main.editable
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            Presets
            {
                id: preset
                anchors.fill: parent
                text: "PRESET"
                nameValue: "preset"
                onChValue: _core.setValue("preset_change", up?1:0)
                enabled: main.editable
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
        }
    }

    Connections
    {
        target: _core
        onSgReadText:
        {
            if (nameParam=="impulse_name")
                impulsTxt.text=value;
        }
    }

}
