
@default:
    just --list

# initializes repository after clone
init:
    #!/usr/bin/env bash
    chmod +x install.sh
    postgres_password=$(openssl rand -base64 32)
    if [ ! -f just/postgres/.env ]; then
      echo "POSTGRES_PASSWORD=\"$postgres_password\"" > just/postgres/.env 
    fi

alias i := install
# installs all dotfiles
@install:
    ./install.sh


