# Flow

- we need to copy file which needs to be translated from vanilla_en to vanilla
- we translate it as is in utf-8 format in out favorite editor
- decoder will convert it according to associations.txt
- decoder will iconv (convert it to CP437)
- decoder will move it to russian translation output folder (see Note)

## Note

- vanilla_en - english sources
- vanilla - russian translation output

# Decoder usage

ruby decoder.rb

# associations.txt format

RUSSIAN_LETTER|PNG_COORDINATES
