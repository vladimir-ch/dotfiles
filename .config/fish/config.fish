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

. ~/.config/fish/git.fish

if test -f /usr/share/fzf/shell/key-bindings.fish
	. /usr/share/fzf/shell/key-bindings.fish
end

if test -f /etc/fedora-release
	. ~/.config/fish/fedora.fish
end
