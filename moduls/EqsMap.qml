import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    id: main
    anchors.fill: parent
    Column
    {
        anchors.fill: parent
        Item
        {
            height: parent.height/1000*100
            width:  parent.width
            SwitchEqMap
            {
                id: switchEnMap

            }
        }

        Item
        {
            height: parent.height/1000*900
            width:  parent.width
            Eqs
            {
                on: switchEnMap.eqOn
                visible: !switchEnMap.map
                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape:  Qt.PointingHandCursor
                    onClicked:
                    {
                        if(!switchEnMap.eqOn)
                            switchEnMap.eqOn = true;
                    }
                }
            }
            Map
            {
                visible: switchEnMap.map
            }
        }
    }
}
