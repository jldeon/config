export EDITOR=nano

function qgrep() {
  echo "----------"
  grep -IRn --exclude-dir="*\.git*" --include=\*.{java,cpp,c,cc,h,hpp,xml,py}  "$*"
}

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  TERM=screen-256color tmux new -A -s default
else
  if [[ "$TERM" =~ tmux ]]; then
    echo "Error starting tmux!"
  fi
fi

