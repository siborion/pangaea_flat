import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{

    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int   value: 0
    anchors.fill:  parent

    Rectangle
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:  parent.verticalCenter
        width: parent.width/1.5
        height: width/2
        radius: height/2
        color: fonColor
        Rectangle
        {
            color: "Black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:  parent.verticalCenter
            width:  parent.height*0.8
            height: parent.height*0.8
            radius: height
            anchors.horizontalCenterOffset: (value==0)?(parent.width/-4):(parent.width/4)
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked:   value ^= 1
        }
    }
}
