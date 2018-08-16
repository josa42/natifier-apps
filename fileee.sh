#!/bin/bash

curl -sS https://www.fileee.com/wp-content/themes/fileee/images/favicons/apple-touch-icon.png > icon.png

convert icon.png -resize 392x392 icon.png


convert icon.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,24 24,0 fill white circle 24,24 24,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite  icon.png

mogrify icon.png -bordercolor transparent -border 60 icon.png

nativefier 'https://my.fileee.com/' \
  --title-bar-style=hidden \
  --inject ./src/fileee.css \
  --inject ./src/fileee.js \
  --single-instance \
  --fast-quit \
  --icon ./icon.png \
  ./dest

  rm icon.png
  
