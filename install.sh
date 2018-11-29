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
ln -s -f $DIR/tmux-omt/.tmux.conf
ln -s -f $DIR/tmux.cfg $HOME/.tmux.conf.local

# nano
ln -s -f $DIR/nano.cfg $HOME/.nanorc

# vim
mkdir -p $HOME/.vim/colors/
ln -s -f $DIR/vim-monokai/colors/monokai.vim $HOME/.vim/colors/monokai.vim
ln -s $DIR/vim.cfg $HOME/.vimrc

# bash
remove_line "JLDCFGDIR" "$HOME/.bashrc"
insert_line "export JLDCFGDIR=\"$DIR\"" "$HOME/.bashrc"
insert_line 'source $JLDCFGDIR/bash.cfg' "$HOME/.bashrc"

echo "Done!"
