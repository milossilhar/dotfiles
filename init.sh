#!/usr/bin/env bash
echo "Creating environment variables..."

LOCAL_SECRET_ACCESS_KEY=$(openssl rand -base64 32)

echo "### Localstack ###"
if [ ! -f just/localstack/.env ]; then
    echo "Not found: just/localstack/.env file, creating..."
    echo "AWS_ACCESS_KEY_ID=\"959497864887\"" > ./just/localstack/.env
    echo "AWS_SECRET_ACCESS_KEY=\"$(openssl rand -base64 32)\"" >> ./just/localstack/.env
    echo "AWS_REGION=\"eu-central-1\"" >> ./just/localstack/.env
else
    LOCAL_SECRET_ACCESS_KEY=$(grep AWS_SECRET_ACCESS_KEY ./just/localstack/.env | sed 's/AWS_SECRET_ACCESS_KEY=//' | sed 's/\"//g')
    echo "Found: just/localstack/.env file, updating..."
fi

echo "### AWS Credentials ###"
if [ ! -f aws/dot-aws/credentials ]; then
    echo "Not found: aws/dot-aws/credentials file, creating..."
    cp aws/dot-aws/credentials.tmp aws/dot-aws/credentials

    sed -i "s:<LOCAL_ACCESS_KEY_ID>:959497864887/g" aws/dot-aws/credentials
    sed -i "s:<LOCAL_SECRET_ACCESS_KEY>:$LOCAL_SECRET_ACCESS_KEY/g" aws/dot-aws/credentials
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
    echo "aws_access_key_id = 959497864887" >> aws/dot-aws/credentials
    echo "aws_secret_access_key = $LOCAL_SECRET_ACCESS_KEY" >> aws/dot-aws/credentials
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