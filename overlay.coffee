blockWidth = 32
blockHeight = 32

maxBlocksAtOnce = 4
blockDisplayTimeMS = 300

class Code128Overlay
  constructor: (options) ->
    @divid = options.targetDiv
    @value = options.value
    @calcCode()
    @init()
    @run()

  calcCode: ->
    barcode = new Code128C(@value)
    debug(barcode.bitString())
    @blocks = barcode.trueFalse()

  init: ->
    @startBlock = 0
    @canvas = document.createElement 'canvas'
    @div = document.getElementById @divid
    @canvas.id = "Code128Overlay"
    size = blockWidth * maxBlocksAtOnce
    @canvas.width = size
    @canvas.height = blockWidth
    @canvas.style.zIndex   = 8
    @canvas.style.position = "absolute"
    @canvas.style.border = "1px solid green"
    @div.appendChild(@canvas)

  drawBlock: (isOn, pos) =>
    #debug isOn
    ctx = @canvas.getContext('2d')
    if isOn then color = 'black' else color='white'
    ctx.fillStyle = color
    ctx.fillRect pos*blockWidth, 0, (pos+1)*blockWidth, blockHeight

  update: =>
    ctx = @canvas.getContext('2d')
    ctx.clearRect 0,0, @canvas.width, @canvas.height
    for i in [0..maxBlocksAtOnce]
      index = @startBlock + i
      if index < @blocks.length
        @drawBlock @blocks[index], i
     @startBlock += maxBlocksAtOnce
     if @startBlock >= @blocks.length
       @startBlock = 0
 
  run: ->
    @int = setInterval @update, blockDisplayTimeMS

  stop: =>
    clearInterval @int

window.Code128Overlay = Code128Overlay

