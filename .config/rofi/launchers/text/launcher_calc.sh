#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4     style_5     style_6     style_7

theme="style_7"

dir="$HOME/.config/rofi/launchers/text"
# styles=($(ls -p --hide="colors.rasi" $dir/styles))
# color="${styles[$(( $RANDOM % 10 ))]}"

# dark
# BG="#000000ff"
# FG="#FFFFFFff"
# SELECT="#101010ff"

# light
# BG="#FFFFFFff"
# FG="#000000ff"
#SELECT="#f3f3f3ff"

# styles=($(ls -p --hide="colors.rasi" $dir/styles))
# color="${styles[$(( $RANDOM % 8 ))]}"

source ~/.cache/wal/colors.sh
ACCENT="$color5"
SELECT="$color6"
BG="$color0"
FG="$color8"

# overwrite colors file
cat > $dir/styles/colors.rasi <<- EOF
	/* colors */

  * {
    al:      #00000000;
    bg:      $BG;
    se:      $SELECT;
    fg:      $FG;
    ac:      $ACCENT;
  }
EOF

# comment this line to disable random colors
# sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
# themes=($(ls -p --hide="launcher.sh" --hide="styles" $dir))
# theme="${themes[$(( $RANDOM % 7 ))]}"

rofi -no-lazy-grab -show calc -modi calc -no-show-match -theme $dir/"$theme"
