# Git Sync Checker

Een klein Bash-hulpmiddel voor thuisgebruik dat snel, read-only inzicht
geeft in de git-status van je lokale repositories: niet-gecommitte
wijzigingen, en hoeveel je voor-/achterloopt op de remote — allemaal
vanuit één menu, zonder dat je werkmap wordt aangeraakt.

> Status: work in progress. Het menu-skelet hieronder staat; de
> daadwerkelijke scan-logica wordt herontworpen (zie Roadmap) en is nog
> niet gekoppeld.

## Waarom

Oorspronkelijk een werkscript om een paar hardcoded repositories te
checken vóór een GitLab-sync. Van scratch herbouwd om overdraagbaar,
menu-gestuurd en bruikbaar te zijn voor elke verzameling repositories in
een thuisopstelling.

## Vereisten

- **Windows**: [Git Bash](https://git-scm.com/downloads) (wordt
  meegeleverd met Git for Windows)
- **Linux/macOS**: Bash + `git`

## Installatie

Clone deze repository één niveau *boven* je projectmap, niet erin — de
scan kijkt vanuit een helikopterview naar je projecten, in plaats van er
zelf één van te zijn.

```bash
# voorbeeldstructuur:
# ~/dev/git-sync-checker   <- deze repo
# ~/dev/mijn-project-a
# ~/dev/mijn-project-b

cd ~/dev
git clone git@github.com:calvinklemmer/git-sync-checker.git
```

## Gebruik

```bash
cd git-sync-checker
bash menu.sh
```

```
┌─────────────────────────────┐
│      GIT SYNC CHECKER       │
└─────────────────────────────┘

1) Scan
2) Help
3) About

x) Exit
```

## Projectstructuur

```
git-sync-checker/
├── menu.sh              # entry point
├── lib/
│   ├── colors.sh         # kleurdefinities
│   ├── common.sh         # log_info / log_success / log_warning / log_error
│   ├── globals.sh        # banner + placeholder-scherm
│   └── program-exit.sh   # graceful_exit
├── README.md
└── LICENSE
```

## Roadmap

- [x] Menu-skelet met Scan / Help / About / Exit
- [ ] Auto-discovery: de bovenliggende map scannen op git-repositories
      (geen handmatige padconfiguratie nodig)
- [ ] Negeerlijst (`.gitsyncignore`) om specifieke mappen van een scan
      uit te sluiten
- [ ] Read-only sync-check: status van de werkmap + voor-/achterstand
      t.o.v. de remote (alleen fetch, geen merge/pull — er wordt niets
      automatisch gewijzigd)
- [ ] Echte inhoud voor Help / About
- [ ] Basistests

## Licentie

MIT — zie [LICENSE](LICENSE).
