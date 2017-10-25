import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{

    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int   value: mSwitch.value
    anchors.fill:  parent
    property string nameValue: "eq_pre"
    
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
            Switch2
            {
                id:    mSwitch
                onChValue: _core.setValue(main.nameValue, mSwitch.value)
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
                        text: "POST"
                        check: mSwitch.value==0
                        onClicked:
                        {
                            mSwitch.value = 0;
                            _core.setValue(main.nameValue, mSwitch.value)
                        }
                    }
                }

                Item
                {
                    width: parent.width/2
                    height: parent.height
                    CheckText
                    {
                        text: "PRE"
                        check: mSwitch.value==1
                        onClicked:
                        {
                            mSwitch.value = 1;
                            _core.setValue(main.nameValue, mSwitch.value)
                        }
                    }
                }
            }
        }

        Item
        {
            width: parent.width
            height: parent.height/100*20
            Text
            {
                anchors.fill: parent
                text: "EQ"
                color: fonColor
                font.family: "Arial Black"
                font.bold: true
                font.pixelSize: parent.height/1.5
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }
        }

        Item
        {
            width: parent.width
            height: parent.height/100*15
            Rectangle
            {
                anchors.fill:  parent
                color: devColor
            }
        }
    }

    Connections
    {
        target: _core
    }


}
