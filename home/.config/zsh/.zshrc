#### Zplug and oh-my-zsh #####
export ZPLUG_HOME=$HOME/.zplug
# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
else
    source $ZPLUG_HOME/init.zsh
fi
# Install plugins if there are plugins that have not been installed (copied from the zplug readme)
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
        if read -q; then
        echo; zplug install
    fi
fi
# zsh auto completion
zplug "lib/completion",      from:oh-my-zsh
# setups up histoyr
zplug "lib/history",         from:oh-my-zsh
# Color highlighting in terminal
zplug "zdharma/fast-syntax-highlighting"
# Auto suggests commands based on history
zplug "zsh-users/zsh-autosuggestions"
# vi mode
# zplug "jeffreytse/zsh-vi-mode"
# load plugins
zplug load

#### oh-my-zsh ####
if [[ ! -d $ZSH ]]
then
    printf "oh-my-zsh not installed. Want to Install? [y/N]: "
    if read -q; then
    echo; sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
fi
source $ZSH/oh-my-zsh.sh
#### THEME ####
[ -f $HOME/.config/zsh/archcraft.zsh-theme ] && source $HOME/.config/zsh/archcraft.zsh-theme
#### Load aliases and shortcuts if existent ####
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

#### vi mode ####
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.



#### keyboard shortcut keys ####
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -s '^P' 'cmus\n'
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
alias lf="lfrun"
alias add_route=gns3_routes
alias mux="pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell $HOME/.tmux/plugins/tmux-resurrect/scripts && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach"
