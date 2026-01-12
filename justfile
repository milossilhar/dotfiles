
@default:
    just --list

# installs dependencies
@deps:
    ./dep.sh

# initializes environment with variables
@init:
    chmod +x init.sh
    ./init.sh

alias i := install
# installs all dotfiles
@install:
    ./install.sh


