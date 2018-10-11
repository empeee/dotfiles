#!/bin/bash

tmux new-session -d -s "main" -n "bash"

tmux splitw -h -p 35
tmux send-keys "htop" C-m

tmux splitw -v -p 50
tmux send-keys "export TERM=\"xterm\"; iftop" C-m

tmux selectp -t 0
