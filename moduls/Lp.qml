import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string devColorDis: "#7E7991"
    property string name:     "LP"
    property string nameValue: "lpf_on"
    property bool on: true
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
                main.on = (!main.on);
                _core.setValue(nameValue, main.on);
                material.start(mouseX, mouseY)
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
                    enabled: main.on
		    angleMin: 140
                    angleMax: -140
                    name: "1k Hz 20k"
                    checkable: false
                    nameValue: "lpf_volume"
                    valueMax:  195
                    valueMin:  0
                    dispMin:   1000
                    dispMax:   20000
		    dispValue: (Math.pow(195.0-value, 2) * (19000.0/Math.pow(195.0, 2.0)) + 1000.0).toFixed()
//powf(195.0f - data,2.0)*(19000.0f/powf(195.0f,2.0f))+1000.0f;
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
