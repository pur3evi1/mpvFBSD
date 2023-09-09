alias h		history 25
alias j		jobs -l
alias la	ls --color=auto -aF
alias lf	ls --color=auto -FA
alias ll	ls --color=auto -lAF
alias ls	ls --color=auto
# alias sway	./sway
set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin /home/sure/.cargo/bin)

setenv	EDITOR	nvim
setenv	PAGER	more

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = '\n  %{\033[0;37m%}%n%{\033[1;34m%}@%{\033[1;32m%}%m%{\033[1;30m%}%~%{\033[0;35m%} %{\033[0m%}'
	set promptchars = "%#"

	set filec
	set history = 100000
	set savehist = (100000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif
