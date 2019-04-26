HISTFILE=~/.config/zsh/.zshhist
HISTSIZE=50
SAVEHIST=100
bindkey -v

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/enva2712/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
