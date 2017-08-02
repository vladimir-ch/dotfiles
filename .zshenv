export PAGER="less"
export LESS="-F -i -M -R -S -w -X -z-4"
export EDITOR="vim"
export NINJA_STATUS="[%u/%r/%f] "

unset SSH_ASKPASS

export GOPATH=$HOME
if [ -d $HOME/go ]; then
    export GOROOT=$HOME/go
    export PATH=$GOROOT/bin:$PATH
fi

if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
