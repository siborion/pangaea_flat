import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string header: "TEXT"
    property bool on: true
    property bool checkable: true
    anchors.fill: parent
    id: main
    Rectangle
    {
        anchors.fill: parent
        color: "Grey"

        Item
        {
            anchors.top: parent.top
            width:  parent.width
            height: parent.height/8

            Text
            {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Arial Black"
                font.bold: true
                font.pixelSize: 24
                color: on?"firebrick":"Salmon"
                text: header
                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: main.checkable?Qt.PointingHandCursor:Qt.ArrowCursor
                    onClicked:
                    {
                        if(main.checkable)
                            main.on = (!main.on);
                    }
                }
            }
        }
    }
}
