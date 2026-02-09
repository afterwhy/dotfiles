###########################################################
# FZF
###########################################################

# If fzf already exists — just enable integration
if command_exists fzf; then
  [ -f "$XDG_CONFIG_HOME/fzf/fzf.zsh" ] && source "$XDG_CONFIG_HOME/fzf/fzf.zsh"
else
  export FZF_BASE="${FZF_BASE:-$XDG_DATA_HOME/fzf}"

  if [ ! -d "$FZF_BASE/.git" ]; then
    confirm "fzf" || abort "fzf required"
    command_exists git || abort "git required for fzf"

    git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_BASE" \
      || abort "fzf clone failed"
  fi

  "$FZF_BASE/install" \
    --xdg \
    --key-bindings \
    --completion \
    --no-update-rc \
    >/dev/null 2>&1 || abort "fzf install failed"

  [ -f "$XDG_CONFIG_HOME/fzf/fzf.zsh" ] && source "$XDG_CONFIG_HOME/fzf/fzf.zsh"
fi

#######################
# STARSHIP (optional)
#######################

if command_exists starship; then
  eval "$(starship init zsh)"
fi


#######################
# ZOXIDE (optional)
#######################

if command_exists zoxide; then
  eval "$(zoxide init zsh)"
fi

