# Git Sync Checker

A small homelab Bash tool that gives you a quick, read-only overview of the
git status of your local repositories: uncommitted changes, and how far
you're ahead/behind the remote — all from one menu, without touching
your working directory.

> Status: work in progress. The menu shell below is built; the actual
> scan logic is being redesigned (see Roadmap) and is not wired in yet.

## Why

Originally a work script for checking a couple of hardcoded repositories
before a GitLab sync. Rebuilt from scratch to be portable, menu-driven,
and usable for any set of repositories on a home setup.

## Requirements

- **Windows**: [Git Bash](https://git-scm.com/downloads) (ships with Git for Windows)
- **Linux/macOS**: Bash + `git`

## Installation

Clone this repository one level *above* your projects folder, not inside
it — the scan looks at your projects from a bird's-eye view rather than
being one of the projects itself.

```bash
# example layout:
# ~/dev/git-sync-checker   <- this repo
# ~/dev/my-project-a
# ~/dev/my-project-b

cd ~/dev
git clone git@github.com:calvinklemmer/git-sync-checker.git
```

## Usage

```bash
cd git-sync-checker
bash menu.sh
```

```
┌─────────────────────────────┐
│      GIT SYNC CHECKER      │
└─────────────────────────────┘

1) Scan
2) Help
3) About

x) Exit
```

## Project structure

```
git-sync-checker/
├── menu.sh              # entry point
├── lib/
│   ├── colors.sh         # color definitions
│   ├── common.sh         # log_info / log_success / log_warning / log_error
│   ├── globals.sh        # banner + placeholder screen
│   └── program-exit.sh   # graceful_exit
├── README.md
└── LICENSE
```

## Roadmap

- [x] Menu shell with Scan / Help / About / Exit
- [ ] Auto-discovery: scan the parent directory for git repositories
      (no manual path config needed)
- [ ] Ignore list (`.gitsyncignore`) to exclude specific folders from a scan
- [ ] Read-only sync check: working tree status + ahead/behind vs. remote
      (fetch only, no merge/pull — nothing gets changed automatically)
- [ ] Real Help / About content
- [ ] Basic tests

## License

MIT — see [LICENSE](LICENSE).
