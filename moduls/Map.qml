import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"
Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    anchors.fill: parent
    property int presetNom: 0
    Rectangle
    {
        anchors.fill: parent
        color: devColor
        MouseArea
        {
            anchors.fill: parent
        }

        Item
        {
            height: parent.height/1.1
            width:  parent.width/1.1
            anchors.centerIn: parent

            Row
            {
                anchors.fill: parent
                Item
                {
                    height: parent.height
                    width:  parent.width/11*1
                    Column
                    {
                        anchors.fill: parent
                        Item
                        {
                            height: parent.height/11*1
                            width:  parent.width
                        }

                        Item
                        {
                            height: parent.height/11*10
                            width:  parent.width
                            MapHeadBank
                            {
                                id: mapHeadBank
                                curVal: (main.presetNom-mapHeadPreset.curVal)/10
                            }
                        }
                    }
                }

                Item
                {

                    height: parent.height
                    width:  parent.width/11*10

                    Column
                    {
                        anchors.fill: parent
                        Item
                        {
                            width:  parent.width
                            height: parent.height/11*1
                            MapHeadPreset
                            {
                                id: mapHeadPreset
                                curVal: main.presetNom%10
                            }
                        }

                        Item
                        {
                            width:  parent.width
                            height: parent.height/11*10
                            Rectangle
                            {
                                anchors.fill: parent
                                color: devColor
                            }

                            Column
                            {
                                anchors.fill: parent
                                Repeater
                                {
                                    id: repeater
                                    model: 10
                                    Item
                                    {
                                        id: iMapRow
                                        width: parent.width
                                        height: parent.height/10
                                        function setOn(nomElement, on)
                                        {
                                            mapRow.setImpulsOn(nomElement, on)
                                        }
                                        function setEn(nomElement, en)
                                        {
                                            mapRow.setImpulsEn(nomElement, en)
                                        }
                                        function setName(nomElement, name)
                                        {
                                            mapRow.setImpulsName(nomElement, name)
                                        }
                                        MapRow
                                        {
                                            id: mapRow
                                            nomRow: index
                                            presetNom: main.presetNom
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    function setEnImpuls(bank, preset, en)
    {
        repeater.itemAt(preset).setEn(bank, en);
    }

    function setEnImpulsName(bank, preset, name)
    {
        repeater.itemAt(preset).setName(bank, name);
    }

    function setImpulsOn(bank, preset, on)
    {
        repeater.itemAt(preset).setOn(bank, on);
    }


    Connections
    {
        target: _core
        onSgReadValue:
        {
            if(nameParam=="read_bank")
                setEnImpuls(mapHeadPreset.curVal, value%10, (value/10)>=1);
            if(nameParam=="read_preset")
                setEnImpuls(value%10, mapHeadBank.curVal, (value/10)>=1);
            if(nameParam=="cabinet_enable")
                setImpulsOn(mapHeadPreset.curVal, mapHeadBank.curVal, value);
        }
        onSgReadText:
        {
            if (nameParam=="impulse_name")
            {
                setEnImpulsName(mapHeadPreset.curVal, mapHeadBank.curVal, value);
                setEnImpuls(mapHeadPreset.curVal, mapHeadBank.curVal, value!="empty");
            }
        }
    }
}
