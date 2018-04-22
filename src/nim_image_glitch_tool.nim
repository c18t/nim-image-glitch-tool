import random, streams
import stb_image/read as stbi
import stb_image/write as stbiw

const version*: string = "0.1.0"

proc readStream(s: Stream): seq[byte] =
  result = newSeq[byte]()
  while s.atEnd:
    result.add(s.readInt8.byte)

proc writeStream(s: Stream, data: seq[byte]) =
  for val in data:
    s.write(val)

proc sbtiGlitch*(input, output: Stream) =
  var width, height, channels: int
  var data: seq[byte]
  data = stbi.loadFromMemory(input.readStream, width, height, channels, stbi.Default)

  for x in 0..width-1:
    for y in 0..height-1:
      let i = x+y*width
      let val = data[i]
        # TODO: rgbaの破壊

proc rawGlitchJpeg(input, output: Stream) =
  type bufArray = array[1024, byte]
  var buf: bufArray
  var readSize: int
  var skip: int = 0

  # TODO: jpeg構造の読み取り

  randomize()

  while (readSize = input.readData(buf.addr, 1024); readSize) != 0:
    let code: int = rand(readSize)
    if skip != 0:
      skip.dec
    else:
      for i in 0..readSize-1:
          if i == code:
            buf[i] = 0
            skip = 3
    output.writeData buf.addr, readSize

proc rawGlitch*(input, output: Stream, ext = "jpg") =
  case ext:
    of "jpg": rawGlitchJpeg(input, output)
    else: return
