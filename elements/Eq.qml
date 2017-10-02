import QtQuick 2.7
import QtQuick.Controls 1.5
import "../moduls/"

Item
{
    id: main
    anchors.fill: parent

    Common
    {
        id: common
        anchors.fill: parent
        header: ""
        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/5
            }

            Item
            {
                width:  parent.width
                height: parent.height/5
                Dial
                {
                    enabled: common.on
                    name: "VOLUME"
                }

            }
            Item
            {
                width:  parent.width
                height: parent.height/5*2
                Pot
                {

                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/5
                Dial
                {
                    enabled: common.on
                    name: "VOLUME"
                }
            }
        }
    }
}
