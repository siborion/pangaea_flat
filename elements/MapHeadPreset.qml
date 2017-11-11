import QtQuick 2.7
import QtQuick.Controls 2.2

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int curVal: -1
    property bool noRefresh: false
    anchors.fill: parent

    Timer
    {
        id: timer
        property bool flash: false
        interval: 500
        repeat: true
        running: true
        onTriggered: flash ^= 1;
    }

    Column
    {
        anchors.fill: parent
        Item
        {
            width:  parent.width
            height: parent.height / 2
            Rectangle
            {
                anchors.fill: parent
                color:  noRefresh?(timer.flash?"Salmon":fonColor):fonColor
                radius: parent.height
                Text
                {
                    anchors.fill: parent
                    text: "PRESET"
                    color: devColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment:   Text.AlignVCenter
                    font.bold: true
                    font.pixelSize: parent.height/1.5
                }
//                hoverEnabled: true
//                ToolTip.delay: 1000
//                ToolTip.text: "Refresh Map"
            }

            MouseArea
            {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked:
                {
                    _core.setValue("map_update", true);
                    noRefresh = false;
                }
                onEntered: toolTip.visible = true

                ToolTip
                {
                    id: toolTip
                    visible: false
//                    delay: 1000
                    timeout: 1000
                    parent: parent
                    text:   "Refresh Map"
                }
            }
        }
        Item
        {
            width:  parent.width
            height: parent.height /2
            Row
            {
                anchors.fill: parent
                Repeater
                {
                    anchors.fill: parent
                    model: 10
                    Item
                    {
                        width:  parent.width/10
                        height: parent.height
                        Rectangle
                        {
                            anchors.fill: parent
                            color: devColor
                        }
                        Text
                        {
                            anchors.fill: parent
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment:   Qt.AlignVCenter
                            text: index
                            color: index==curVal?"Salmon":fonColor
                            font.bold: true
                            font.pixelSize: parent.height/1.5
                        }
                    }
                }
            }
        }
    }


    Connections
    {
        target: _core
        onSgReadText:
        {
            if(nameParam==("open_port"))
                noRefresh = true;
        }
    }
}
