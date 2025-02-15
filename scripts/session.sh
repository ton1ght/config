#!/usr/bin/env bash

SESSION_NAME=$(tmux list-sessions | cut -d ":" -f 1 | fzf)

if [ -n "$SESSION_NAME" ]; then
    tmux attach-session -t "$SESSION_NAME"
fi
