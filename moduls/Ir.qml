import QtQuick 2.7
import QtQuick.Controls 1.4
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string devColorDis: "#7E7991"
    property string name:     "IR"
    property string nameValue: "cabinet_enable"
    property bool on: common.on
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
                switchIr.setValue(main.on==0);
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
                SwitchIr
                {
                    id: switchIr
                    enabled: main.on
                    onChValue: main.on = (value==0)

                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*25
            }
        }
    }

    function setEnable(val)
    {
        main.on=val;
        switchIr.setValue(main.on==0);
    }


    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((main.nameValue.length>0)&&(nameParam==main.nameValue))
            {
                main.on=value;
                switchIr.setValue(main.on==0);
                fon.color= main.on?devColor:devColorDis
            }
        }
    }
}
