# ZSH Git Prompt Plugin from:
# http://github.com/calops/oh-my-zsh
#
# Recommended settings in your .zshrc:
#     export GIT_PS1_SHOWDIRTYSTATE=1
#     export GIT_PS1_SHOWSTASHSTATE=1
#     export GIT_PS1_SHOWUNTRACKEDFILES=1
#     export GIT_PS1_SHOWUPSTREAM=verbose
#     export GIT_PS1_DESCRIBE_STYLE=branch
#     export GIT_PS1_SHOWCOLORHINTS=1
#
# Usage:
# Set PROMPT or RPROMPT like this:
# PROMPT='%n@%m %3~$(prompt_git_status " [%s]") %# '
#
# Default string for __git_ps1 is " (%s)"
#
# Load the official git-prompt script written for bash
# TODO: make something a little more generic
source /etc/bash_completion.d/git-prompt

# Allow for functions in the prompt
setopt prompt_subst

# TODO: parse output so it can be colorized
function prompt_git_status() {
    local str="$1"

    if which __git_ps1 >/dev/null 2>&1; then
        __git_ps1 $str
    fi
}
