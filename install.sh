#!/usr/bin/env bash

# check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
    echo "Error: stow is not installed."
    exit 1
fi

stow -v --dotfiles -d . -t ~ home
stow -v --dotfiles -d . -t ~/.config/just just
stow -v --dotfiles -d . -t ~/.config/ghostty ghostty
stow -v --dotfiles -d . -t ~/.config/Cursor/User vscode
stow -v --dotfiles -d . -t ~/.config/zed zed