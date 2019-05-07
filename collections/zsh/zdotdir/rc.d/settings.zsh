HISTFILE=~/.config/zsh/.zshhist
HISTSIZE=50
SAVEHIST=100
bindkey -v

export PS1="%{%F{1}%}%1/%{%f%} ➜  "

[ -n "$(tput colors)" ] && [ -r "$HOME/.cache/wal/sequences" ] && cat $HOME/.cache/wal/sequences

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/enva2712/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
