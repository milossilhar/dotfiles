
@default:
    just --list

# initializes repository after clone
init:
    #!/usr/bin/env bash
    chmod +x install.sh
    curl -sS https://webi.sh/webi | sh
    webi lsd@stable
    
    postgres_password=$(openssl rand -base64 32)
    if [ ! -f just/postgres/.env ]; then
      echo "POSTGRES_PASSWORD=\"$postgres_password\"" > just/postgres/.env 
    fi

    source ~/.config/envman/PATH.env

alias i := install
# installs all dotfiles
@install:
    ./install.sh


