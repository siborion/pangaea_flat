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
    property int nomBand: 1

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
                    valueMin: -100
                    valueMax: 99
                    dispValue: Math.round(((value + 100) *0.1 + 0.11)*10)/10
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
                    property int toolMult: (nomBand==1)?1:   (nomBand==2)?1:   (nomBand==3)?2:   (nomBand==4)?10:   50
                    property int toolAdd:  (nomBand==1)?120: (nomBand==2)?360: (nomBand==3)?800: (nomBand==4)?2000: 6000
                    valueMin: -100
                    valueMax: 100
                    dispValue: toolAdd + toolMult*value

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
