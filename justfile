
@default:
    just --list

# initializes repository after clone
@init:
    chmod +x install.sh
    postgres_password=$(openssl rand -base64 32)
    echo "POSTGRES_PASSWORD=$postgres_postgres_password" > just/postgres/.env

alias i := install
# installs all dotfiles
@install:
    ./install.sh


