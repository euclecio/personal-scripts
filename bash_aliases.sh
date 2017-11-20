# GIT
gac() {
    git add . --all
    git status
    git commit
}

gaf() {
    git add . --all
    git commit --amend
    git push origin $(get_current_branch) -f
}

get_current_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_pull_ocb() {
    git pull origin $(get_current_branch)
}

git_push_ocb() {
    if [[ $(git branch -r | grep "$issue_number") ]]; then
        git pull origin $(get_current_branch)
    fi
    git push origin $(get_current_branch)
}

dropstash() {
    git stash drop $(git stash list | sed 's/:.*//' | head -n 1)
}

clbranches() {
    git branch | grep -v "master" | xargs git branch -D
}

alias g="git"
alias cb="get_current_branch"
alias gb="g branch"
alias gck="g checkout"
alias gpo="g push origin"
alias gpocb="git_push_ocb"
alias gpcb="git push origin $(get_current_branch)"
alias gplocb="git_pull_ocb"
alias gplom="git pull origin master"
alias gplo="g pull origin"
alias gs="git status"
alias gd="git diff"
alias gl="git log --pretty=oneline"

alias gac_bashes="git_add_commit_bashes"

# Linux
alias ptj="python -mjson.tool"
alias ll="ls -l"

# Function sync personal scripts with cloud repository
export BASH_UTILS=~/www/personal-scripts
customsync() {
    cat ~/.vimrc > $BASH_UTILS/vimrc
    cat ~/.bash_aliases > $BASH_UTILS/bash_aliases.sh
    cd $BASH_UTILS

    git add . --all
    now=$(date +"%Y.%m.%d_%H.%M.%S")
    git commit -m "Update $now"
    $(git_push_ocb)

    #cat vimrc > ~/.vimrc
    #cat bash_aliases.sh > ~/.bash_aliases
}


# Aliases that have dependencies
[ -f ~/.bash_aliases_dependency ] && source ~/.bash_aliases_dependency
