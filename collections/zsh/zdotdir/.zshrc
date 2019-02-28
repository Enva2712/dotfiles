if [ -d "$ZDOTDIR/rc.d" ]; then
	for script in $ZDOTDIR/rc.d/**/*.(zsh|bash|sh); do
		[ -r $script ] && source $script;
	done
fi
