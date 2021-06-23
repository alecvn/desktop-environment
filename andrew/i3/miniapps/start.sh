#!/bin/bash

# two monitor setup
xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 3840x0 --auto --left-of eDP-1 --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal

# # single monitor setup
# xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal