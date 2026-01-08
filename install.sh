#!/usr/bin/env bash

# check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
    echo "Error: stow is not installed."
    exit 1
fi

stow -v --dotfiles -d . -t ~ home
# stow -v -d . -t ~/.config/just just
