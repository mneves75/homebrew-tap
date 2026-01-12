# Homebrew Tap

Official Homebrew tap for personal projects.

## Installation

```bash
brew tap mneves75/tap
```

## Available Formulae

| Formula | Description | Build |
|---------|-------------|-------|
| `healthsync` | Secure sync of Apple HealthKit data between iPhone and Mac | Pre-built binary |
| `ffts-grep` | Fast full-text search file indexer using SQLite FTS5 | From source (Rust) |

## Install Individual Formulas

### healthsync

```bash
brew install mneves75/tap/healthsync
```

### ffts-grep

```bash
brew install mneves75/tap/ffts-grep
```

## Upgrade

```bash
brew upgrade healthsync
brew upgrade ffts-grep
```

## Uninstall

```bash
brew uninstall healthsync
brew uninstall ffts-grep
brew untap mneves75/tap
```

## Requirements

| Formula | Requirements |
|---------|--------------|
| `healthsync` | macOS 15 Sequoia+, Apple Silicon or Intel |
| `ffts-grep` | Rust 1.85+ (auto-installed by Homebrew) |

## Links

- [healthsync Repository](https://github.com/mneves75/ai-health-sync-ios)
- [ffts-grep Repository](https://github.com/mneves75/ffts-grep)

## License

Apache 2.0
