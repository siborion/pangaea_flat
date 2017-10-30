import QtQuick 2.7
import QtQuick.Controls 2.1

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int nomRow:0
    anchors.fill: parent
    property int presetNom: 0
    Row
    {
        anchors.fill: parent
        Repeater
        {
            id: repeater
            anchors.fill: parent
            model: 10
            Item
            {
                property bool light: false
                width:  main.width/10
                height: main.height

                function setImpulsEn(en)
                {
                    preset.impulsEn = en;
                }
                function setImpulsName(name)
                {
                    tp.text = name;
                }
                function setImpulsOn(on)
                {
                    preset.on = on;
                }

                Rectangle
                {
                    id: preset
                    property int minSize: Math.min(parent.width, parent.height)
                    property bool impulsEn: false
                    property bool on: false
                    anchors.centerIn: parent
                    width:  minSize/2
                    height: minSize/2
                    radius: minSize/2
                    color: impulsEn?(on?"Salmon":"Bisque"):devColor//index==nomRow?"Salmon":devColor
                    border.color: ((index+nomRow*10)==main.presetNom)?"Salmon":fonColor
                    border.width: 3
                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked:   _core.setValue("preset_change", nomRow*10+index)
                        onEntered: tp.visible = true
                        onExited:  tp.visible = false
                    }

                    ToolTip
                    {
                        id: tp
                        text: "tool"
                        visible: false
                        timeout: 0
                    }
                }
            }
        }
    }

    function setImpulsOn(nomElement, on)
    {
        repeater.itemAt(nomElement).setImpulsOn(on);
    }
    function setImpulsEn(nomElement, en)
    {
        repeater.itemAt(nomElement).setImpulsEn(en);
    }
    function setImpulsName(nomElement, name)
    {
        repeater.itemAt(nomElement).setImpulsName(name);
    }

    Connections
    {
        target: _core
    }
}
