alias finder="open ~"
alias openvpn="/Applications/OpenVPN\ Connect.app/Contents/MacOS/OpenVPN\ Connect.app"
alias terminal="kitty --single-instance --instance-group jonhef"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
alias settings="open /System/Applications/System\ Settings.app"
alias telegram="open /Applications/Telegram\ Lite.app"
alias calendar="open /System/Applications/Calendar.app"
alias qutebrowser="open /Applications/qutebrowser.app"
alias kitty="kitty --single-instance --instance-group jonhef"
cd ~
fastfetch
PATH=$PATH:~/.local/bin
export LIBRARY_PATH=/opt/homebrew/Cellar/opencv/4.10.0_12/lib:$LIBRARY_PATH
if [[ $TERM == "xterm-kitty" ]]; then
  eval "$(blaze zsh --init)"
else
  :
fi

# convert webp to png
convert_webp() {
  echo "Converting WebP to PNG"
  for i in *
  do

  if [[ "${i##*.}" == "webp" ]]; then

      echo "WEBP FILE => $i"

      # show filename
      filename="${i%.*}"

      # show Extension
      extension="${i##*.}"

      ## webp converter
      ffmpeg -i "$filename" "$filename.png"

    fi
  done
  }
