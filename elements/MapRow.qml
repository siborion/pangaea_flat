import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int nomRow:0
    anchors.fill: parent
    Row
    {
        anchors.fill: parent
        Repeater
        {
            anchors.fill: parent
            model: 10
            Item
            {
                width:  main.width/10
                height: main.height

                Rectangle
                {
                    property int minSize: Math.min(parent.width, parent.height)
                    anchors.centerIn: parent
                    width:  minSize/2
                    height: minSize/2
                    radius: minSize/2
                    objectName: index
                    color: devColor
                    border.color: fonColor
                    border.width: 3
//                    Text
//                    {
//                        id: txt
//                        anchors.fill: parent
//                        text: nomRow*10 + index
//                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            //                                        console.log(parent.objectName.toString());
                        }
                    }
                }
            }
        }
    }
}
