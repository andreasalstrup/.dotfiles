echo "dev environment set: $1"

tmux new-session -d -s "dev" -c $1 nvim .
tmux rename-window -t "dev" "nvim"
tmux new-window -n "terminal" -c $1

tmux attach-session -t "dev:0"
