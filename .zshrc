# Antigen {{{
source ~/src/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle fedora
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle svn
antigen bundle gnu-utils
antigen bundle arialdomartini/oh-my-git
antigen bundle golang
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme robbyrussell
antigen apply
# }}}

# Modified commands {{{
if [[ $(uname) == Darwin ]]; then
	alias ls='gls'
	alias find='gfind'
fi
alias ll='ls -lhF --group-directories-first --color=auto'
alias la='ll -a'
alias grep='grep --color=auto'
alias more='less'
alias ..='cd ..'
alias diff='colordiff' # Requires colordiff package.
# }}}

# New commands {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
# }}}

# Safety aliases {{{
alias rm='rm -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# }}}

# function ff() {{{
# ff finds files with a pattern in name.
function ff() {
    find . -type f -iname '*'$*'*' -ls ;
}
# }}}

# function fstr() {{{
# fstr finds a string in a set of files and highlights it.
# It needs a recent version of egrep.
function fstr() {
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
    Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt; do
        case "$opt" in
            i) case="-i " ;;
            *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | xargs -0 egrep --color=always -sn ${case} "$1" 2>&-
}
# }}}

# vim:foldmethod=marker:foldlevel=0
