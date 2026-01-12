#!/usr/bin/env bash
echo "Creating environment variables..."

echo "### AWS Credentials ###"
LOCAL_ACCESS="localkey"
if [ ! -f aws/dot-aws/credentials ]; then
    echo "Not found: aws/dot-aws/credentials file, creating..."
    cp aws/dot-aws/credentials.tmp aws/dot-aws/credentials

    sed -i "s:<LOCAL_ACCESS_KEY_ID>:$LOCAL_ACCESS/g" aws/dot-aws/credentials
    sed -i "s:<LOCAL_SECRET_ACCESS_KEY>:$LOCAL_ACCESS/g" aws/dot-aws/credentials
else
    echo "Found: aws/dot-aws/credentials file, updating..."
    # Remove the [local] profile and its two following lines from aws/dot-aws/credentials
    sed -i '/^\[local\]/{
        N
        N
        d
    }' aws/dot-aws/credentials

    # Add the [local] profile and its two following lines to aws/dot-aws/credentials
    [ -n "$(tail -c1 aws/dot-aws/credentials)" ] && echo "" >> aws/dot-aws/credentials
    echo "[local]" >> aws/dot-aws/credentials
    echo "aws_access_key_id = $LOCAL_ACCESS" >> aws/dot-aws/credentials
    echo "aws_secret_access_key = $LOCAL_ACCESS" >> aws/dot-aws/credentials
fi

echo "### Postgres ###"
if [ ! -f just/postgres/.env ]; then
    echo "Not found: just/postgres/.env file, creating..."
    postgres_password=$(openssl rand -base64 32)
    echo "POSTGRES_PASSWORD=\"$postgres_password\"" > just/postgres/.env 
else
    echo "Found: just/postgres/.env file, nothing to do..."
fi

echo "Done!"