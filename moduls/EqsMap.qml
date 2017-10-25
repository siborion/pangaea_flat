import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    id: main
    anchors.fill: parent
    property int presetNom: 0
    Column
    {
        anchors.fill: parent
        Item
        {
            height: parent.height/1000*80
            width:  parent.width
            SwitchEqMap
            {
                id: switchEnMap
            }
        }

        Item
        {
            height: parent.height/1000*920
            width:  parent.width
            MouseArea
            {
                anchors.fill: parent
                enabled: !switchEnMap.eqOn
                hoverEnabled: true
                cursorShape:  Qt.PointingHandCursor
                onClicked:
                {
                    if(!switchEnMap.eqOn)
                    {
                        switchEnMap.eqOn = true;
                        _core.setValue("eq_on", switchEnMap.eqOn)
                    }
                }
            }

            Eqs
            {
                on: switchEnMap.eqOn
                visible: !switchEnMap.map
            }

            Map
            {
                visible: switchEnMap.map
                anchors.fill: parent
                presetNom: main.presetNom
            }
        }
    }

    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((nameParam.indexOf("eq_on")>=0))
                switchEnMap.eqOn = value;
        }
    }

}
