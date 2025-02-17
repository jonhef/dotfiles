#!/bin/bash

# W I N D O W  T I T L E 
WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title')
WINDOW_APP=$(yabai -m query --windows --window | jq -r '.app')

if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_RES="$WINDOW_APP"
fi

if [[ ${#WINDOW_TITLE} -gt 40 ]]; then
  WINDOW_RES=$(echo "$WINDOW_APP – $WINDOW_TITLE" | cut -c 1-40)
  sketchybar -m --set ${NAME} label="$WINDOW_RES"…
  exit 0
fi

WINDOW_RES="${WINDOW_APP} – ${WINDOW_TITLE}"
echo $WINDOW_RES
if [ $WINDOW_TITLE -eq "" ]; then
  if [ $WINDOW_APP -eq "" ]; then
    sketchybar -m --set "${NAME}" label="Desktop"
    exit 0
  fi
  sketchybar -m --set "${NAME}" label="$WINDOW_APP"
  exit 0
fi
if [ $WINDOW_APP -eq "" ]; then
  sketchybar -m --set "${NAME}" label="$WINDOW_TITLE"
  exit 0
fi
sketchybar -m --set "${NAME}" label="$WINDOW_RES"
