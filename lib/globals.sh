#!/usr/bin/env bash
#
# lib/globals.sh
# Banner, program metadata, and the Help/About screens.

VERSION="0.1.0-dev"

print_banner() {
    clear
    echo -e "${GREEN}┌─────────────────────────────┐${NC}"
    echo -e "${GREEN}│      GIT SYNC CHECKER       │${NC}"
    echo -e "${GREEN}│                   v$VERSION │${NC}"
    echo -e "${GREEN}└─────────────────────────────┘${NC}"
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
