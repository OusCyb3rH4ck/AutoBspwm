#!/bin/bash

ip_address=$(cat /home/ouscyb3rh4ck/.config/bin/target | awk '{print $1}')

if [ $ip_address ]; then
    echo "%{F#e51d0b}什 %{F#ffffff}$ip_address"
else
    echo "%{F#e51d0b}什%{F#ffffff} No target"
fi
