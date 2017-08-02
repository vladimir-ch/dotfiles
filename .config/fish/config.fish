set fish_greeting

set EDITOR vim
set PAGER "less"
set LESS "-F -i -M -R -S -w -X -z-4"
set NINJA_STATUS "[%u/%r/%f] "

alias diff='colordiff' # Requires colordiff package.
alias grep='grep --color=auto'
alias la='ll -a'
alias ll='ls -lhF --group-directories-first --color=auto'

alias rm='rm -i'
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'

if status --is-login
	set -gx GOPATH $HOME
	if test -d $HOME/go
		set -gx GOROOT $HOME/go
		set PATH $GOROOT/bin $PATH
	end
	if test -d $HOME/bin
		set PATH $HOME/bin $PATH
	end
end

if status --is-interactive
	set CDPATH . ~/src/gonum.org/v1/gonum ~/src/gonum.org/v1
end

. ~/.config/fish/git.fish
