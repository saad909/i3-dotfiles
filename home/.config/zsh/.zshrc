# # oh-my-zsh
# export ZSH="/home/saad/.oh-my-zsh"
# # ZSH_THEME="crunch"
# # ZSH_THEME="arrow"
# ZSH_THEME="robbyrussell"
# # plugins=( zsh-autosuggestions )

# source $ZSH/oh-my-zsh.sh
# Load syntax highlighting; should be last.

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
# HISTSIZE=10000
# SAVEHIST=10000
# HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

# bindkey -s '^o' 'lfcd\n'

# bindkey -s '^a' 'bc -l\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line


#oh my zsh
alias rd="vim ~/.config/directories"
alias rf="vim ~/.config/files"

##########Shortcut Keys for ranger and cmus#########
bindkey -s '^p' 'cmus\n'
bindkey -s '^r' 'ranger\n'
bindkey -s '^z' 'zsh\n'
bindkey -s '^t' 'tto\n'
bindkey -s '^y' 'yokadi\n'
bindkey -s '^t' 'pomodoro\n'
# cat /home/$USER/.cache/wal/sequences
##########test rmd file for configs#########
alias test="nvim /home/$USER/Documents/Experiments/test.cfg"




alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.config/tmux/ressurect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'


alias cls="clear"
alias tp="nvim-qt /tmp/python_test.py"



