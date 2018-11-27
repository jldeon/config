# start with mouse mode enabled
set -g mouse on

# jld bring back n/p
unbind n
unbind p
bind -r C-p previous-window # select previous window
bind -r C-n next-window     # select next window
bind -r p previous-window
bind -r n next-window

unbind C-c
bind C-c new-window
unbind C-d
bind C-d detach-client
