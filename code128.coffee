# I am sure there are plenty of barcode Code 128 modules
# out there on places like NPM etc. but I think this is
# supposed to be part of the test and I don't want to cheat 
# so I will do it from scratch

_128Cweights = [
  
]

# odesk project started but odesk team is not set up yet
# so I am going to finish in screencast
# will save this as part 1

# This handles Code 128 output only for code set C
class Code128C
  constructor: (@digitArray) ->
    @bits = ''

  start: ->
    

  code: ->


  check: ->


  end: -> 


  encode: ->
    @bits = @start() + @code() + @check() + @end()

  trueFalseArray: ->
    @encode()
    arr = []
    for i in [0..@bits.length-1]
      if @bits[i] is '0' then arr.push 0 else arr.push 1
    return arr



