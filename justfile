
@default:
    just --list

# initializes repository after clone
@init:
    chmod +x install.sh

alias i := install
# installs all dotfiles
@install:
    ./install.sh


