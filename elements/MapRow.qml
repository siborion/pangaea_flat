import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int nomRow:0
    anchors.fill: parent
    Row
    {
        anchors.fill: parent
        Repeater
        {
            id: repeater
            anchors.fill: parent
            model: 10
            Item
            {
                property bool light: false
                width:  main.width/10
                height: main.height


                Rectangle
                {
                    id: preset
                    property int minSize: Math.min(parent.width, parent.height)
                    anchors.centerIn: parent
                    width:  minSize/2
                    height: minSize/2
                    radius: minSize/2
                    objectName: nomRow*10 + index
                    color: parent.light?"Red":devColor
                    border.color: fonColor
                    border.width: 3
                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked:
                        {
                        }
                        onEntered:
                        {
//                            console.log(preset.objectName)
                            repeater.itemAt(1).light = true;
//                            preset.objectName
                        }
                    }
                }
            }
        }
    }
}
