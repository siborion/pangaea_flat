import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string devColorDis: "#7E7991"
    property string name:     "ER"
    property string nameValue: "early_on"

    property bool on: false
    anchors.fill: parent
    id: main

    Rectangle
    {
        id: fon
        anchors.fill: parent
        clip: true
        color: devColorDis

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
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked:
            {
                main.on = (!main.on);
                _core.setValue("early_on", main.on);
                colorRect.x = mouseX
                colorRect.y = mouseY
                circleAnimation.start()
            }
        }

        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/1000*70
                Common
                {
                    id:common
                    anchors.fill: parent
                    header: name
                    on: main.on
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*80
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*165
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                SwitchRoom
                {
                    enabled: main.on
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: main.on
                    name: "VOLUME"
                    checkable: false
                    nameValue: "early_volume"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*25
            }
        }
    }
    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((main.nameValue.length>0)&&(nameParam==main.nameValue))
            {
                main.on=value
                fon.color= main.on?devColor:devColorDis
            }
        }
    }
}
