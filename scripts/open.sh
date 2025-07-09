#!/bin/bash

PAPER_DIR="$HOME/sciebo/master/Masterarbeit/Paper/"
PAPER_SUMMARY_DIR="$HOME/sciebo/master/Masterarbeit/Notes/Paper Summaries/"
MANUAL_DIR="$HOME/sciebo/documents/manuals/"

case "$1" in
paper)
    SELECTION=$(find "$PAPER_DIR" -maxdepth 1 -type f -iname "*.pdf" -printf "%f\n" | wofi -i --dmenu --prompt="Select a paper:")
    COMMAND=(sioyek --new-instance "${PAPER_DIR}/${SELECTION}")
    ;;
summary)
    SELECTION=$(find "$PAPER_SUMMARY_DIR" -maxdepth 1 -type f -printf "%f\n" | wofi -i --dmenu --prompt="Select a summary:")
    COMMAND=(alacritty -e nvim "${PAPER_SUMMARY_DIR}/${SELECTION}")
    ;;
manual)
    SELECTION=$(find "$MANUAL_DIR" -maxdepth 1 -type f -printf "%f\n" | wofi -i --dmenu --prompt="Select a manual:")
    COMMAND=(sioyek --new-instance "${MANUAL_DIR}/${SELECTION}")
    ;;
*)
    echo "Usage: $0 {paper|summary|manual}"
    exit 1
    ;;
esac

[ -z "$SELECTION" ] && exit 1

"${COMMAND[@]}"
