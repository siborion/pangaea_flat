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
        width:  parent.width/1.5
        height: width/2
        radius: height/2
        color: fonColor
        Rectangle
        {
            property int position: value-1
            color: "Black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:  parent.verticalCenter
            width:  parent.height*0.8
            height: parent.height*0.8
            radius: height
            anchors.horizontalCenterOffset: parent.width / 4 * position
            Behavior on anchors.horizontalCenterOffset  {NumberAnimation { duration: 200 }}
        }

        Row
        {
            anchors.fill:  parent
            MouseArea
            {
                height: parent.height
                width: parent.width/3
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: value=0
            }
            MouseArea
            {
                height: parent.height
                width: parent.width/3
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: value=1
            }
            MouseArea
            {
                height: parent.height
                width: parent.width/3
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: value=2
            }
        }
    }
}
