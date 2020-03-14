#!/bin/bash

tmux new-session -d -s "main" -n "bash"

tmux splitw -h -p 35
tmux send-keys "htop" C-m

tmux splitw -v -p 50
tmux send-keys "export TERM=\"xterm\"; iftop" C-m

#tmux new-window -t "main" -n "fail2ban log"
#tmux send-keys "tail -f /mnt/user/appdata/letsencrypt/log/fail2ban/fail2ban.log" C-m

tmux select-window -t "main:0"
tmux selectp -t 0
