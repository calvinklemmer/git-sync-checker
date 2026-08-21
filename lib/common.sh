#!/usr/bin/env bash
#
# lib/common.sh
# Gedeelde loginghelpers, gebruikt door menu.sh en (later) de scan-module.
# Verwacht dat PROJECT_ROOT al gezet is en lib/colors.sh al gesourced is.

log_info() {
    echo -e "${CYAN}[*]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[+]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_error() {
    echo -e "${RED}[FOUT]${NC} $1" >&2
}
