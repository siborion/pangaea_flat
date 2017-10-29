import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int curVal: -1
    anchors.fill: parent

    Column
    {
        anchors.fill: parent
        Item
        {
            width:  parent.width
            height: parent.height / 2
            Rectangle
            {
                anchors.fill: parent
                color:  fonColor
                radius: parent.height
                Text
                {
                    anchors.fill: parent
                    text: "BANK"
                    color: devColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment:   Text.AlignVCenter
                    font.bold: true
                    font.pixelSize: parent.height/1.5
                }
            }
        }
        Item
        {
            width:  parent.width
            height: parent.height /2
            Row
            {
                anchors.fill: parent
                Repeater
                {
                    anchors.fill: parent
                    model: 10
                    Item
                    {
                        width:  parent.width/10
                        height: parent.height
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
                            font.pixelSize: parent.height/1.5
                        }
                    }
                }
            }
        }
    }
}
