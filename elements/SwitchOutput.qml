import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{

    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int   value: mSwitch.value
    anchors.fill:  parent
    property string nameValue: "mode"
    
    Rectangle
    {
        anchors.fill:  parent
        color: devColor
    }


    Column
    {
        anchors.fill:  parent

        Item
        {
            width: parent.width
            height: parent.height/100*5
        }

        Item
        {
            width: parent.width
            height: parent.height/100*40
            Switch3
            {
                id:    mSwitch
                onChValue: send()
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
                        text: "PH"
                        check: mSwitch.value==0
                        onClicked: {mSwitch.value = 0; send();}
                    }
                }

                Item
                {
                    width: parent.width/2
                    height: parent.height
                    CheckText
                    {
                        text: "BAT"
                        check: mSwitch.value==2
                        onClicked: {mSwitch.value = 2; send();}
                    }
                }
            }
        }

        Item
        {
            width: parent.width
            height: parent.height/100*20
            CheckText
            {
                text: "LINE"
                check: mSwitch.value==1
                onClicked: {mSwitch.value = 1; send();}
            }
        }

        Item
        {
            width: parent.width
            height: parent.height/100*15
        }
    }

    function send()
    {
        _core.setValue(main.nameValue, mSwitch.value)
    }


    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((main.nameValue.length>0)&&(nameParam==main.nameValue))
                mSwitch.value=value;
        }
    }
}
