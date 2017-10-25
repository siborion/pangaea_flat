import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string name:     "PR"
    property string nameValue: "preamp_on"
    property bool on: false
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
                Dial
                {
                    enabled: main.on
                    name: "HIGH"
                    checkable: false
                    nameValue: "preamp_high"
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
                main.on=value
        }
    }
}
