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
            height: parent.height/100*80
            Switch2
            {
                id:    mSwitch
                opacity: main.enabled?1:0.5
            }
        }

        Item
        {
            width: parent.width
            height: parent.height/100*20
            Row
            {
                anchors.fill:  parent
                Item
                {
                    width: parent.width/2
                    height: parent.height
                    CheckText
                    {
                        text: "On"
                        check: mSwitch.value==0
                        onClicked: mSwitch.value = 0
                    }
                }

                Item
                {
                    width: parent.width/2
                    height: parent.height
                    CheckText
                    {
                        text: "Off"
                        check: mSwitch.value==1
                        onClicked: mSwitch.value =1
                    }
                }
            }
        }
    }
}
