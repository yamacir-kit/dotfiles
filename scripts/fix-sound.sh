#!/bin/sh

sudo killall pulseaudio

sudo pulseaudio -k

sudo rm -r ~/.config/pulse/*
# sudo rm -r ~/.pulse*

pulseaudio --start
