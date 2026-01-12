#!/usr/bin/env bash
echo "Installing dependencies..."

curl -sS https://webi.sh/webi | sh
webi lsd@stable

source ~/.config/envman/PATH.env