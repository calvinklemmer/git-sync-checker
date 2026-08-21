#!/usr/bin/env bash
#
# menu.sh
# Git Sync Checker - menu (entry point)
#
# Dit is voorlopig een leeg skelet: de opties tonen alleen een placeholder.
# De echte scan-logica (auto-discovery + negeerlijst) wordt in een latere
# stap gekoppeld, in een eigen module.
#
# Vereist: Git Bash (Windows) of Bash + git (Linux/macOS)

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"

source "$PROJECT_ROOT/lib/colors.sh"
source "$PROJECT_ROOT/lib/common.sh"
source "$PROJECT_ROOT/lib/globals.sh"
source "$PROJECT_ROOT/lib/program-exit.sh"

main_menu() {
    while true; do
        print_banner
        echo "1) Scan"
        echo "2) Help"
        echo "3) About"
        echo
        echo "x) Exit"
        echo
        echo

        if ! read -rp "Keuze: " keuze; then
            echo
            log_warning "Invoer gestopt, script wordt afgesloten."
            graceful_exit
        fi

        case "$keuze" in
            1) show_placeholder "Scan" ;;
            2) show_placeholder "Help" ;;
            3) show_placeholder "About" ;;
            x|X) graceful_exit ;;
            *)
                log_error "Ongeldige keuze: $keuze"
                sleep 1
                ;;
        esac
    done
}

main_menu
