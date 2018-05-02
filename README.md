# Night - Image GlitcH Tool written in Nim
Nimの練習に作成したグリッチツールです。何が起きても知らんがご利用はお好きにどうぞ

## Screenshot
![screenshot](https://raw.githubusercontent.com/c18t/nim-image-glitch-tool/master/doc/screenshot.png)

## Usage
```sh
$ night -h
Night - Image GlitcH Tool written in Nim. (for study)

Usage:
  night [real | safe] [<input>] [-o <output> | --output <output>]
  night (-h | --help)
  night (-v | --version)

Options:
  real                            Real glitch. 出力ファイルが壊れるかも。 (default)
  safe                            Safe glitch. 出力ファイルは壊れません。
  -o <output>, --output <output>  Output file. 省略時、標準出力へ書き出し。
  -h --help                       Show this screen.
  -v --version                    Show version.
```

## Feature
- both
  - filepath and pipeline support.
- `night real`
  - JPEG [WIP]
- `night safe`
  - JPEG [WIP]

## Install
1. [Install Nim](https://nim-lang.org/install.html)
1. stb_imageモジュールのインストール
    ```sh
    $ nimble install https://gitlab.com/define-private-public/stb_image-Nim.git
    ```
1. nightのインストール
    ```sh
    $ nimble install https://github.com/c18t/nim-image-glitch-tool.git
    ```
1. glitch!
    ```sh
    $ curl -L 'https://avatars2.githubusercontent.com/u/80503?s=400&v=4' | night | imgcat
    ```
 
## License
[WTFPL](./LICENSE)

## Auther
Uchi (/ɯ̹t͡ɕʲi/)
  - Twitter: [@c18t](https://twitter.com/c18t)
