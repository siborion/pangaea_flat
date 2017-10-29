import QtQuick 2.7
import QtQuick.Controls 1.5
import "../moduls/"

Item
{
    id: main
    anchors.fill: parent
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string nameValue: "amp_type"
    property int value: 0
    Column
    {
        anchors.fill: parent
        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "PP 6L6"
                check: (value==0)
                onClicked: {value=0; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "PP EL34"
                check: (value==1)
                onClicked: {main.value=1; core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "SE 6L6"
                check: (value==2)
                onClicked: {main.value=2; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "SE EL34"
                check: (value==3)
                onClicked: {main.value=3; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "AMT TC-3"
                check: (value==4)
                onClicked: {main.value=4; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "CALIF"
                check: (value==5)
                onClicked: {main.value=5; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "BRIT M"
                check: (value==6)
                onClicked: {main.value=6; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "BRIT L"
                check: (value==7)
                onClicked: {main.value=7; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/9
            CheckText
            {
                text:  "DEFAULT"
                check: (value==8)
                onClicked: {main.value=8; _core.setValue(main.nameValue, main.value)}
                onWheel: wheelChange(angleDelta);
            }
        }
    }


    function wheelChange(angleDelta)
    {
        if((angleDelta>0)&&(main.value<8))
            main.value++;
        if((angleDelta<0)&&(main.value>0))
            main.value--;
        _core.setValue(main.nameValue, main.value)
    }

    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((main.nameValue.length>0)&&(nameParam==main.nameValue))
                main.value=value;
        }
    }
}
