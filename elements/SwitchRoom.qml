import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{

    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int   value: mSwitch.value
    anchors.fill:  parent

    Column
    {
        anchors.fill:  parent
        Item
        {
            width: parent.width
            height: parent.height/100*50
            Switch3
            {
                id:    mSwitch
                opacity: main.enabled?1:0.3
            }
        }

        Item
        {
            width: parent.width*0.9
            height: parent.height/100*50
            anchors.horizontalCenter: parent.horizontalCenter
            Column
            {
                anchors.fill:  parent
                Item
                {
                    width: parent.width
                    height: parent.height/3
                    CheckText
                    {
                        text: "SHORT"
                        check: mSwitch.value==0
                        onClicked: mSwitch.value = 0
                        font.pixelSize: height/1.4
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item
                {
                    width: parent.width
                    height: parent.height/3
                    CheckText
                    {
                        text: "MEDIUM"
                        check: mSwitch.value==1
                        onClicked: mSwitch.value =1
                        font.pixelSize: height/1.4
                    }
                }

                Item
                {
                    width: parent.width
                    height: parent.height/3
                    CheckText
                    {
                        text: "LONG"
                        check: mSwitch.value==2
                        onClicked: mSwitch.value =2
                        font.pixelSize: height/1.4
                        horizontalAlignment: Text.AlignRight
                    }
                }
            }
        }
    }
}
