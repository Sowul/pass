#!/bin/sh
# source: https://www.reddit.com/r/commandline/comments/1t6p3k/pass_the_standard_unix_password_manager/ce513iz/
# usage: pass.sh <website>

website=$1

stty -echo
read -p "Login: " login
echo
read -p "Password: " password
echo
stty echo

echo -n "$website" | openssl sha1 -hmac "$password$login" | cut -d" " -f2 | xxd -r -p | base64 | tr -d -c "[:alnum:]" |
xclip
echo "Password generated, middle click to paste."
