export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export ZPLUG_HOME="${ZPLUG_HOME:-$XDG_DATA_HOME/zplug}"
export ZPLUG_HOME   # IMPORTANT: visible to installer

if [ ! -f "$ZPLUG_HOME/init.zsh" ]; then
  confirm "zplug" || abort "zplug required"
  command_exists curl || abort "curl required"
  curl -sL https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh \
    || abort "zplug install failed"
  sleep 1 # we need to wait for init.zsh file to appear
fi

if [ ! -f "$ZPLUG_HOME/init.zsh" ]; then
  abort "zplug init.zsh not found after install"
fi

source "$ZPLUG_HOME/init.zsh"
command_exists zplug || abort "zplug not available"

zplug "catppuccin/zsh-syntax-highlighting", \
  use:"themes/catppuccin_mocha-zsh-syntax-highlighting.zsh"

zplug "zsh-users/zsh-syntax-highlighting", \
   on:"catppuccin/zsh-syntax-highlighting"

zplug "zsh-users/zsh-autosuggestions"

if ! zplug check; then
  confirm "zplug plugins" || abort "plugins required"
  zplug install || abort "plugin install failed"
fi

zplug load || abort "zplug load failed"
