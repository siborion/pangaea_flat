import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#ffffff"
    property string label: "DIAL"

    property int    value: 31
    property int valueLast: 0
    property int valueMin: 0
    property int valueMax: 31
    property int dispMin:  0
    property int dispMax:  500
    property int angleMin: -140
    property int angleMax:  140

    property double k2: (dispMin-dispMax)/(valueMin-valueMax)
    property double k1:  dispMin-(valueMin*k2)
    property int dispValue: k1 + value*k2

    property double a2: (angleMin-angleMax)/(valueMin-valueMax)
    property double a1:  angleMin-(valueMin*a2)
    property int dispAngle: a1 + value*a2

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
                    rotation:  dispAngle
                }

                Text
                {
                    anchors.centerIn: parent
                    color: fonColor
                    font.family: "Arial Black"
                    font.bold: true
                    font.pixelSize: parent.width/7
                    text: dispValue
                }


                MouseArea
                {
                    id: mArea
                    property int startAngle
                    property int lastX
                    property int lastY
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: pressed?Qt.ClosedHandCursor:Qt.OpenHandCursor
                    onPositionChanged:
                    {
                        if (pressed)
                            main.value = main.valueLast + (angleFromPoint(mouseX, mouseY)/((angleMax-angleMin)/(valueMax-valueMin)));
                    }
                    onPressed:
                    {
                        lastX = mouseX;
                        lastY = mouseY;
                        main.valueLast = main.value;
                    }
                    onWheel: main.value += (wheel.angleDelta.y/120);
                }

                //                    MouseArea
                //                    {
                //                        id: mAreaVertical
                //                        property int lastY
                //                        anchors.centerIn: parent
                //                        height: parent.height/2
                //                        width:  parent.width/2
                //                        cursorShape:  Qt.SizeVerCursor
                //                        onPositionChanged:
                //                        {
                //                            if (pressed)
                //                            {
                //                                fon.orientation += ((lastY - mouseY));
                //                                fon.orientation = normalValue(fon.orientation);
                //                                lastY = mouseY;
                //                            }
                //                        }

                //                        onPressed:
                //                        {
                //                            lastY = mouseY;
                //                            normalValue(fon.orientation);
                //                        }

                //                        onWheel:
                //                        {
                //                            fon.orientation += (wheel.angleDelta.y/15);
                //                            fon.orientation = normalValue(fon.orientation);
                //                        }
                //                    }







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

    function angleFromPoint(x, y)
    {
        var angle;
        var centerX = mArea.width  / 2;
        var centerY = mArea.height / 2;
        var vectorAX = mArea.lastX - centerX;
        var vectorAY = mArea.lastY - centerY;
        var vectorBX = x - centerX;
        var vectorBY = y - centerY;
        angle = Math.atan2(vectorAX*vectorBY - vectorAY*vectorBX, vectorAX*vectorBX + vectorAY*vectorBY) ;
        angle *= 180;
        angle /= Math.PI;
        console.log(angle);
        return angle;
    }

    Connections
    {
        target: _core
    }
}
