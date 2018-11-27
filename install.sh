#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function insert_line () {
    LINE=$1
    FILE=$2
    grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

# tmux
cd $HOME
if [[ ! -d '.tmux' ]]; then
    git clone https://github.com/gpakosz/.tmux
    ln -s -f .tmux/.tmux.conf
fi
ln -s -f $DIR/tmux.cfg $HOME/.tmux.conf.local

# nano
ln -s -f $DIR/nano.cfg $HOME/.nanorc

# bash
insert_line "source $DIR/bash.cfg" "$HOME/.bashrc"

echo "Done!"
