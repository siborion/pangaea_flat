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
                            MapHeadPreset
                            {
                                id: mapHeadPresent
                                curVal: main.presetNom%10 //main.presetNom - (main.presetNom%10)*10
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
                            MapHeadBank
                            {
                                id: mapHeadBank
                                curVal: (main.presetNom-mapHeadPresent.curVal)/10
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
                                    model: 10
                                    Item
                                    {
                                        width: parent.width
                                        height: parent.height/10
                                        MapRow
                                        {
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
}
