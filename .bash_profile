#
# .bash_profile
#
# @author Trey Keenon
# @see .inputrc
#

# Nicer prompt.
export PS1="\[\e[0;32m\]\]\[\] \[\e[1;32m\]\]\t \[\e[0;2m\]\]\w \[\e[0m\]\]\[$\] "

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations.
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$PATH

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
    source ~/.bash_aliases
fi

# Include bashrc file (if present).
if [ -f ~/.bashrc ]
then
    source ~/.bashrc
fi

# Include iTerm2 shell integration (if present).
if [[ -f ~/.iterm2_shell_integration.bash ]]; then
    source ~/.iterm2_shell_integration.bash
fi

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
    if [[ ! "$1" ]] ; then
        echo "You must supply a branch."
        return 0
    fi
    
    BRANCHES=$(git branch --list $1)
    if [ ! "$BRANCHES" ] ; then
        echo "Branch $1 does not exist."
        return 0
    fi
    
    git checkout "$1" && \
    git pull upstream "$1" && \
    git push origin "$1"
}

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Turn on Git autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Turn on kubectl autocomplete.
if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion bash)
fi