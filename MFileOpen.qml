import QtQuick 2.9
import QtQuick.Dialogs 1.2
import Qt.labs.folderlistmodel 2.2
import QtQuick.Controls 1.4

Dialog
{
    width:  800
    height: 600
    id : msg
    title: "Select impulse"
    standardButtons: StandardButton.Ok | StandardButton.Cancel
    property bool folderUp: false
    property string sTmp
    property string curFolderTxt: dataModel.folder

    Item
    {
        width:   parent.width
        height:  parent.height
        Column
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:   parent.verticalCenter
            height: parent.height
            width:  parent.width
            Item
            {
                height: parent.height/20*2
                width:  parent.width
                MDrivers
                {
                    id: mDrivers
                    onSgSetDrive:
                    {
                        if(drive=="/")
                            dataModel.folder =  "file:/" ;
                        else
                            dataModel.folder =  "file:/" + drive ;
                    }
                }
            }

            Item
            {
                height: parent.height/20*1
                width:  parent.width
                Text
                {
                    id: mText
                    text: curFolderTxt
                }
            }

            Item
            {
                height: parent.height/20*16
                width:  parent.width
                Rectangle
                {
                    width:   parent.width
                    height:  parent.height

                    FolderListModel
                    {
                        id: dataModel
                        showDirs:      true
                        showDirsFirst: true
                        showDotAndDotDot: true
                        showHidden: true
                        nameFilters: ["*.wav"]
                        onFolderChanged:
                        {
                            console.log("updateFolders");
                            if(msg.folderUp)
                            {
                                var previosRow;
                                previosRow = _core.getFolderPos();
                                view.selection.clear();
                                view.selection.select(previosRow,previosRow);
                                view.positionViewAtRow(previosRow, ListView.Center);
                                msg.folderUp = false;
                            }
                        }
                    }

                    TableView
                    {
                        id: view
                        anchors.margins: 10
                        anchors.fill: parent
                        model: dataModel
                        clip: true


                        TableViewColumn {
                            width: 300
                            title: "Name"
                            role: "fileName"
                        }
                        TableViewColumn {
                            width: 100
                            title: "Size"
                            role: "fileSize"
                        }
                        TableViewColumn {
                            width: 100
                            title: "Modified"
                            role: "fileModified"
                        }

                        itemDelegate:Item
                        {
                            Text
                            {
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                renderType: Text.NativeRendering
                                text: styleData.value
                                color: dataModel.get(styleData.row,"fileIsDir") ? "blue" : "black"
                            }
                        }

                        onCurrentRowChanged:
                        {
                            var idRow;
                            idRow = view.currentRow
                            mWarning.text = ""
                            if(!dataModel.get(idRow,"fileIsDir"))
                            {
                                mBusy.busy = true;
                                view.enabled = false;
                                _core.setImpuls(dataModel.get(view.currentRow,"filePath"), dataModel.get(view.currentRow,"fileName"));
                            }
                        }

                        onDoubleClicked:
                        {
                            var str, idRow;
                            idRow = view.currentRow
                            if(dataModel.get(idRow,"fileIsDir"))
                            {
                                str = "..";
                                if(dataModel.get(idRow,"fileName") == ".")
                                {
                                    if(curFolderTxt.length>8)
                                    {
                                        dataModel.folder = dataModel.parentFolder
                                        msg.folderUp = true;
                                    }
                                }
                                else
                                {
                                    if(dataModel.get(idRow,"fileName") == "..")
                                    {
                                        if(curFolderTxt.length>8)
                                        {
                                            dataModel.folder = dataModel.parentFolder
                                            msg.folderUp = true;
                                        }
                                    }
                                    else
                                    {
//                                        if(dataModel.get(idRow,"fileSize") != 0)
                                        {
                                            if((dataModel.folder.toString().lastIndexOf("/")+1) == dataModel.folder.toString().length)
                                            {
                                                _core.setFolderPos(idRow);
                                                dataModel.folder = dataModel.folder + dataModel.get(idRow,"fileName");
                                                view.selection.clear();
                                                view.selection.select(0,0);
                                            }
                                            else
                                            {
                                                _core.setFolderPos(idRow);
                                                dataModel.folder = dataModel.folder + "/" + dataModel.get(idRow,"fileName");
                                                view.selection.clear();
                                                view.selection.select(0,0);
                                            }
                                        }
                                    }
                                }
                                _core.setLastPath(dataModel.folder);
                            }
                        }
                    }
                }
            }

            Item
            {
                height: parent.height/20*1
                width:  parent.width
                Text
                {
                    id: mWarning
                    text: ""
                    color: "Red"
                }
            }
        }

        MBusy
        {
            id: mBusy
        }
    }

    onAccepted:
    {

    }

    onRejected:
    {
        _core.slEscImpuls();
    }

    onVisibleChanged:
    {
        if(msg.visible)
        {
            mDrivers.refreshDrivers();
            dataModel.folder = _core.getLastPath();
        }
    }

    Connections
    {
        target: _core
        onSgSetWait:
        {
            mBusy.busy = wait;
            view.enabled  = (!wait);
        }
        onSgNotSupport:
        {
            mWarning.text = "Invalid file format. Required 48 kHz/24 bits/Mono"
        }
    }

}
