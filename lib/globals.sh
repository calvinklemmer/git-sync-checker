#!/usr/bin/env bash
#
# lib/globals.sh
# Banner, program metadata, and the Help/About screens.

VERSION="0.1.0-dev"

print_banner() {
    clear
    local title="GIT SYNC CHECKER"
    local width=29
    local pad_total=$(( width - ${#title} ))
    local pad_left=$(( pad_total / 2 ))
    local pad_right=$(( pad_total - pad_left ))
    local version_string="v$VERSION"
    local version_pad=$(( width - ${#version_string} - 1 ))

    printf '%b┌%s┐\n' "$GREEN" "$(printf '─%.0s' $(seq 1 "$width"))"
    printf '│%*s%s%*s│\n' "$pad_left" '' "$title" "$pad_right" ''
    printf '│%*s%s │\n' "$version_pad" '' "$version_string"
    printf '└%s┘%b\n' "$(printf '─%.0s' $(seq 1 "$width"))" "$NC"
}

show_help() {
    print_banner
    echo
    echo -e "${GREEN}Help${NC}"
    echo "Quick reference for what each menu option does."
    echo
    echo "Scan  - scans the repositories next to this one and shows git status plus sync state (read-only)"
    echo "Help  - this screen"
    echo "About - version and license info"
    echo "Exit  - quit the program nicely (or press Ctrl+C)"
    echo
    echo
    read -rp "Press ENTER to return.." _
}

show_about() {
    print_banner
    echo
    echo -e "${GREEN}About${NC}"
    echo "Shows a quick, read-only overview of your local git repositories:"
    echo "uncommitted changes and how far you are ahead or behind the remote."
    echo
    echo
    read -rp "Press ENTER to return.." _
}
