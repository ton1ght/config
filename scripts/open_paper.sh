#!/bin/bash

PAPER_DIR="/home/ton1ght/sciebo/master/Masterarbeit/Paper/"

PAPER_SUMMARY_DIR="/home/ton1ght/sciebo/master/Masterarbeit/Notes/Paper Summaries/"

SELECTION=$(find $PAPER_DIR -maxdepth 1 -type f -iname "*.pdf" -printf "%f\n" | wofi -i --dmenu --prompt="Select a paper:")

[ -z "$SELECTION" ] && exit 1

if [ "$1" == "summary" ]; then
    alacritty -e nvim "${PAPER_SUMMARY_DIR}/${SELECTION%.pdf}.md"
else
    sioyek --new-instance "${PAPER_DIR}/${SELECTION}"
fi
