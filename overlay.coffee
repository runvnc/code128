blockWidth = 32
blockHeight = 32

maxBlocksAtOnce = 4
blockDisplayTimeMS = 300

class Code128Overlay
  constructor: (options) ->
    @div = options.targetDiv
    @value = options.value
    @calcCode()
    @init()
    @run()

  calcCode: ->
    barcode = new Code123C(@value) 
    @blocks = barcode.trueFalse() 

  init: ->
    @startBlock = 0
    @canvas = document.createElement 'canvas'
    @div = document.getElementById id
    @canvas.id = "Code128Overlay"
    size = blockWidth * maxBlocksAtOnce
    @canvas.width = size
    @canvas.height = size
    @canvas.style.zIndex   = 8
    @canvas.style.position = "absolute"
    @canvas.style.border = "none"
    @div.appendChild(canvas)

  drawBlock: (isOn, position) ->
    ctx = @canvas.getContext('2d')
    if isOn then color='black' else color='white'
    ctx.setFillStyle color
    ctx.fillRect pos*blockWidth, 0, (pos+1)*blockWidth, blockHeight

  update:->
    for i in [0..@maxBlocksAtOnce]
      index = @startBlock + i
      if index < @blocks.length
        @drawBlock @blocks[index], i
     @startBlock += @maxBlocksAtOnce
     if @startBlock >= @blocks.length
       @startBlock = 0
 

  run: ->
    @int = setInterval @update, blockDisplayTimeMS

