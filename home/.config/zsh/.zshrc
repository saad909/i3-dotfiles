# :: Zplug - ZSH plugin manager
export ZPLUG_HOME=$HOME/.zplug

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi
#
source $ZPLUG_HOME/init.zsh
# oh-my-zsh
export ZSH="/home/saad/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

# # vim mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select { if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "modules/completion", from:prezto
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
if ! zplug check; then
   zplug install
fi


# keyboard shortcut keys
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

bindkey -s '^p' 'cmus\n'
bindkey -s '^r' 'ranger\n'
bindkey -s '^z' 'zsh\n'
bindkey -s '^t' 'tto\n'
bindkey -s '^y' 'yokadi\n'
bindkey -s '^t' 'pomodoro\n'

# Zplug plugins
# cat /home/$USER/.cache/wal/sequences
# Load settings
# aliases
alias rd="nvim ~/.config/directories"
alias rf="nvim ~/.config/files"
alias test="nvim /home/$USER/Documents/Experiments/test.ini"
alias cls="clear"
alias tp="nvim-qt /tmp/python_test.py"
alias add_route=gns3_routes
# paleofetch
zplug load
alias mux="pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell $HOME/.config/tmux/ressurect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach"
