import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property bool eqPost: (switchPostPre.value==0)
    property int  presetNom: bank.value*10+preset.value
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
            UpDown
            {
                anchors.fill: parent
                onUp:   _core.slSaveWithParam(1) //bank.up()
                onDown: _core.slSaveWithParam(2) //bank.down()
            }
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
                onChValue: _core.slSaveWithParam(up?1:2)
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
                    text: "txt"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment:   Text.AlignVCenter
                    font.bold: true
                    font.pixelSize: 20
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
                onChValue: _core.slSaveWithParam(up?3:4)
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            UpDown
            {
                anchors.fill: parent
                onUp:   _core.slSaveWithParam(3) //bank.up()
                onDown: _core.slSaveWithParam(4) //bank.down()
            }
        }
    }

    Connections
    {
        target: _core
        onSgReadText:
        {
            if((nameParam.indexOf("impuls_name")>=0))
                impulsTxt.text=value;
        }
    }

}
