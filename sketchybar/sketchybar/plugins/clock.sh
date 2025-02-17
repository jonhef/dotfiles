#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

dayofyear=$((10#$( date '+%j' ) ))
echo $dayofyear

monthday=$(( $dayofyear % 28 ))
echo $monthday
month=$(( $dayofyear / 28 ))
if [ $monthday -ne 0 ]; then
  month=$(( $month + 1 ))
fi

if [ $monthday -eq 0 ]; then
  monthday=28
fi
if [ $month -eq 1 ]; then
  montht="I"
elif [ $month -eq 2 ]; then
  montht="II"
elif [ $month -eq 3 ]; then
  montht="III"
elif [ $month -eq 4 ]; then
  montht="IV"
elif [ $month -eq 5 ]; then
  montht="V"
elif [ $month -eq 6 ]; then
  montht="VI"
elif [ $month -eq 7 ]; then
  montht="VII"
elif [ $month -eq 8 ]; then
  montht="VIII"
elif [ $month -eq 9 ]; then
  montht="IX"
elif [ $month -eq 10 ]; then
  montht="X"
elif [ $month -eq 11 ]; then
  montht="XI"
elif [ $month -eq 12 ]; then
  montht="XII"
elif [ $month -eq 13 ]; then
  montht="XIII"
fi

year=$(( $(date "+%Y") - 2009 ))

hour=$(date "+%H")
min=$(date "+%M")

sketchybar --set "$NAME" label="$monthday$montht$year $hour:$min"

