# Package

version       = "0.1.1"
author        = "\xE9\xB5\x9C\xE5\xB7\xB7"
description   = "Image Glitch Tool written in Nim. (for study)"
license       = "WTFPL"
srcDir        = "src"
bin           = @["night"]
skipFiles     = @["night.nim"]

# Dependencies

requires "nim >= 0.18.0"
requires "docopt >= 0.6.5"
requires "stb_image >= 2.1"