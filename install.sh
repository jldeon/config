#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function insert_line () {
    LINE=$1
    FILE=$2
    grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

function remove_line () {
    SEDSTRING="/$1/d"
    sed -i.bak $SEDSTRING $2
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
remove_line "JLDCFGDIR" "$HOME/.bashrc"
insert_line "export JLDCFGDIR=\"$DIR\"" "$HOME/.bashrc"
insert_line 'source $JLDCFGDIR/bash.cfg' "$HOME/.bashrc"

echo "Done!"
