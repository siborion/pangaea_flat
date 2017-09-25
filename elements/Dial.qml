import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#ffffff"
    property string label: "label"
    property int    valueDisp: 0
    property int    value: 0

    property int valueMin: 0
    property int valueMax: 31

    property int dispMin: 0
    property int dispMax: 1000

    anchors.fill: parent

    Column
    {
        anchors.fill: parent
        Item
        {
            height: Math.min(parent.height, parent.width)*0.8
            width : Math.min(parent.height, parent.width)*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle
            {
                anchors.fill: parent
                radius: parent.width
                color: "Black"

                Item
                {
                    height: parent.height
                    width:  parent.width/10
                    anchors.centerIn: parent
                    Rectangle
                    {
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: -parent.height/5*2
                        height: Math.min(parent.height, parent.width)
                        width : Math.min(parent.height, parent.width)
                        radius: width
                        color: fonColor
                    }
                    rotation: 10
                }

                Text
                {
                    anchors.centerIn: parent
                    color: fonColor
                    font.family: "Arial Black"
                    font.bold: true
                    font.pixelSize: parent.width/7
                    text: "540"
                }
            }
        }

        Item
        {
            height: Math.min(parent.height, parent.width)*0.2
            width : Math.min(parent.height, parent.width)*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            Text
            {
                anchors.verticalCenter:   parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color: fonColor
                font.family: "Arial Black"
                font.bold: true
                font.pixelSize: parent.width/7
                text: label
            }
        }
    }

    Connections
    {
        target: _core
    }
}
