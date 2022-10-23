#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# ribbon_top		ribbon_top_round		ribbon_bottom	 	ribbon_bottom_round
# ribbon_left		ribbon_left_round		ribbon_right		ribbon_right_round
# full_bottom		full_top				full_left			full_right

theme="ribbon_top_round"
dir="$HOME/.config/rofi/launchers/ribbon"

# dark
BG="#000000ff"
FG="#FFFFFFff"
SELECT="#101010ff"

# light
# BG="#FFFFFFff"
# FG="#000000ff"
#SELECT="#f3f3f3ff"

# styles=($(ls -p --hide="colors.rasi" $dir/styles))
# color="${styles[$(( $RANDOM % 8 ))]}"

source ~/.cache/wal/colors.sh
BORDER="$color6"
BORDER_ALT="$color5"
URGENT="$color2"
BG="$color0"
FG="$color8"
SELECT="#101010ff"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  selected:  $SELECT;
	  foreground:  $FG;
    foreground-alt:  $FG;
	  background:  $BG;
	  background-alt:  $BG;
    border:  $BORDER;
    border-alt:  $BORDER_ALT;
    urgent:  $URGENT;
	}
EOF

# comment this line to disable random colors
# sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
# themes=($(ls -p --hide="launcher.sh" --hide="styles" $dir))
# theme="${themes[$(( $RANDOM % 12 ))]}"

echo $dir/"$theme"
zensu rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
