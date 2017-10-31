import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string devColorDis: "#7E7991"
    property bool   map: false
    property bool   eqOn: false
    anchors.fill:  parent

    Canvas
    {
        id: eqCanvas
        anchors.fill: parent
        visible: !main.map
        onPaint:
        {
            var ctx = getContext("2d")
            ctx.lineWidth = 4
            ctx.strokeStyle = eqOn?devColor:devColorDis
            ctx.fillStyle =   eqOn?devColor:devColorDis
            ctx.beginPath()
            ctx.moveTo(0,            0)
            ctx.lineTo(parent.width/2-parent.width/30, 0)
            ctx.lineTo(parent.width/2+parent.width/30, parent.height)
            ctx.lineTo(0,            parent.height)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
        }
    }
    Text
    {
        width:  parent.width/2
        height: parent.height
        anchors.left: parent.left
        text: "EQ"
        font.bold: true
        font.pixelSize: parent.height/1.8
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:   Text.AlignVCenter
        color: eqOn?"Salmon":(main.map?devColor:fonColor)
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked:
            {
                if( main.map)
                    main.map=false;
                else
                {
                    eqOn ^= 1;
                    _core.setValue("eq_on", eqOn);
                    eqCanvas.requestPaint();
                }
            }
        }
    }


    Canvas
    {
        id: mapCanvas
        anchors.fill: parent
        visible:  main.map
        onPaint:
        {
            var ctx = getContext("2d")
            ctx.lineWidth = 4
            ctx.strokeStyle = devColor
            ctx.fillStyle =   devColor
            ctx.beginPath()
            ctx.moveTo(parent.width,    0)
            ctx.lineTo(parent.width,    parent.height)
            ctx.lineTo(parent.width/2-parent.width/30, parent.height)
            ctx.lineTo(parent.width/2+parent.width/30, 0)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
        }
    }
    Text
    {
        width:  parent.width/2
        height: parent.height
        anchors.right: parent.right
        text: "MAP"
        font.bold: true
        font.pixelSize: parent.height/1.8
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:   Text.AlignVCenter
        color: main.map?fonColor:devColor
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked:
            {
                main.map=true;
                mapCanvas.requestPaint();
                eqCanvas.requestPaint();
            }
        }
    }

    Connections
    {
        target: _core
        onSgReadValue:
        {
//            if((nameParam.indexOf("eq_on")>=0))
//                main.value=value;
        }
    }
}
