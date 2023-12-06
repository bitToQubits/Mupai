import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI
import "qrc:app/qml/global/"
import app.plantilla
import "community.js" as Logic
import app.user
import app.chat

Item {
  id: reporte_plantillas
  clip: true

  Component {
    id: com_item
    Item {
      width: 320
      height: 100
      FluArea {
        radius: 8
        width: 300
        height: 100
        anchors.centerIn: parent
        Rectangle {
          anchors.fill: parent
          radius: 8
          color: {
            if (FluTheme.dark) {
              if (item_mouse.containsMouse) {
                return Qt.rgba(1, 1, 1, 0.03)
              }
              return Qt.rgba(1, 1, 1, 0)
            } else {
              if (item_mouse.containsMouse) {
                return Qt.rgba(0, 0, 0, 0.03)
              }
              return Qt.rgba(0, 0, 0, 0)
            }
          }
        }
        Image {
          id: item_icon
          height: 40
          width: 40
          smooth: true
          source: {
            if (modelData.img == '0' || modelData.img == '') {
              return "qrc:app/res/image/control/RichTextBlock.png"
            } else {
              return "data:image/png;base64," + modelData.img
            }
          }
          anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
          }
          MouseArea {
            id: item_mouse
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
              //ItemsOriginal.navigationView.setCurrentIndex(2, 'footer_list')
              Chat.setear(modelData.ID, true, true)
              ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Chat.qml")
            }
          }
        }

        FluText {
          id: item_title
          text: modelData.nombre
          fontStyle: FluText.BodyStrong
          anchors {
            left: item_icon.right
            leftMargin: 20
            top: item_icon.top
          }
        }

        FluText {
          id: item_desc
          text: modelData.desc
          color: FluColors.Grey120
          wrapMode: Text.WrapAnywhere
          elide: Text.ElideRight
          fontStyle: FluText.Caption
          maximumLineCount: 2
          anchors {
            left: item_title.left
            right: parent.right
            rightMargin: 20
            top: item_title.bottom
            topMargin: 5
          }
        }

        Rectangle {
          height: 12
          width: 12
          radius: 6
          color: FluTheme.primaryColor.dark
          anchors {
            right: parent.right
            top: parent.top
            rightMargin: 14
            topMargin: 14
          }
          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
              menu_item.showMenu(modelData.ID, modelData.user_id)
            }
          }
        }
      }
    }
  }

  FluMenu {
    id: menu_item
    focus: false
    property int selectedPlantilla
    property int user_id

    FluMenuItem {
      visible: (menu_item.user_id == User.ID) ? true : false
      text: "Eliminar"
      onClicked: {
        confirmacion_eliminacion.open()
      }
    }

    FluMenuItem {
      visible: (menu_item.user_id == User.ID) ? true : false
      text: "Editar"
      onClicked: {
        Plantilla.setear(menu_item.selectedPlantilla, false)
        ItemsOriginal.navigationView.setCurrentIndex(0, 'footer_list')
        ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Template.qml")
      }
    }

    FluMenuItem {
      text: "Utilizar"
      onClicked: {
        Chat.setear(menu_item.selectedPlantilla, true, true)
        //ItemsOriginal.navigationView.setCurrentIndex(2, 'footer_list')
        ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Chat.qml")
      }
    }
    function showMenu(id, id_usuario) {
      menu_item.selectedPlantilla = id
      menu_item.user_id = id_usuario
      menu_item.popup()
    }
  }

  FluContentDialog {
    id: confirmacion_eliminacion
    title: "Eliminación"
    message: "¿Estas seguro de querer eliminar esta personalidad?"
    buttonFlags: FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
    negativeText: "No, cancelar"
    positiveText: "Si"
    onPositiveClicked: {
      if (Plantilla.eliminar(menu_item.selectedPlantilla)) {
        showSuccess("Personalidad eliminada correctamente")
        creadas_recientemente.model = undefined
        creadas_por_la_comunidad.model = undefined
        creadas_recientemente.model = Plantilla.getTemplates(false, 5)
        creadas_por_la_comunidad.model = Plantilla.getTemplates(true, 5)
      } else {
        showSuccess("Algo fue mal. Intentalo de nuevo.")
      }

      menu_item.close()
    }
  }

  FluText {
    id: titulo
    text: "Personalidades"
    fontStyle: FluText.Title
    anchors {
      top: parent.top
      topMargin: 20
      horizontalCenter: parent.horizontalCenter
    }
  }

  FluText {
    id: desc
    text: "Explora qué personalidades han creado otros usuarios"
    fontStyle: FluText.SubTitle
    font.bold: false
    anchors {
      top: titulo.bottom
      topMargin: 10
      horizontalCenter: titulo.horizontalCenter
    }
  }

  Item {
    id: busqueda
    anchors {
      horizontalCenter: titulo.horizontalCenter
      top: desc.bottom
      topMargin: 15
    }
    height: 40
    width: 320
    RowLayout {
      FluTextBox {
        id: text_box
        placeholderText: "Por favor, introduzca una palabra clave"
      }
      FluFilledButton {
        text: "Buscar"
        onClicked: {
          grid_view.model = Logic.buscar(text_box.text)
        }
      }
    }
  }

  GridView {
    id: grid_view
    ScrollBar.vertical: FluScrollBar {}
    width: parent.width / 1.2
    height: parent.height - 200
    anchors {
      horizontalCenter: parent.horizontalCenter
      top: busqueda.bottom
      topMargin: 15
    }
    clip: true
    cellHeight: 120
    cellWidth: 320
    model: {
      Logic.modelo = Plantilla.getTemplates(Plantilla.reporte_publico, -1)
      return Logic.modelo
    }
    delegate: com_item
  }
}
