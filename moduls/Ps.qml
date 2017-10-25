import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string name:     "PS"
    property string nameValue: "presence_on"
    property bool on: false
    signal chPresence(int value)

    anchors.fill: parent
    id: main
    Rectangle
    {
        anchors.fill: parent
        color: devColor
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked:
            {
                main.on = (!main.on);
                _core.setValue(nameValue, main.on);
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
                main.on=value

                console.log(nameParam, value);
        }
    }
}
