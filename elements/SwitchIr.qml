import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{

    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int   value: 1
    anchors.fill:  parent
    signal chValue(int value)

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
                value: main.value
                opacity: main.enabled?1:0.5
                onChValue: main.chValue(value)
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
                        onClicked: {mSwitch.value = 0; main.chValie(value);}
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
                        onClicked: {mSwitch.value =1; main.chValie(value)}
                    }
                }
            }
        }
    }
    function setValue(value)
    {
        mSwitch.value = value;
    }
}
