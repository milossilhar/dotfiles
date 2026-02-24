# Dotfiles

Personal dotfiles and terminal settings for Linux/macOS/Windows.

Configuration is managed via `just` recipes defined in `justfile`.

## Prerequisites

- `just` installed on your system (`apt install just` or your package manager)

## Usage

List available commands:

```bash
just
```

Install dependencies:

```bash
just deps
```

Initialize the environment (exports variables, etc.):

```bash
just init
```

Install all dotfiles (or update existing ones):

```bash
just install
# or
just i
```

## License

[MIT License](https://choosealicense.com/licenses/mit/)
