import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    anchors.fill: parent
    Rectangle
    {
        id: colorRect
        color: "grey"
        opacity: 0.3
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
        to: main.width
        duration: 400
        onStopped: {colorRect.width = 0; colorRect.height = 0;}
    }


    function start(xM, yM)
    {
        colorRect.x = parent.width/2;  //xM;
        colorRect.y = parent.height/2; //yM;
        circleAnimation.start();
    }

    function stop()
    {
        circleAnimation.stop();
    }
}
