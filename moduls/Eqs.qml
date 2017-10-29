import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    id: main
    anchors.fill: parent
    property bool on: true
    property string nameValue: "eq_on"
    Row
    {
        anchors.fill: parent
        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                on: main.on
                dialFreq: "20 Hz 220"
                nomBand: 1
            }
        }
        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                on: main.on
                dialFreq: "260 Hz 460"
                nomBand: 2
            }
        }
        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                on: main.on
                dialFreq: "600 Hz 1k"
                nomBand: 3
            }
        }
        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                on: main.on
                dialFreq: "1k Hz 3k"
                nomBand: 4
            }
        }
        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                on: main.on
                dialFreq: "1k Hz 11k"
                nomBand: 5
            }
        }
    }
}
