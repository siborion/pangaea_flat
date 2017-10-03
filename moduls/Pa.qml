import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string name:     "PA"

    property bool on: false
    anchors.fill: parent
    id: main
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
                height: parent.height/1000*70
                Common
                {
                    id:common
                    anchors.fill: parent
                    header: name
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*90
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*265
                TypePA
                {
                }
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*55
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: common.on
                    name: "VOLUME"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: common.on
                    name: "PRESENCE"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: common.on
                    name: "SLAVE"
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
