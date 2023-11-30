import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluWindow {

  id: window
  title: "SingleTask"
  width: 500
  height: 600
  minimumWidth: 500
  minimumHeight: 600
  maximumWidth: 500
  maximumHeight: 600
  launchMode: FluWindow.SingleTask

  FluAppBar {
    id: appbar
    title: "SingleTask"
    width: parent.width
  }
}
