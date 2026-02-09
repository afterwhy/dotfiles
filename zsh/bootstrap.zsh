ZSH_QUIET=0
[[ "$*" == *"--quiet"* || "$*" == *"-q"* ]] && ZSH_QUIET=1

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

confirm() {
  (( ZSH_QUIET )) && return 0
  printf "%s not found. Install? [y/N]: " "$1"
  read -q || return 1
  echo
}

abort() {
  echo "zshrc aborted: $1" >&2
  return 1
}
