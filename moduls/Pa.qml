import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string devColorDis: "#7E7991"
    property string name:     "PA"
    property bool on: true
    property bool presentInDev: true
    property string nameValue: "amp_on"
    signal chPresence(int value)

    anchors.fill: parent
    Rectangle
    {
        id: fon
        anchors.fill: parent
        color: devColor
        clip: true

        Material
        {
            id: material
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked:
            {
                if( main.presentInDev )
                {
                    main.on = (!main.on);
                    _core.setValue(nameValue, main.on);
                    material.start(mouseX, mouseY)
                }
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
                height: parent.height/1000*90
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*265
                TypePA
                {
                    enabled: main.on
                }
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*55
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
                    nameValue: "amp_volume"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    id: presence
                    enabled: main.on
                    name: "PRESENCE"
                    nameValue: "presence_volume"
                    checkable: false
                    onChValue: main.chPresence(value)
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    id: slave
                    enabled: main.on
                    name: "SLAVE"
                    checkable: false
                    nameValue: "amp_slave"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*25
            }
        }
    }

    function setPresence(value)
    {
        presence.valueUpdateSoft(value);
    }

    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((main.nameValue.length>0)&&(nameParam==main.nameValue))
            {
                main.on= (value && main.presentInDev)
                fon.color= main.on?devColor:devColorDis
            }
        }
    }
}

