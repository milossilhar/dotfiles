#!/usr/bin/env bash
echo "Creating environment variables..."

echo "### Postgres ###"
if [ ! -f just/postgres/.env ]; then
    echo "Not found: just/postgres/.env file, creating..."
    postgres_password=$(openssl rand -base64 32)
    echo "POSTGRES_PASSWORD=\"$postgres_password\"" > just/postgres/.env 
else
    echo "Found: just/postgres/.env file, nothing to do..."
fi

echo "Done!"