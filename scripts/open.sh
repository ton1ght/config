#!/bin/bash

PAPER_DIR="$HOME/sciebo/master/Masterarbeit/Paper/"
PAPER_SUMMARY_DIR="$HOME/sciebo/master/Masterarbeit/Notes/Paper Summaries/"
MANUAL_DIR="$HOME/sciebo/documents/manuals/"
SEARCH_FILE="$HOME/scripts/files/search"
BOOKMARKS_FILE="$HOME/scripts/files/bookmarks"
CONFIGS_FILE="$HOME/scripts/files/configs"

populate_array() {
    local file="$1"
    local array_name="$2"

    eval "declare -gA ${array_name}"

    while IFS='=' read -r key value; do
        [ -n \"\$key\" ] && eval "${array_name}[\"\$key\"]=\"\$value\""
    done <"$file"
}

CHOICES=("search" "bookmark" "paper" "summary" "manual" "config")

if [ "$#" -ne 1 ]; then
    echo "No argument given. Prompting for choice..."
    ENGINE=$(printf "%s\n" "${CHOICES[@]}" | wofi -i --dmenu --prompt="Select an option:")
else
    ENGINE="$1"
fi

case "$ENGINE" in
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

bookmark)
    populate_array "$BOOKMARKS_FILE" bookmarks
    SELECTION=$(printf "%s\n" "${!bookmarks[@]}" | wofi --dmenu -p "Choose a bookmark:")
    [ -z "$SELECTION" ] && exit 1
    COMMAND=(firefox "${bookmarks[$SELECTION]}")
    ;;

search)
    populate_array "$SEARCH_FILE" engines

    ENGINE=$(printf "%s\n" "${!engines[@]}" | wofi --dmenu -p "Choose search engine:")
    [ -z "$ENGINE" ] && exit 1

    SELECTION=$(wofi --dmenu -p "Enter search query:")
    COMMAND=(firefox "${engines[$ENGINE]}${SELECTION}")
    ;;

config)
    populate_array "$CONFIGS_FILE" configs

    SELECTION=$(printf "%s\n" "${!configs[@]}" | wofi --dmenu -p "Choose config file:")
    echo "Opening ${configs[$SELECTION]}..."
    COMMAND=(alacritty -e nvim "$(eval echo ${configs[$SELECTION]})")
    ;;

*)
    echo "Usage: $0 {${CHOICES[*]}}"
    exit 1
    ;;

esac

[ -z "$SELECTION" ] && exit 1

"${COMMAND[@]}"
