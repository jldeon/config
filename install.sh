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
git clone https://github.com/gpakosz/.tmux
ln -s -f .tmux/.tmux.conf
ln -s -f $DIR/tmux $HOME/.tmux.conf.local

# nano
ln -s -f $DIR/nano $HOME/.nanorc

# bash
insert_line "source $DIR/bash" "$HOME/.bashrc"

echo "Done!"
