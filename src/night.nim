from nim_image_glitch_tool as m import nil

const cmdName: string = "night"

when isMainModule:
  import docopt, tables, strutils

  let doc = """
$cmdName

Usage:
  $cmdName
  $cmdName (-h | --help)
  $cmdName (-v | --version)

Options:
  -h --help     Show this screen.
  -v --version  Show version.
""" % [ "cmdName", $cmdName ]

  let versionString = "$cmdName $version" % [ "cmdName", $cmdName, "version", $m.version ]

  let args = docopt(doc, version = $versionString)

  m.glitch()
