#!/usr/bin/env bash
#
# lib/globals.sh
# Banner and the "not built yet" screen for menu items that aren't wired
# to real functionality yet.

print_banner() {
    clear
    echo -e "${CYAN}"
    echo "┌─────────────────────────────┐"
    echo "│      GIT SYNC CHECKER      │"
    echo "└─────────────────────────────┘"
    echo -e "${NC}"
}

# usage: show_placeholder "Scan"
show_placeholder() {
    local TITLE="$1"
    print_banner
    echo -e "${YELLOW}== $TITLE ==${NC}"
    echo
    echo "This feature isn't wired up yet - coming in a future step."
    echo
    read -rp "Press Enter to return to the menu..." _
}
