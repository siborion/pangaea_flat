import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    anchors.fill: parent
    Rectangle
    {
        id: colorRect
        color: main.on?devColor:devColorDis
        transform: Translate
        {
            x: -colorRect.width / 2
            y: -colorRect.height / 2
        }
    }

    PropertyAnimation
    {
        id: circleAnimation
        target: colorRect
        properties: "width,height,radius"
        from: 0
        to: main.height*3
        duration: 300
        onStopped: fon.color= main.on?devColor:devColorDis
    }


    function start(xM, yM)
    {
        colorRect.x = xM;
        colorRect.y = yM;
        circleAnimation.start();
    }

    function stop()
    {
        circleAnimation.stop();
    }
}
