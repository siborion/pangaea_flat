import QtQuick 2.7
import QtQuick.Controls 1.5
import "../moduls/"

Column
{
    id: main
    signal up();
    signal down();

    Rectangle
    {
        width:  parent.width
        height: parent.height/2
        color: "Blue"
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: main.up()
        }
    }

    Rectangle
    {
        width:  parent.width
        height: parent.height/2
        color: "Green"
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: main.down()
        }
    }
}
