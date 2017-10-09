import QtQuick 2.7
import QtQuick.Controls 1.5
import "../moduls/"

Item
{
    id: main
    anchors.fill: parent
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
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
                onClicked: value=0
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
                onClicked: value=1
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
                onClicked: value=2
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
                onClicked: value=3
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
                onClicked: value=4
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
                onClicked: value=5
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
                onClicked: value=6
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
                onClicked: value=7
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
                onClicked: value=8
            }
        }
    }
}
