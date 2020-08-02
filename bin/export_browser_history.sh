#!/bin/bash

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"; cd .. && pwd )"

mkdir -p "$REPO_DIR/output/sources"

if [[ "$1" == "--chrome" ]]; then
    # Google Chrome / Chromium
    if [[ -e "$2" ]]; then
        cp "$2" "$REPO_DIR/output/sources/chrome_history.db.tmp"
    else
        default=$(ls ~/Library/Application\ Support/Google/Chrome/Default/History)
        echo "Defaulting to history db: $default"
        echo "Optionally specify the path to a different sqlite history database as the 2nd argument."
        cp "$default" "$REPO_DIR/output/sources/chrome_history.db.tmp"
    fi
    sqlite3 "$REPO_DIR/output/sources/chrome_history.db.tmp" "SELECT \"[\" || group_concat(json_object('timestamp', last_visit_time, 'description', title, 'href', url)) || \"]\" FROM urls;" > "$REPO_DIR/output/sources/chrome_history.json"
    rm "$REPO_DIR"/output/sources/chrome_history.db.*
    echo "Chrome history exported to:"
    echo "    output/sources/chrome_history.json"
fi

if [[ "$1" == "--firefox" ]]; then
    # Firefox
    if [[ -e "$2" ]]; then
        cp "$2" "$REPO_DIR/output/sources/firefox_history.db.tmp"
    else
        default=$(ls ~/Library/Application\ Support/Firefox/Profiles/*.default/places.sqlite)
        echo "Defaulting to history db: $default"
        echo "Optionally specify the path to a different sqlite history database as the 2nd argument."
        cp "$default" "$REPO_DIR/output/sources/firefox_history.db.tmp"
    fi
    sqlite3 "$REPO_DIR/output/sources/firefox_history.db.tmp" "SELECT \"[\" || group_concat(json_object('timestamp', last_visit_date, 'description', title, 'href', url)) || \"]\" FROM moz_places;" > "$REPO_DIR/output/sources/firefox_history.json"
    rm "$REPO_DIR"/output/sources/firefox_history.db.*
    echo "Firefox history exported to:"
    echo "    output/sources/firefox_history.json"
fi

if [[ "$1" == "--safari" ]]; then
    # Safari
    if [[ -e "$2" ]]; then
        cp "$2" "$REPO_DIR/output/sources/safari_history.db.tmp"
    else
        default="~/Library/Safari/History.db"
        echo "Defaulting to history db: $default"
        echo "Optionally specify the path to a different sqlite history database as the 2nd argument."
        cp "$default" "$REPO_DIR/output/sources/safari_history.db.tmp"
    fi
    sqlite3 "$REPO_DIR/output/sources/safari_history.db.tmp" "select url from history_items" > "$REPO_DIR/output/sources/safari_history.json"
    rm "$REPO_DIR"/output/sources/safari_history.db.*
    echo "Safari history exported to:"
    echo "    output/sources/safari_history.json"
fi
