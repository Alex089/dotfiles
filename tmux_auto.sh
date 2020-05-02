#!/bin/bash

# install tmux
apt install tmux

# Important commands:
------------------------------------------
# tmux new -s session_name 
# tmux ls
# tmux attach -t session_name

# Prefix d => detach from session
# Prefix , => rename window
# Prefix c : create new window
# prefix p : previous window
# previx n: next window

# reload config file: source-file ~/.tmux.conf
# .tmux.conf in ~/.tmux.conf

touch ~/.tmux.conf

# set prefix from C-b to C-a and unbind old prefix
set -g prefix C-a
unbind C-b

# delay between prefix and command
set -s escape-time 1

# ensure that C-a ben be send to other aps:
# bind C-a send-prefix

# splitting panes with | and -
bind | split-window -h
bind - split-window -v

# moving between panes with vim keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# pane resizing
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Visuals
# tput colors: have 256 colors. Set tango theme?

# set default terminal mode to 256 colors
set -g default-terminal "screen-256color"

# status line colors 
set -g status-style fg=white,bg=black

# mark active window
set -g window-status-style fg=cyan,bg=black
set -g window-status-current-style fg=white,bold,bg=yellow # or red

# color the panes
setw -g pane-border-style fg=green,bg=black
setw -g pane-active-border-style fg=white,bg=yellow
setw -g window-style fg=colour240,bg=colour235
setw -g window-active-style fg=white,bg=black

# status line
set -g message-style fg=white,bold,bg=black

# center window list
set -g status-justify centre
