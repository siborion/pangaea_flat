import QtQuick 2.7
import QtQuick.Controls 1.5
import "../moduls/"

Item
{
    id: main
    anchors.fill: parent
    property string dialFreq: "20 Hz 220"
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
                    checkable: false
                    name: "0.1 - 20"
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
                    checkable: false
                    name: dialFreq
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
