import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int   value: mSwitch.value
    anchors.fill:  parent

    Rectangle
    {
        anchors.fill:  parent
        color: devColor
    }

    Row
    {
        anchors.fill:  parent
        Item
        {
            width:  parent.width/5*2
            height: parent.height
            Switch3v
            {
                id:    mSwitch
            }
        }

        Item
        {
            width:  parent.width/5*3
            height: parent.height
            Item
            {
                anchors.fill: parent
                Column
                {
                    anchors.fill:  parent
                    Item
                    {
                        width: parent.width
                        height: parent.height/5
                    }
                    Item
                    {
                        width: parent.width
                        height: parent.height/5
                        CheckText
                        {
                            text: "PH"
                            check: mSwitch.value==0
                            onClicked: mSwitch.value = 0
                            font.pixelSize: 10
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignHCenter
                        }
                    }

                    Item
                    {
                        width: parent.width
                        height: parent.height/5
                        CheckText
                        {
                            text: "LINE"
                            check: mSwitch.value==1
                            onClicked: mSwitch.value =1
                            font.pixelSize: 10
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignHCenter
                        }
                    }

                    Item
                    {
                        width: parent.width
                        height: parent.height/5
                        CheckText
                        {
                            text: "BAL"
                            check: mSwitch.value==2
                            onClicked: mSwitch.value =2
                            font.pixelSize: 10
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignHCenter
                        }
                    }
                    Item
                    {
                        width: parent.width
                        height: parent.height/3
                    }
                }
            }
        }
    }
}
