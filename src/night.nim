from nim_image_glitch_tool as m import nil

const cmdName: string = "night"
const description: string = "Night - Image GlitcH Tool written in Nim. (for study)"

when isMainModule:
  import docopt, tables, streams, strutils

  let doc = """
$description

Usage:
  $cmdName [real | safe] [<input>] [-o <output> | --output <output>]
  $cmdName (-h | --help)
  $cmdName (-v | --version)

Options:
  real                            Real glitch. 出力ファイルが壊れるかも。 (default)
  safe                            Safe glitch. 出力ファイルは壊れません。
  -o <output>, --output <output>  Output file. 省略時、標準出力へ書き出し。
  -h --help                       Show this screen.
  -v --version                    Show version.
""" % [ "cmdName", $cmdName, "description", $description ]

  let versionString = "$cmdName $version" % [ "cmdName", $cmdName, "version", $m.version ]

  let args = docopt(doc, version = $versionString)

  let inputStream = if args["<input>"]: newFileStream($args["<input>"], fmRead)
                    else: stdin.newFileStream
  let outputStream = if args["--output"]: newFileStream($args["--output"], fmWrite)
                     else: stdout.newFileStream

  if args["safe"]:
    m.sbtiGlitch(inputStream, outputStream)

  else:
    m.rawGlitch(inputStream, outputStream)

  inputStream.close
  outputStream.close