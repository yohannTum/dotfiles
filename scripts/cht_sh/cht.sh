#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# SCRIPT_DIR=~/dotfiles/scripts/cht_sh

# To see all commands / topics :
# curl cht.sh/:list > all
selected=`cat $SCRIPT_DIR/tmux-cht-languages $SCRIPT_DIR/tmux-cht-command | fzf --reverse`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Query: " query
query=`echo $query | tr ' ' '+'`

if grep -qs "$selected" $SCRIPT_DIR/tmux-cht-languages; then
	tmux neww bash -c "echo \"curl cht.sh/$selected/$query\"\
		& curl cht.sh/$selected/$query\
		&& tmux copy-mode && tmux send-keys -X history-top\
		& while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "echo \"curl cht.sh/$selected~$query\"\
		& curl cht.sh/$selected~$query\
		&& tmux copy-mode && tmux send-keys -X history-top\
		& while [ : ]; do sleep 1; done"
fi
