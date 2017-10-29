import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int curVal: -1
    anchors.fill: parent
    Row
    {
        anchors.fill: parent
        Item
        {
            width:  parent.width/2
            height: parent.height
            Rectangle
            {
                anchors.fill: parent
                color:  fonColor
                radius: parent.height
                Text
                {
                    anchors.fill: parent
                    text: "PRESET"
                    color: devColor
                    rotation: 270
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment:   Text.AlignVCenter
                    font.bold: true
                    font.pixelSize: parent.width/1.5
                }
            }
        }

        Item
        {
            width:  parent.width /2
            height: parent.height
            Column
            {
                anchors.fill: parent
                Repeater
                {
                    anchors.fill: parent
                    model: 10
                    Item
                    {
                        width:  parent.width
                        height: parent.height/10
                        Rectangle
                        {
                            anchors.fill: parent
                            color: devColor
                        }
                        Text
                        {
                            anchors.fill: parent
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment:   Qt.AlignVCenter
                            text: index
                            color: index==curVal?"Salmon":fonColor
                            font.bold: true
                            font.pixelSize: parent.width/1.5
                        }
                    }
                }
            }
        }
    }
}
