import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"
Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    anchors.fill: parent
    Rectangle
    {
        anchors.fill: parent
        color: devColor

        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/11*1
                MapHeadBank
                {
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
                            }
                        }
                    }
                }
            }
        }
    }
}

