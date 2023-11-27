
function verificarInput(key) {
  if (key == '16777220' && textbox.key != '16777248') {
    var text = textbox.text.trim()
    if (text == '') {
      return
    }
    appendMessage(true, text)
    Chat.sendMessage(text)
    textbox.clear()
  }
  if (key != '16777220') {
    textbox.key = key
  }
}
