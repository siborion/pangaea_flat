import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"
Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int maxMapRow: 10
    anchors.fill: parent
    property int presetNom: 0

    property string  impulseNames: ""
    property variant impulseName:  impulseNames.split(',')

    property string  impulseEns: ""
    property variant impulseEn:  impulseEns.split(',')


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
                                curVal: (main.presetNom-mapHeadPreset.curVal)/maxMapRow
//                                curVal: main.presetNom/maxMapRow

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
                                curVal: main.presetNom%maxMapRow
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
                                        function clear()
                                        {
                                            mapRow.clear();
                                        }
                                        MapRow
                                        {
                                            id: mapRow
                                            nomRow: index
                                            presetNom: main.presetNom
                                            enabled: (index<main.maxMapRow)
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

    function clear()
    {
        var i;
        for(i=0;i<10;i++)
        {
            repeater.itemAt(i).clear();
        }
    }

    Connections
    {
        target: _core
        onSgReadValue:
        {
            if(nameParam=="read_bank")
                setEnImpuls(mapHeadPreset.curVal, value%maxMapRow, (value/maxMapRow)>=1);
            if(nameParam=="read_preset")
                setEnImpuls(value%maxMapRow, mapHeadBank.curVal, (value/maxMapRow)>=1);
            if(nameParam=="cabinet_enable")
                setImpulsOn(mapHeadPreset.curVal, mapHeadBank.curVal, value);
            if(nameParam==("type_dev"))
            {
                switch (value)
                {
                case 1: maxMapRow = 10;  break;
                case 2: maxMapRow = 4;  break;
                case 3: maxMapRow = 4; break;
                case 4: maxMapRow = 10; break;
                }
            }
        }
        onSgReadText:
        {
            if (nameParam=="impulse_names")
            {
                var i, j, kolvo, max=0;
                main.impulseNames = value;
                kolvo = main.impulseName.length;
                console.log("kolvo", kolvo);
                switch(kolvo)
                {
                case 17:  max=4;  break;
                case 101: max=10; break;
                }
                for(i=0; i<max; i++)
                {
                    for(j=0; j<max; j++)
                    {
                        console.log(i, j, main.impulseName[j*max+i]);
                        setEnImpulsName(i, j, main.impulseName[j*max+i]);
                    }
                }
            }

            if (nameParam=="impulse_en")
            {
                var i, j, kolvo, max=0;
                main.impulseEns = value;
                kolvo = main.impulseEn.length;
                console.log("kolvo", kolvo);
                switch(kolvo)
                {
                case 17:  max=4;  break;
                case 101: max=10; break;
                }
                for(i=0; i<max; i++)
                {
                    for(j=0; j<max; j++)
                    {
                        setImpulsOn(i, j, (main.impulseEn[j*max+i]=="01"));
                    }
                }
            }

            if (nameParam=="impulse_name")
            {
                console.log("impulse_name", mapHeadPreset.curVal, mapHeadBank.curVal, value);
//                setEnImpulsName(mapHeadPreset.curVal, mapHeadBank.curVal, value);
//                setEnImpuls(mapHeadPreset.curVal, mapHeadBank.curVal, value!="empty");
            }
            if(nameParam==("close_port"))
            {
                clear();
            }
        }
    }
}
