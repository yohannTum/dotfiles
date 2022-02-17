#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit


# /opt/polybar/build/bin/polybar

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
/opt/polybar/build/bin/polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
sleep 1
/opt/polybar/build/bin/polybar bar2 2>&1 | tee -a /tmp/polybar1.log & disown
# /opt/polybar/build/bin/polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
# /opt/polybar/build/bin/polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown
# 
# echo "Bars launched..."
