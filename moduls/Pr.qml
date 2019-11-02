import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string devColorDis: "#7E7991"
    property string name:     "PR"
    property bool presentInDev: true
    property string nameValue: "preamp_on"
    property bool on: false
    anchors.fill: parent
    id: main
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
                Dial
                {
                    enabled: main.on
                    name: "HIGH"
                    checkable: false
                    nameValue: "preamp_high"
                    valueMin: (-64)
                    valueMax: (63)
                    dispMin:  (0)
                    dispMax:  (127)
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: main.on
                    name: "MID"
                    checkable: false
                    nameValue: "preamp_mid"
                    valueMin: (-64)
                    valueMax: (63)
                    dispMin:  (0)
                    dispMax:  (127)
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: main.on
                    name: "LOW"
                    checkable: false
                    nameValue: "preamp_low"
                    valueMin: (-64)
                    valueMax: (63)
                    dispMin:  (0)
                    dispMax:  (127)
                }
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
                    nameValue: "preamp_volume"
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
                main.on= (value && main.presentInDev)
                fon.color= main.on?devColor:devColorDis
            }
        }
    }
}
