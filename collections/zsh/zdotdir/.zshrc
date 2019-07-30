### Load config files for non-interactive sessions
if [ -d "$ZDOTDIR/env.d" ]; then
	for script in $ZDOTDIR/env.d/**/*.(zsh|bash|sh); do
		[ -r "$script" ] && . $script;
	done
fi


### Load config files for interactive sessions
if [ -d "$ZDOTDIR/rc.d" ]; then
	for script in $ZDOTDIR/rc.d/**/*.(zsh|bash|sh); do
		[ -r $script ] && source $script;
	done
fi
