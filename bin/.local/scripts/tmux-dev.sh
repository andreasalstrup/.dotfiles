tmux new-session -d -s "dev" -c ~/dev nvim .
tmux rename-window -t "dev" "nvim"
tmux new-window -n "terminal" -c ~/dev

tmux attach-session -t "dev:0"
