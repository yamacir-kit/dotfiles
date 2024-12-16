#!/bin/bash -eux

# 5120x1440 29.96 Hz (CVT) hsync: 43.98 kHz; pclk: 292.75 MHz
sudo xrandr --newmode "5120x1440_30.00"  292.75  5120 5360 5888 6656  1440 1443 1453 1468 -hsync +vsync
sudo xrandr --addmode HDMI-1 "5120x1440_30.00"
