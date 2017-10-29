import QtQuick 2.7
import QtQuick.Controls 1.5

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

                Rectangle
                {
                    id: preset
                    property int minSize: Math.min(parent.width, parent.height)
                    anchors.centerIn: parent
                    width:  minSize/2
                    height: minSize/2
                    radius: minSize/2
                    color: index==nomRow?"Salmon":devColor
                    border.color: ((index*10+nomRow)==main.presetNom)?"Salmon":fonColor
                    border.width: 3
                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked:{ _core.setValue("preset_change", nomRow+10*index); console.log("nomRow+10*index", nomRow+10*index);}
                        onEntered:
                        {
                        }
                    }
                }
            }
        }
    }

    Connections
    {
        target: _core
    }

}
