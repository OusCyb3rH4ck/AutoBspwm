#!/bin/bash

cpu_load=$(top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}')
mem_used=$(free -m | awk 'NR==2{printf "%sMB\n", $3}')

echo -e "%{F#2495e7} %{F#ff0000}CPU:%{F#ffffff} $cpu_load %{F#ccccff}/%{F#ff6c00} RAM:%{F#ffffff} $mem_used"

