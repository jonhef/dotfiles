#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  [7-9][0-9]|100) ICON="􀛨" color=0xff40a02b
  ;;
  # [7-8][0-9]) ICON="􀛨" color=0xff40a02b
  # ;;
  [5-6][0-9]) ICON="􀺸" color=0xffcad3f5
  ;;
  [3-4][0-9]) ICON="􀺶" color=0xffcad3f5
  ;;
  2[0-9]) ICON="􀛩" color=0xffcad3f5
  ;;
  1[0-9]) ICON="􀛩" color=0xffcad3f5
  ;;
  [0-9]) ICON="􀛩" color=0xffe64553
  ;;
  *) ICON="􀛪" color=0xffd20f39
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋" color=0xff179299
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" icon.color=$color label="${PERCENTAGE}%"
