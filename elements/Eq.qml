import QtQuick 2.7
import QtQuick.Controls 1.5
import "../moduls/"

Item
{
    id: main
    anchors.fill: parent
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"

    Rectangle
    {
        id: common
        anchors.fill: parent
        color: devColor

        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/1000*140
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
//                    enabled: common.on
                    name: "VOLUME"
                }

            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*505
                Pot
                {

                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    name: "VOLUME"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*25
            }
        }
    }
}
