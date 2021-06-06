alias v=vim
alias sudo='sudo -E'
alias cb='xclip -i -selection clipboard'	# Pipe text to clipboard
alias cdc='cd "$(xclip -o -selection clipboard)"'	# cd to directory in clipboard
alias grep='grep --color=auto'
alias info='info --vi-keys'
alias bc='bc -ql $CONFIG_DIR/bc'

case "$(uname -s)" in
	(Linux*)
		alias ls='ls --color=auto --group -FhN'
	;;
	(Darwin*)
		alias ls='ls -FhG'
	;;
esac

alias youtube-dl-album='youtube-dl --config-location $CONFIG_DIR/youtube-dl/album'
alias youtube-dl-track='youtube-dl --config-location $CONFIG_DIR/youtube-dl/track'
