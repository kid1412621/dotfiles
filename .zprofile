if [[ -x /opt/homebrew/bin/brew ]]; then
	# Apple Silicon required, Intel Mac include /usr/local/bin by default
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
