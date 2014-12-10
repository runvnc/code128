
button = document.getElementById 'go'

button.addEventListener 'click', ->
  barcodeDemo = new Code128Overlay
    targetDiv: 'dispcode', 
    value: '02312'
