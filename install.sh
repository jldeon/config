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
ln -s -f $DIR/vim.cfg $HOME/.vimrc

# sublime
SUBLIME_PREF_DIR=$HOME/.config/sublime-text-3/Packages/User/
mkdir -p $SUBLIME_PREF_DIR
mv $SUBLIME_PREF_DIR/Preferences.sublime-settings $SUBLIME_PREF_DIR/Preferences.jldcfg.bak
ln -s $DIR/sublime.cfg $SUBLIME_PREF_DIR/Preferences.sublime-settings

# bash
remove_line "JLDCFGDIR" "$HOME/.bashrc"
insert_line "export JLDCFGDIR=\"$DIR\"" "$HOME/.bashrc"
insert_line 'source $JLDCFGDIR/bash.cfg' "$HOME/.bashrc"

echo "Done!"
