
dbg = ''

window.debug = (msg) ->
  dbg = msg + '<br>' + dbg
  document.getElementById('msg').innerHTML= dbg

window.onerror = (err) ->
  debug(err)

button = document.getElementById 'go'

barcodeDemo = null

button.addEventListener 'click', ->
  if barcodeDemo? then barcodeDemo.stop()
  val = document.getElementById('val').value
  barcodeDemo = new Code128Overlay
    targetDiv: 'dispcode',
    value: val
