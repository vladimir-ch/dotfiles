abbr gst='git status'
#compdef _git gst=git-status

abbr gss='git status -s'
#compdef _git gss=git-status

abbr gd='git diff'
#compdef _git gd=git-diff

abbr gl='git pull'
#compdef _git gl=git-pull

abbr gup='git pull --rebase'
#compdef _git gup=git-fetch

abbr gp='git push'
#compdef _git gp=git-push

abbr gc='git commit -v'
#compdef _git gc=git-commit

abbr gc!='git commit -v --amend'
#compdef _git gc!=git-commit

abbr gca='git commit -v -a'
#compdef _git gc=git-commit

abbr gca!='git commit -v -a --amend'
#compdef _git gca!=git-commit

abbr gco='git checkout'
#compdef _git gco=git-checkout

abbr gcm='git checkout master'

abbr grbi='git rebase -i'
#compdef _git grbi=git-rebase

abbr grbc='git rebase --continue'
#compdef _git grbc=git-rebase

abbr grba='git rebase --abort'
#compdef _git grba=git-rebase

abbr gb='git branch'
#compdef _git gb=git-branch

abbr gba='git branch -a'
#compdef _git gba=git-branch

abbr gcount='git shortlog -sn'
#compdef gcount=git

abbr glg='git log --stat --max-count=10'
#compdef _git glg=git-log

abbr glgg='git log --graph --max-count=10'
#compdef _git glgg=git-log

abbr glgga='git log --graph --decorate --all'
#compdef _git glgga=git-log

abbr glo='git log --oneline'
#compdef _git glo=git-log

abbr glog='git log --oneline --decorate --graph'
#compdef _git glog=git-log

abbr ga='git add'
#compdef _git ga=git-add

abbr gm='git merge'
#compdef _git gm=git-merge

abbr grh='git reset HEAD'
abbr grhh='git reset HEAD --hard'
abbr gwc='git whatchanged -p --abbrev-commit --pretty=medium'

abbr gf='git fetch'
abbr gfp='git fetch -p'

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
