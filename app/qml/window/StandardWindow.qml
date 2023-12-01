import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import app.chat

FluWindow {

  id: editar_window
  title: "Editar titulo"
  width: 500
  height: 150
  minimumWidth: 500
  minimumHeight: 150
  maximumWidth: 500
  maximumHeight: 600
  launchMode: FluWindow.Standard

  property string _ID
  FluAppBar {
    id: appbar
    title: "Cambiar nombre"
    width: parent.width
  }

  FluTextBox {
    id: nuevoTitulo
    anchors.centerIn: parent
    placeholderText: qsTr("Titulo")
    width: parent.width * 0.9
  }

  FluButton {
    text: "Guardar"
    anchors.top: nuevoTitulo.bottom
    anchors.topMargin: 10
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width * 0.9
    onClicked: {
      if (nuevoTitulo.text !== "") {
        Chat.guardarTitulo(editar_window._ID, nuevoTitulo.text)
        if (!Chat.status_server) {
          showError("No se pudo conectar con el servidor", 3000)
          return
        }

        nuevoTitulo.text = ""
        editar_window.close()
      } else {
        showError("El titulo no puede estar vacio", 3000)
        return
      }
    }
  }

  Connections {
    target: Chat

    function onEditarChat(ID, nombre) {
      console.log("proporp", ID, nombre)
      editar_window._ID = ID
      nuevoTitulo.text = nombre
      nuevoTitulo.forceActiveFocus()
    }
  }
}
