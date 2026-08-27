#!/usr/bin/env bash
#
# lib/scan.sh
# Auto-discovery scan: checks the git status and local sync state of every
# repository found directly under the parent directory of this project
# (i.e. the folder git-sync-checker itself is cloned into).
# Read-only: nothing is fetched, merged, pulled, or pushed.

check_repo() {
    local REPO="$1"
    local NAME
    NAME=$(basename "$REPO")

    echo
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}$NAME${NC}"
    echo -e "${CYAN}========================================${NC}"
    sleep 0.2

    cd "$REPO" || {
        echo -e "${RED}Cannot open directory: $REPO${NC}"
        return
    }

    echo
    echo "== Project directory =="
    pwd
    echo
    sleep 0.2

    echo "== Status =="
    git status
    git branch --show-current
    git remote -v 2>/dev/null || true
    echo
    sleep 0.2

    echo "== File check =="

    local UNSTAGED STAGED UNTRACKED
    UNSTAGED=$(git diff --name-only)
    STAGED=$(git diff --cached --name-only)
    UNTRACKED=$(git ls-files --others --exclude-standard)

    if [ -z "$UNSTAGED" ] && [ -z "$STAGED" ] && [ -z "$UNTRACKED" ]; then
        echo -e "${GREEN}Working tree clean.${NC}"
        sleep 1
    else
        echo "Not yet committed:"
        {
            [ -n "$UNSTAGED" ] && echo "$UNSTAGED"
            [ -n "$STAGED" ] && echo "$STAGED"
            [ -n "$UNTRACKED" ] && echo "$UNTRACKED"
        } | sort -u | while read -r f; do
            echo -e "${RED}$f${NC}"
        done
        sleep 0.2
    fi

    echo
    echo "== Local sync status =="

    local UPSTREAM COUNTS BEHIND AHEAD
    UPSTREAM=$(git rev-parse --abbrev-ref '@{upstream}' 2>/dev/null || true)

    if [ -n "$UPSTREAM" ]; then
        COUNTS=$(git rev-list --left-right --count "$UPSTREAM"...HEAD)
        BEHIND=$(echo "$COUNTS" | awk '{print $1}')
        AHEAD=$(echo "$COUNTS" | awk '{print $2}')

        echo "Upstream: $UPSTREAM"
        echo "Ahead:    $AHEAD"
        echo "Behind:   $BEHIND"
        echo
        echo "Note: based on locally known remote info; nothing is fetched."
    else
        echo "No upstream set for the current branch."
    fi
    sleep 0.2

    echo
}

run_scan() {
    local BASE
    BASE="$(dirname "$PROJECT_ROOT")"

    echo
    echo "Scanning for git repositories in: $BASE"
    sleep 1

    local FOUND=0
    for REPO in "$BASE"/*/; do
        if git -C "$REPO" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
            FOUND=1
            check_repo "${REPO%/}"
        fi
    done

    if [ "$FOUND" -eq 0 ]; then
        echo "No git repositories found under $BASE."
    fi

    cd "$PROJECT_ROOT"
    echo
    echo -e "${CYAN}[i] All git repositories checked.${NC}"
    echo
    echo
    read -rp "Press ENTER to return.." _
}
