#### Zplug and oh-my-zsh #####
export ZPLUG_HOME=$HOME/.zplug
# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi
source $ZPLUG_HOME/init.zsh
# oh-my-zsh
export ZSH="/home/saad/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
## Launch Starship
# eval "$(starship init zsh)"
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)
# zsh auto completion
zplug "lib/completion",      from:oh-my-zsh
# setups up histoyr
zplug "lib/history",         from:oh-my-zsh
# Color highlighting in terminal
zplug "zdharma/fast-syntax-highlighting"
# Auto suggests commands based on history
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed (copied from the zplug readme)
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
        if read -q; then
        echo; zplug install
    fi
fi
# # Then, source plugins and add commands to $PATH
zplug load

#### THEME ####
[ -f $HOME/.config/zsh/archcraft.zsh-theme ] && source $HOME/.config/zsh/archcraft.zsh-theme
#### Load aliases and shortcuts if existent ####
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

#### keyboard shortcut keys ####
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -s '^p' 'cmus\n'
bindkey -s '^r' 'ranger\n'
bindkey -s '^z' 'zsh\n'
bindkey -s '^t' 'tto\n'
bindkey -s '^y' 'yokadi\n'
bindkey -s '^t' 'pomodoro\n'
# aliases
alias ls="lsd" 
alias rd="nvim ~/.config/directories"
alias rf="nvim ~/.config/files"
alias test="nvim /home/$USER/Documents/Experiments/test.ini"
alias cls="clear"
alias tp="neovide /tmp/python_test.py"
alias add_route=gns3_routes
alias mux="pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell $HOME/.tmux/plugins/tmux-resurrect/scripts && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach"
