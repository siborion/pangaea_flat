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
        height: parent.height*0.6
        width:  height*0.5
        radius: width/2
        color:  fonColor
        Rectangle
        {
            property int position: value-1
            color: "Black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:  parent.verticalCenter
            width:  parent.width*0.8
            height: parent.width*0.8
            radius: width
            anchors.verticalCenterOffset: parent.height / 4 * position
            Behavior on anchors.verticalCenterOffset  {NumberAnimation { duration: 200 }}
        }

        Column
        {
            anchors.fill:  parent
            MouseArea
            {
                height: parent.height/3
                width:  parent.width
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: value=0
                onWheel:   wheelChange(wheel.angleDelta.y);
            }
            MouseArea
            {
                height: parent.height/3
                width:  parent.width
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: value=1
                onWheel:   wheelChange(wheel.angleDelta.y);
            }
            MouseArea
            {
                height: parent.height/3
                width:  parent.width
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: value=2
                onWheel:   wheelChange(wheel.angleDelta.y);
            }
        }
    }
    function wheelChange(angleDelta)
    {
        if((angleDelta>0)&&(main.value>0))
            main.value--;
        if((angleDelta<0)&&(main.value<2))
            main.value++;
    }

}
