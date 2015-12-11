#!/bin/sh

set -eu

GLOBAL_URL='http://tamacom.com/global/global-6.5.1.tar.gz'
GLOBAL_DIR=${GLOBAL_URL##*/}
TAR=$(has_command tar)
MAKE=$(has_command make)
WGET=$(has_command wget)
PREFIX='/usr/local/stow/global'
GLOBAL_BIN="$PREFIX/bin/global"
SOURCE_DIR=~/sources

has_command() {
  command -v "$1"
} >/dev/null 2>&1

msg() {
  printf >&2 '%s\n' "$@"
}

[ -f "$GLOBAL_BIN" ] && msg 'global was installed' && exit 0

cd "$SOURCE_DIR"
"$WGET" "$GLOBAL_URL"
"$TAR" -xvf "$GLOBAL_DIR"
cd "${GLOBAL_DIR%.tar.gz}"
./configure --prefix="$PREFIX"
"$MAKE"
"$MAKE" install

# Disable temporary
# Currently, GNU stow can not handle conflict by /usr/share/info/dir
# See: http://unix.stackexchange.com/q/73426/38906
# cd "${PREFIX%/*}"
# sudo stow "${PREFIX##*/}"

# Use symlink for now
sudo ln -s "$GLOBAL_BIN" /usr/bin/global
