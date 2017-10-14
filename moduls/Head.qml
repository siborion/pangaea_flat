import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property bool eqPost: (switchPostPre.value==0)
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
                onUp:   bank.up()
                onDown: bank.down()
            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
//            Presets
//            {
//                id: bank
//                anchors.fill: parent
//                text: "BANK"
//            }
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
                anchors.fill: parent
                color: "MediumSeaGreen"
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
//            Presets
//            {
//                id: preset
//                anchors.fill: parent
//                text: "PRESET"
//            }
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*1
            UpDown
            {
                anchors.fill: parent
                onUp:   preset.up()
                onDown: preset.down()
            }
        }
    }
}
