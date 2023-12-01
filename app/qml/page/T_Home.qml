﻿import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import "qrc:app/qml/global/"
import FluentUI
import app.user
import app.chat
import app.plantilla

FluScrollablePage {

  leftPadding: 10
  rightPadding: 0
  bottomPadding: 20

  ListModel {
    id: model_header
    ListElement {
      icon: "qrc:images/Neumann.svg"
      title: "Neumann"
      desc: "Para conversaciones con profundidad intelectual y realización de tareas complejas."
      id_model: "neumann"
    }
    ListElement {
      icon: "qrc:images/Davinci.svg"
      title: "Davinci"
      desc: "Para creación de imagenes y generación de ideas creativas."
      id_model: "davinci"
    }
    ListElement {
      icon: "qrc:images/Chaplin.svg"
      title: "Chaplin"
      desc: "Para conversaciones casuales y divertidas."
      id_model: "chaplin"
    }
    ListElement {
      icon: "qrc:images/Mupiii.svg"
      title: "Mu-pi"
      desc: "Un modelo que aprende a medida que hablas con el."
      id_model: "mupi"
    }
  }

  Item {
    Layout.fillWidth: true
    height: 360
    Image {
      fillMode: Image.PreserveAspectCrop
      anchors.fill: parent
      verticalAlignment: Qt.AlignTop
      source: "qrc:app/res/image/bg_home_header.png"
    }
    Rectangle {
      anchors.fill: parent
      gradient: Gradient {
        GradientStop {
          position: 0.8
          color: FluTheme.dark ? Qt.rgba(0, 0, 0, 0) : Qt.rgba(1, 1, 1, 0)
        }
        GradientStop {
          position: 1.0
          color: FluTheme.dark ? Qt.rgba(0, 0, 0, 1) : Qt.rgba(1, 1, 1, 1)
        }
      }
    }
    FluText {
      id: encabezado
      text: {
        const horas = new Date().getHours()

        if (horas < 12 && horas >= 6) {
          return 'Buenos días ' + User.firstName
        } else if (horas >= 12 && horas <= 18) {
          return 'Buenas tardes ' + User.firstName
        } else {
          return 'Buenas noches ' + User.firstName
        }
      }
      fontStyle: FluText.Title
      anchors {
        top: parent.top
        left: parent.left
        topMargin: 20
        leftMargin: 20
      }
    }

    FluText {
      text: '¿Con quién quieres conversar?'
      font.pixelSize: 18
      anchors {
        top: encabezado.bottom
        left: parent.left
        topMargin: 20
        leftMargin: 20
      }
    }

    ListView {
      anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
      }
      orientation: ListView.Horizontal
      height: 240
      model: model_header
      header: Item {
        height: 10
        width: 10
      }
      footer: Item {
        height: 10
        width: 10
      }
      ScrollBar.horizontal: FluScrollBar {
        id: scrollbar_header
      }
      clip: false
      delegate: Item {
        width: 220
        height: 240
        FluArea {
          radius: 8
          width: 200
          height: 220
          anchors.centerIn: parent
          Rectangle {
            anchors.fill: parent
            radius: 8
            color: {
              if (FluTheme.dark) {
                if (item_mouse.containsMouse) {
                  return Qt.rgba(1, 1, 1, 0.03)
                }
                return Qt.rgba(0, 0, 0, 0)
              } else {
                if (item_mouse.containsMouse) {
                  return Qt.rgba(0, 0, 0, 0.03)
                }
                return Qt.rgba(0, 0, 0, 0)
              }
            }
          }

          ColumnLayout {
            Image {
              Layout.topMargin: 20
              Layout.leftMargin: 20
              Layout.preferredWidth: 50
              Layout.preferredHeight: 50
              source: model.icon
            }
            FluText {
              text: model.title
              fontStyle: FluText.Body
              Layout.topMargin: 20
              Layout.leftMargin: 20
            }
            FluText {
              text: model.desc
              Layout.topMargin: 5
              Layout.preferredWidth: 160
              Layout.leftMargin: 20
              color: FluColors.Grey120
              font.pixelSize: 12
              wrapMode: Text.WrapAnywhere
            }
          }
          FluIcon {
            iconSource: FluentIcons.OpenInNewWindow
            iconSize: 15
            anchors {
              bottom: parent.bottom
              right: parent.right
              rightMargin: 10
              bottomMargin: 10
            }
          }
          MouseArea {
            id: item_mouse
            anchors.fill: parent
            hoverEnabled: true
            onWheel: wheel => {
                       if (wheel.angleDelta.y > 0)
                       scrollbar_header.decrease()
                       else
                       scrollbar_header.increase()
                     }
            onClicked: {
              ItemsOriginal.navigationView.setCurrentIndex(2, 'footer_list')
              Chat.setear(model.id_model, true, false)
              ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Chat.qml")
            }
          }
        }
      }
    }
  }

  Component {
    id: com_item
    Item {
      width: 320
      height: 120
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
              return Qt.rgba(0, 0, 0, 0)
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
              ItemsOriginal.navigationView.setCurrentIndex(2, 'footer_list')
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
            id: details
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
        ItemsOriginal.navigationView.setCurrentIndex(2, 'footer_list')
        ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Chat.qml")
      }
    }

    FluMenuItem {
      visible: (menu_item.user_id == User.ID) ? true : false
      text: "Eliminar"
      onClicked: {
        confirmacion_eliminacion.open()
      }
    }

    function showMenu(id, id_usuario) {
      console.log(id_usuario, id, "id, id_usuario")
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
        creadas_por_la_comunidad.model = Plantilla.getTemplates(true, 8)
      } else {
        showSuccess("Algo fue mal. Intentalo de nuevo.")
      }

      menu_item.close()
    }
  }

  RowLayout {

    FluText {
      id: plantillas_recientes
      text: "Personalidades creadas recientemente"
      fontStyle: FluText.Title
      Layout.topMargin: 20
      Layout.leftMargin: 20
      wrapMode: Text.WrapAnywhere
      elide: Text.ElideRight
      Layout.preferredWidth: parent.width / 2
      Layout.fillWidth: true
    }

    Item {
      Layout.fillWidth: true
      Layout.maximumWidth: parent.width / 3
      Layout.rightMargin: 20
      FluButton {
        text: "Ver todas"
        anchors.right: agregar.left
        anchors.rightMargin: 20
        onClicked: {
          ItemsOriginal.navigationView.setCurrentIndex(0, 'footer_list')
          Plantilla.reporte_publico = false
          ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Community.qml")
        }
      }

      FluButton {
        id: agregar
        anchors.right: parent.right
        Text {
          id: text_icon
          font.family: "Segoe Fluent Icons"
          font.pixelSize: 15
          width: 15
          height: 15
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          anchors.centerIn: parent
          color: FluTheme.dark ? Qt.rgba(1, 1, 1, 1) : Qt.rgba(0, 0, 0, 1)
          text: (String.fromCharCode(FluentIcons.AddBold).toString(16))
        }
        onClicked: {
          Plantilla.setear(0, true)
          ItemsOriginal.navigationView.setCurrentIndex(0, 'footer_list')
          ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Template.qml")
        }
      }
    }
  }

  GridView {
    id: creadas_recientemente
    Layout.fillWidth: true
    implicitHeight: contentHeight
    cellHeight: 120
    cellWidth: 320
    model: Plantilla.getTemplates(false, 5)
    interactive: false
    delegate: com_item
  }

  FluText {
    text: "Todavia no has creado ninguna personalidad"
    fontStyle: FluText.SubTitle
    font.bold: false
    visible: (creadas_recientemente.model.length === 0) ? true : false
    Layout.leftMargin: 20
    Layout.topMargin: 20
  }

  RowLayout {

    FluText {
      text: "Personalidades creadas por la comunidad"
      fontStyle: FluText.Title
      Layout.topMargin: 20
      Layout.leftMargin: 20
      wrapMode: Text.WrapAnywhere
      elide: Text.ElideRight
      Layout.preferredWidth: parent.width / 1.8
      Layout.fillWidth: true
    }

    Item {
      Layout.fillWidth: true
      Layout.maximumWidth: parent.width / 3
      Layout.rightMargin: 20
      FluButton {
        text: "Ver todas"
        anchors.right: parent.right
        anchors.rightMargin: 20
        onClicked: {
          ItemsOriginal.navigationView.setCurrentIndex(0, 'footer_list')
          Plantilla.reporte_publico = true
          ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Community.qml")
        }
      }
    }
  }
  GridView {
    id: creadas_por_la_comunidad
    Layout.fillWidth: true
    implicitHeight: contentHeight
    cellHeight: 120
    cellWidth: 320
    interactive: false
    model: Plantilla.getTemplates(true, 8)
    delegate: com_item
  }

  FluText {
    text: "Todavia no hay personalidades creadas por la comunidad"
    fontStyle: FluText.SubTitle
    font.bold: false
    visible: (creadas_por_la_comunidad.model.length === 0) ? true : false
    Layout.leftMargin: 20
    Layout.topMargin: 20
  }
}
