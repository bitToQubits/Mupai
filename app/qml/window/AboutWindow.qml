import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluWindow {

  id: window
  title: "Acerca de"
  width: 650
  height: 600
  minimumWidth: 600
  minimumHeight: 600
  maximumWidth: 600
  maximumHeight: 600
  launchMode: FluWindow.SingleTask

  FluAppBar {
    id: appbar
    title: "Acerca de Mupi"
    width: parent.width
  }

  ColumnLayout {
    anchors {
      top: appbar.bottom
      left: parent.left
      right: parent.right
    }

    RowLayout {
      Layout.topMargin: 20
      Layout.leftMargin: 15
      spacing: 14
      FluText {
        text: "Mu-Pai"
        fontStyle: FluText.Title
      }
      FluText {
        text: "v%1".arg(appInfo.version)
        fontStyle: FluText.Body
        Layout.alignment: Qt.AlignBottom
      }
    }

    RowLayout {
      spacing: 14
      Layout.topMargin: 20
      Layout.leftMargin: 15
      FluText {
        text: "Obtén respuestas instantaneas, encuentra inspiración creativa, aprende algo nuevo."
      }
    }

    RowLayout {
      id: respuestastxt
      spacing: 14
      Layout.leftMargin: 15
      Layout.topMargin: 15
      FluText {
        text: "Encuentra las respuestas que necesitas"
        font.bold: true
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Planea un viaje vacacional a Barcelona")
            Layout.preferredWidth: 300
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Cuentame una broma inteligente")
            Layout.preferredWidth: 280
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Ayudame con mi tarea")
            Layout.preferredWidth: 300
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Genera ideas para mi nuevo negocio")
            Layout.preferredWidth: 280
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Programa una calculadora")
            Layout.preferredWidth: 80
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Imagina una puesta de sol")
            Layout.preferredWidth: 80
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Genera un plan de estudio para Química I")
            Layout.preferredWidth: 300
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("¿Puedes realizar un cuento corto?")
            Layout.preferredWidth: 280
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Explica este código")
            Layout.preferredWidth: 300
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Hazme preguntas sobre historia")
            Layout.preferredWidth: 280
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Escribe un codigo de Python")
            Layout.preferredWidth: 300
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Imagina una montaña nevada")
            Layout.preferredWidth: 280
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Planea un tour escolar")
            Layout.preferredWidth: 300
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Traduce el siguiente texto al griego")
            Layout.preferredWidth: 280
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 5
      Layout.leftMargin: 7
      Layout.rightMargin: 7
      Layout.topMargin: 15

      ColumnLayout {
        FluArea {
          radius: 8
          width: 300
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Sugiere lugares para tomar fotos")
            Layout.preferredWidth: 300
            wrapMode: Text.WrapAnywhere
          }
        }
      }

      ColumnLayout {
        FluArea {
          radius: 8
          width: 280
          height: 30
          paddings: 8
          FluText {
            text: qsTr("Dame ideas para generar dinero")
            Layout.preferredWidth: 280
            wrapMode: Text.WrapAnywhere
          }
        }
      }
    }

    RowLayout {
      spacing: 14
      Layout.leftMargin: 15
      Layout.topMargin: 15
      FluText {
        id: text_desc
        text: "Copyrights @ 2023 Todos los derechos reservados | Mupai"
        font.bold: true
      }
    }
  }
}
