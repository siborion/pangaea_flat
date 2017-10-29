import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{

    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int   value: 0
    signal chValue(int value)
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
                onClicked: {main.value=0; main.chValue(main.value)}
                onWheel:   wheelChange(wheel.angleDelta.y);
            }
            MouseArea
            {
                height: parent.height
                width: parent.width/3
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {main.value=1; main.chValue(main.value)}
                onWheel:   wheelChange(wheel.angleDelta.y);
            }
            MouseArea
            {
                height: parent.height
                width: parent.width/3
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {main.value=2; main.chValue(main.value)}
                onWheel:   wheelChange(wheel.angleDelta.y);
            }
        }
    }

    function wheelChange(angleDelta)
    {
        if((angleDelta>0)&&(main.value<2))
            main.value++;
        if((angleDelta<0)&&(main.value>0))
            main.value--;
        main.chValue(main.value)
    }


}
