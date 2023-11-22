import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import "../component"

FluScrollablePage{

    title:"Badge"

    leftPadding:10
    rightPadding:10
    bottomPadding:20
    spacing: 0

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 106
        paddings: 10

        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            FluText{
                text:"Por lo general, aparece en la esquina superior derecha del icono de notificación o avatar para mostrar la cantidad de mensajes que deben procesarse"
            }

            Row{
                spacing: 20
                Rectangle{
                    width: 40
                    height: 40
                    radius:  8
                    color: Qt.rgba(191/255,191/255,191/255,1)
                    FluBadge{
                        count:0
                    }
                }

                Rectangle{
                    width: 40
                    height: 40
                    radius:  8
                    color: Qt.rgba(191/255,191/255,191/255,1)
                    FluBadge{
                        count:5
                    }
                }
                Rectangle{
                    width: 40
                    height: 40
                    radius:  8
                    color: Qt.rgba(191/255,191/255,191/255,1)
                    FluBadge{
                        count:50
                    }
                }
                Rectangle{
                    width: 40
                    height: 40
                    radius:  8
                    color: Qt.rgba(191/255,191/255,191/255,1)
                    FluBadge{
                        count:100
                    }
                }
                Rectangle{
                    width: 40
                    height: 40
                    radius:  8
                    color: Qt.rgba(191/255,191/255,191/255,1)
                    FluBadge{
                        isDot:true
                    }
                }
                Rectangle{
                    width: 40
                    height: 40
                    radius:  8
                    color: Qt.rgba(191/255,191/255,191/255,1)
                    FluBadge{
                        count:99
                        color: Qt.rgba(250/255,173/255,20/255,1)
                    }
                }
                Rectangle{
                    width: 40
                    height: 40
                    radius:  8
                    color: Qt.rgba(191/255,191/255,191/255,1)
                    FluBadge{
                        count:99
                        color: Qt.rgba(82/255,196/255,26/255,1)
                    }
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'Rectangle{
    width: 40
    height: 40
    radius: 8
    color: Qt.rgba(191/255,191/255,191/255,1)
    FluBadge{
        count: 100
        isDot: false
        color: Qt.rgba(82/255,196/255,26/255,1)
    }
}'
    }

}
