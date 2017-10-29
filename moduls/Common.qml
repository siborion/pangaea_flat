import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string header: "TEXT"
    property string fonColor: "#EBECEC"
    property bool on: true
    property bool checkable: true
    anchors.fill: parent
    id: main
    Text
    {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Arial Black"
        font.bold: true
        font.pixelSize: parent.height/1.7
        color: on?"salmon":fonColor
        text: header
//        MouseArea
//        {
//            anchors.fill: parent
//            hoverEnabled: true
//            cursorShape: main.checkable?Qt.PointingHandCursor:Qt.ArrowCursor
//            onClicked:
//            {
//                if(main.checkable)
//                    main.on = (!main.on);
//            }
//        }
    }
}
