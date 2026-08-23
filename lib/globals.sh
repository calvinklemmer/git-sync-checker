#!/usr/bin/env bash
#
# lib/globals.sh
# Banner, program metadata, and the "not built yet" screen for menu items
# that aren't wired to real functionality yet.

VERSION="0.1.0-dev"

print_banner() {
    clear
    echo -e "${GREEN}┌─────────────────────────────┐${NC}"
    echo -e "${GREEN}│      GIT SYNC CHECKER       │${NC}"
    echo -e "${GREEN}└─────────────────────────────┘${NC}"
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

show_about() {
    print_banner
    echo "v$VERSION"
    echo
    echo -e "${GREEN}About${NC}"
    echo "Shows a quick, read-only overview of your local git repositories:"
    echo "uncommitted changes and how far you are ahead or behind the remote."
    echo
    echo
    read -rp "Press ENTER to return.." _
}
