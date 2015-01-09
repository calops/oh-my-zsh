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
# If you have the git-prompt script installed on your system, specify the path
# in the environment variable GIT_PS1_PATH. Default is
# "/etc/bash_completion.d/git-prompt". If none is found, a copy of the script
# is provided in this plugin, but there is no warranty that it is up to date.
#
# Usage:
# Set PROMPT or RPROMPT like this:
# PROMPT='%n@%m %3~$(prompt_git_status " [%s]") %# '
#
# Default string for __git_ps1 is " (%s)"
#
# Load the official git-prompt script written for bash
# TODO: make something a little more generic

if [ ! -z "$GIT_PS1_PATH" ]; then
    source $GIT_PS1_PATH
elif [ -f "/usr/lib/git-core/git-sh-prompt" ]; then
    source /usr/lib/git-core/git-sh-prompt
else
    source $ZSH/plugins/truegit/git-sh-prompt
fi

# Allow for functions in the prompt
setopt prompt_subst

# TODO: parse output so it can be colorized
function prompt_git_status() {
    local str="$1"

    if whence __git_ps1; then
        __git_ps1 $str
    fi
}
