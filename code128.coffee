# I am sure there are plenty of barcode Code 128 modules
# out there on places like NPM etc. but I think this is
# supposed to be part of the test and I don't want to cheat 
# so I will do it from scratch

# lol after typing all of these in realized
# only needed about 10 of them.. hah

_128Cweights = [
  '212222', '222122','2222221', '121223',
  '121322', '131222', '122213', '122312',
  '132212', '221213', '221312', '231212',
  '112232', '122132', '122231', '113222',
  '123122', '123221', '223211', '221132',
  '221231', '213212', '223112', '312131',
  '311222', '321122', '321221', '312212',
  '322112', '322211', '212123', '212321',
  '232121', '111323', '131123', '131321',
  '112313', '132113', '132311', '211313',
  '231113', '231311', '112133', '112331',
  '132131', '113123', '113321', '133121',
  '313121', '211331', '231131', '213113'
  '213311', '213131', '311123', '311321',
  '331121', '312113', '312311', '332111',
  '314111', '221411', '431111', '111224'
  '111422', '121124', '121421', '141122',
  '141221', '112214', '112412', '122114',
  '122411', '142112', '142211', '241211',
  '221114', '413111', '241112', '134111',
  '111242', '121142', '121241', '114212',
  '124112', '124211', '411212', '421112',
  '421211', '212141', '214121', '412121',
  '111143', '111341', '131141', '114113',
  '114311', '411113', '411311', '113141',
  '114131', '311141', '411131', '211412',
  '211214', '211232', '2331112', '211133'    
]

# This handles Code 128 output only for code set C
class Code128C
  constructor: (@digitStr) ->
    @bits = ''
    @weights = ''
    @encode()

  toBitString: (digits) ->
    bits = ''
    for i in [0..digits.length-1]
      if i % 2 is 0 then bit='1' else bit='0'
      for b in [0..(digits[i]*1)-1]
        bits += bit
     bits

  start: ->
    @checkSum += 105
    _128Cweights[105]

  code: ->
    ret = ''
    for i in [0..@digitStr.length-1]
      codeForDigit = @digitStr[i]*1 + 16
      ret += _128Cweights[codeForDigit]
      @checkSum += codeForDigit*(i+1)
    ret

  check: ->
    @checkVal = @checkSum % 103
    _128Cweights[@checkVal]

  end: ->
    _128Cweights[106]

  encode: ->
    @checkSum = 0
    @weights = @start() + @code() + @check() + @end()
    @bits = @bitString()

  bitString: ->
    @toBitString @weights

  trueFalse: ->
    @encode()
    arr = []
    for i in [0..@bits.length-1]
      console.log @bits[i]
      if @bits[i] is '0'
        arr.push false
      else
        arr.push true
    arr


