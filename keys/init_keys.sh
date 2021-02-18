#!/usr/bin/env bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)
cd "$DIR" || exit

unzip keys.zip
./config_keys.sh

shopt -s extglob dotglob
rm -- !(init_keys.sh|keys.zip)
