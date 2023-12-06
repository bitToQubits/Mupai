import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI
import "qrc:app/qml/global/"
import app.graficos
import QtCharts 2.6

Item {
  FluText {
    id: titulo
    text: "Tus personalidades"
    fontStyle: FluText.Title
    anchors {
      top: parent.top
      topMargin: 20
      horizontalCenter: parent.horizontalCenter
    }
  }

  FluText {
    id: desc
    text: "Visualiza cuales son las personalidades que definen tu perfil."
    fontStyle: FluText.SubTitle
    font.bold: false
    anchors {
      top: titulo.bottom
      topMargin: 10
      horizontalCenter: titulo.horizontalCenter
    }
  }

  ChartView {
    id: chart
    anchors {
      top: desc.bottom
      topMargin: 10
      left: parent.left
      right: parent.right
      bottom: parent.bottom
      bottomMargin: 10
      leftMargin: 20
      rightMargin: 20
    }
    theme: ChartView.ChartThemeLight
    legend.alignment: Qt.AlignBottom
    antialiasing: true

    property variant othersSlice: 0

    PieSeries {
      id: personalidades
    }

    //Make a connection when response data changed
    Connections {
      target: personalidades

      function onHovered(slice, state) {
        if (state) {
          slice.labelVisible = true
        } else {
          slice.labelVisible = false
        }
      }

      function onPressed(slice) {
        slice.exploded = true
      }

      function onReleased(slice) {
        slice.exploded = false
      }
    }

    Component.onCompleted: {
      Graficos.getData()
      for (var i = 0; i < Graficos.numeros.length; i++) {
        personalidades.append(
              Graficos.nombres[i] + " (" + Graficos.numeros[i] + ")",
              Graficos.numeros[i])
      }
    }
  }
}
