#!/usr/bin/env bash
set -e

QUIET=0
[[ "$*" == *"--quiet"* || "$*" == *"-q"* ]] && QUIET=1

msg() { echo "[bootstrap] $*"; }

install() {
  local pkgs=("$@")
  if command -v apt >/dev/null; then
    sudo apt install -y "${pkgs[@]}"
  elif command -v pacman >/dev/null; then
    sudo pacman -S --noconfirm "${pkgs[@]}"
  elif command -v dnf >/dev/null; then
    sudo dnf install -y "${pkgs[@]}"
  else
    msg "unsupported package manager"
    exit 1
  fi
}

msg "installing base dependencies"
install zsh git curl

command -v fzf      || install fzf
command -v starship || install starship
command -v zoxide   || install zoxide

msg "done"
