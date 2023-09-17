#!/bin/bash
#
# SPDX-License-Identifier: MIT
# Copyright © 2023 Apolo Pena
#
# hephaistos-gui.sh
# Description:
# Graphical User Interface to swap screen resolutions for the Hephaistos widescreen mod
# See https://github.com/nbusseneau/hephaistos
#
# Notes:
# This script is most useful on the steam deck so you can pach the screen back to 16:9 or 16:10
# Without having to go to desktop mode

ScreenResDialog(){
  zenity \
        --list \
        --width 600 \
        --height 290 \
        --title="Hephaistos Screen Resolution Patcher" \
        --text="Choose a screen resolution for Hephaistos to patch Hades to" \
        --radiolist \
        --print-column ALL \
        --column "Choose" \
        --column "Width" \
        --column "Height" \
        --column "Aspect Ratio" \
        --column "Description" \
        FALSE 1280 720 "16:9" "720p" \
        FALSE 1280 800 "16:10" "Steam Deck (800p Native)" \
        FALSE 2560 1080 "21:9 (64:27)" "WFHD - Ultrawide"\
        FALSE 2880 1200 "21:9 (12:5)" "WFHD+ - Ultrwide" \
        FALSE 2560 1400 "16:9" "QHD - Ultrwide" \
        FALSE 3440 1440 "21:9 (43:18)" "WQHD - Ultrawide"
}

ParseDimensions() {
  local width="$(echo "$1" | cut -d "|" -f 1)"
  local height="$(echo "$1" | cut -d "|" -f 2)"
  [[ -n "$width" && -n "$height" ]] && echo $width $height
}

Exec(){
  [[ -z "$1" ]] && exit

  local width=$1 height=$2
  ./hephaistos patch $width $height 2> /dev/null | \
    zenity --progress \
      --title="Hephaistos Patcher" \
      --text="Patching Hades to a screen resolution of ${width}x${height} using hephaistos..." \
      --percentage=0 \
      --pulsate \
      --auto-close \
      --width=600

  # If there was an error with the above command then repeat the command to display the error to a dialog
  # by redirecting stderr to stdout then redirect stdout to /dev/null (without changing where stderr is going)
  if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
    zenity --error --width 600 --title="Hephaistos Error:${PIPESTATUS[0]}"\
      --text="$(./hephaistos patch $width $height 2>&1 >/dev/null)"
    exit ${PIPESTATUS[0]}
  fi

  zenity --info \
       --title "Success!" \
       --width 600 \
       --height 100 \
       --text="Hades screen resolution is set to ${width}x${height}"
}

Exec $(ParseDimensions "$(ScreenResDialog)") &> /dev/null
