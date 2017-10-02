import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#ffffff"

    property int value:     0
    property int valueLast: 0
    property int valueMin:  0
    property int valueMax:  31
    property int dispMin:   -15
    property int dispMax:   15

    property double k2: (dispMin-dispMax)/(valueMin-valueMax)
    property double k1:  dispMin-(valueMin*k2)
    property int dispValue: k1 + value*k2

    anchors.fill: parent

    Rectangle
    {
        anchors.centerIn: parent
        anchors.fill: parent
        color: "Grey"

        Rectangle
        {
            id: valueArea
            anchors.centerIn: parent
            width:  parent.width
            height: parent.height*0.8
            color: "Grey"

            Rectangle
            {
                id: pot
                anchors.centerIn: parent
                anchors.verticalCenterOffset: ((valueMax-valueMin)/2-value) * (valueArea.height/valueMax)
                width:  parent.width*0.8
                height: parent.width*0.8/2
                radius: parent.width*0.2

                color: "White"
                Text
                {
                    text: dispValue
                    color: "Grey"
                    anchors.centerIn: parent
                }
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: pressed?Qt.ClosedHandCursor:Qt.OpenHandCursor
                onPositionChanged:
                {
                    if (pressed)
                        valueUpdate(mouseY);
                }
                onPressed:
                {
                    valueUpdate(mouseY);
                }
            }
        }
    }

    function valueUpdate(valMouseY)
    {
        value = (valueArea.height-valMouseY)/valueArea.height*valueMax;
        value = value<=valueMin?valueMin:value;
        value = value>=valueMax?valueMax:value;
    }

    Connections
    {
        target: _core
    }
}
