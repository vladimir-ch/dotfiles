alias gst='git status'
#compdef _git gst=git-status

alias gss='git status -s'
#compdef _git gss=git-status

alias gd='git diff'
#compdef _git gd=git-diff

alias gl='git pull'
#compdef _git gl=git-pull

alias gup='git pull --rebase'
#compdef _git gup=git-fetch

alias gp='git push'
#compdef _git gp=git-push

alias gc='git commit -v'
#compdef _git gc=git-commit

alias gc!='git commit -v --amend'
#compdef _git gc!=git-commit

alias gca='git commit -v -a'
#compdef _git gc=git-commit

alias gca!='git commit -v -a --amend'
#compdef _git gca!=git-commit

alias gco='git checkout'
#compdef _git gco=git-checkout

alias gcm='git checkout master'

alias grbi='git rebase -i'
#compdef _git grbi=git-rebase

alias grbc='git rebase --continue'
#compdef _git grbc=git-rebase

alias grba='git rebase --abort'
#compdef _git grba=git-rebase

alias gb='git branch'
#compdef _git gb=git-branch

alias gba='git branch -a'
#compdef _git gba=git-branch

alias gcount='git shortlog -sn'
#compdef gcount=git

alias glg='git log --stat --max-count=10'
#compdef _git glg=git-log

alias glgg='git log --graph --max-count=10'
#compdef _git glgg=git-log

alias glgga='git log --graph --decorate --all'
#compdef _git glgga=git-log

alias glo='git log --oneline'
#compdef _git glo=git-log

alias ga='git add'
#compdef _git ga=git-add

alias gm='git merge'
#compdef _git gm=git-merge

alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias gf='git fetch'
alias gfp='git fetch -p'

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo ref | sed s-refs/heads--
end

function current_repository
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end

# Pretty log messages
function _git_log_prettily
  if ! [ -z $1 ]; then
    git log --pretty=$1
  end
end

alias glp="_git_log_prettily"
#compdef _git glp=git-log
