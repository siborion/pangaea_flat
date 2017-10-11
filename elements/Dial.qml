import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"

    property string name: "DIAL"

    property bool checkable: true
    property bool on: true

    property int value:     15
    property int valueLast: 0
    property int valueMin:  0
    property int valueMax:  31
    property int dispMin:   0
    property int dispMax:   31
    property int angleMin: -140
    property int angleMax:  140
//    property int div:       1

    property double k2: (dispMin-dispMax)/(valueMin-valueMax)
    property double k1:  dispMin-(valueMin*k2)
    property double dispValue: Math.round(k1 + value*k2)

    property double a2: (angleMin-angleMax)/(valueMin-valueMax)
    property double a1:  angleMin-(valueMin*a2)
    property int dispAngle: a1 + value*a2

    anchors.fill: parent
    Column
    {
        anchors.fill: parent
        opacity: main.enabled?1:0.5
        Item
        {
            height: Math.min(parent.height, parent.width)*0.76
            width : Math.min(parent.height, parent.width)*0.76
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle
            {
                anchors.fill: parent
                radius: parent.width
                color: fonColor
                opacity: main.on?1:0.5

                Item
                {
                    height: parent.height
                    width:  parent.width/7
                    anchors.centerIn: parent
                    Rectangle
                    {
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: -parent.height/5*2
                        height: Math.min(parent.height, parent.width)
                        width : Math.min(parent.height, parent.width)
                        radius: width
                        color: devColor
                    }
                    rotation:  dispAngle
                }
                Text
                {
                    anchors.centerIn: parent
                    color: devColor
                    font.family: "Arial Black"
                    font.bold: true
                    font.pixelSize: parent.width/5
                    text: dispValue
                }

                MouseArea
                {
                    id: mArea
                    property int startAngle
                    property int lastX
                    property int lastY
                    property int angle
                    property int curAngle
                    property int lastAngle
                    property bool changeZnalAngle
                    anchors.fill: parent
                    enabled: main.on
                    hoverEnabled: true
                    cursorShape: main.on?(pressed?Qt.ClosedHandCursor:Qt.OpenHandCursor):Qt.ArrowCursor
                    onPositionChanged:
                    {
                        if (pressed)
                        {
                            angle = (angleFromPoint(mouseX, mouseY));
                            if(angle*lastAngle<0)
                            {
                                if(Math.abs(angle)>100)
                                    changeZnalAngle^=1;
                            }
                            if(!changeZnalAngle)
                                curAngle = angle;
                            else
                                curAngle = (angle<0)?(360+angle):(-360+angle);
                            main.value = main.valueLast + curAngle/((angleMax-angleMin)/(valueMax-valueMin));
                            valueUpdate();
                            lastAngle = angle;
                        }
                    }
                    onPressed:
                    {
                        changeZnalAngle = false;
                        lastX = mouseX;
                        lastY = mouseY;
                        main.valueLast = main.value;
                    }
                    onWheel:
                    {
                        main.value += (wheel.angleDelta.y/120);
                        valueUpdate();
                    }
                }
            }
        }

        Item
        {
            height: Math.min(parent.height, parent.width)*0.24
            width : Math.min(parent.height, parent.width)*0.76
            anchors.horizontalCenter: parent.horizontalCenter
            Text
            {
                anchors.verticalCenter:   parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: -parent.width/30
                color: main.checkable?(main.on?"Salmon":"Blue"):fonColor
                font.family: "Arial Black"
                font.bold: true
                font.pixelSize: parent.width/6
                text: main.name
//                opacity: main.enabled?1:0.5
                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: main.checkable?Qt.PointingHandCursor:Qt.ArrowCursor
                    onClicked:
                    {
                        if(main.checkable)
                            main.on = (!main.on)
                    }
                }
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
        return angle;
    }

    function valueUpdate()
    {
        main.value = main.value<=valueMin?valueMin:main.value;
        main.value = main.value>=valueMax?valueMax:main.value;
    }

    Connections
    {
        target: _core
    }
}
