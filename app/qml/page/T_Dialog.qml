import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import "../component"

FluScrollablePage{

    title:"Dialog"
    leftPadding:10
    rightPadding:10
    bottomPadding:20
    spacing: 0

    FluArea{
        Layout.fillWidth: true
        height: 68
        paddings: 10
        Layout.topMargin: 20
        FluButton{
            anchors.verticalCenter: parent.verticalCenter
            Layout.topMargin: 20
            text:"Show Double Button Dialog"
            onClicked: {
                double_btn_dialog.open()
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluContentDialog{
    id:dialog
    title:"Recordatorio amistoso"
    message:"¿Estás seguro de que quieres salir del programa?"
    negativeText:"Cancelar"
    buttonFlags: FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
    onNegativeClicked:{
        showSuccess("Haga clic en el botón cancelar")
    }
    positiveText:"Seguro"
    onPositiveClicked:{
        showSuccess("Haga clic en el botón Aceptar")
    }
    }
    dialog.open()'
    }

    FluContentDialog{
        id:double_btn_dialog
        title:"Recordatorio amistoso"
        message:"¿Estás seguro de que quieres salir del programa?"
        buttonFlags: FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
        negativeText:"Cancelar"
        onNegativeClicked:{
            showSuccess("Haga clic en el botón cancelar")
        }
        positiveText:"Seguro"
        onPositiveClicked:{
            showSuccess("Haga clic en el botón Aceptar")
        }
    }

    FluArea{
        Layout.fillWidth: true
        height: 68
        paddings: 10
        Layout.topMargin: 20
        FluButton{
            anchors.verticalCenter: parent.verticalCenter
            Layout.topMargin: 20
            text:"Show Triple Button Dialog"
            onClicked: {
                triple_btn_dialog.open()
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluContentDialog{
    id:dialog
    title:"Recordatorio amistoso"
    message:"¿Estás seguro de que quieres salir del programa?"
    negativeText:"Cancelar"
    buttonFlags: FluContentDialog.NeutralButton | FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
    negativeText:"Cancelar"
    onNegativeClicked:{
        showSuccess("Haga clic en el botón cancelar")
    }
    positiveText:"Seguro"
    onPositiveClicked:{
        showSuccess("Haga clic en el botón Aceptar")
    }
    neutralText:"Minimizar"
    onNeutralClicked:{
        showSuccess("Haga clic en el botón minimizar")
        }
    }
    dialog.open()'
    }

    FluContentDialog{
        id:triple_btn_dialog
        title:"Recordatorio amistoso"
        message:"¿Estás seguro de que quieres salir del programa?"
        buttonFlags: FluContentDialog.NeutralButton | FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
        negativeText:"Cancelar"
        onNegativeClicked:{
            showSuccess("Haga clic en el botón cancelar")
        }
        positiveText:"Seguro"
        onPositiveClicked:{
            showSuccess("Haga clic en el botón Aceptar")
        }
        neutralText:"Minimizar"
        onNeutralClicked:{
            showSuccess("Haga clic en el botón minimizar")
        }
    }
}
