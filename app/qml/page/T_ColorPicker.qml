import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI
import "../component"

FluScrollablePage{

    title:"ColorPicker"
    leftPadding:10
    rightPadding:10
    bottomPadding:20
    spacing: 0

    FluArea{
        Layout.fillWidth: true
        height: 280
        Layout.topMargin: 20
        paddings: 10
        ColumnLayout{
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }
            FluText{
                text:"Este componente de color es un proyecto de código abierto en Github."
            }
            FluTextButton{
                leftPadding: 0
                rightPadding: 0
                text:"https://github.com/rshest/qml-colorpicker"
                onClicked: {
                    Qt.openUrlExternally(text)
                }
            }
            FluColorView{

            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluColorView{

}'
    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 60
        paddings: 10

        RowLayout{
            FluText{
                text:"Haga clic para seleccionar color->"
                Layout.alignment: Qt.AlignVCenter
            }
            FluColorPicker{

            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluColorPicker{

}'
    }

}

