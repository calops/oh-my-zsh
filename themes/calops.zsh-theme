# -*- mode: zsh; -*-
# vim: set ft=zsh:
#
# author: Rémi "calops" Labeyrie
# file: calops.zsh-theme
#
# Theme derived from the "fazz" theme
#
# Features:
# - Regular prompt:
#   - ssh tag if inside an SSH session
#   - username@hostname
#   - 3-levels path
# - Reverse prompt:
#   - "true" git prompt indicators (from official git scripts)
#   - number of suspended jobs
#   - error code
#
# Recommended setting in your .zshrc:
# setopt transient_rprompt
#
# SSH
local ssh
if [ ! -z "$SSH_TTY" ]; then
    ssh='%{${fg_bold[red]}%}ssh%{$reset_color%} '
fi

# Hostname
local hostname
hostname="%{${fg[cyan]}%}%n%{${fg[blue]}%}@%{$reset_color%}%{${fg[cyan]}%}%m"

# Git
local git
if whence prompt_git_status >/dev/null; then
    git='$(prompt_git_status "(%s)")'
fi

# Path
local pathname
pathname="%{${fg_bold[green]}%}%3~%{$reset_color%}"

# Separator
local separator=' '

# Caret
local caret
local caretcolor
if [ "$USER" = "root" ]; then
    caretcolor="red"
else
    caretcolor="blue"
fi
caret=" %{${fg[$caretcolor]}%}%#%{${reset_color}%} "

# Background jobs
local job='$(if [ ! -z "$(jobs)" ]; then echo "%{${fg[yellow]}%} ⚙ %j"; fi)'

# Vi mode
local vi='$(vi_mode_prompt_info)'

# Error code
local error="%(?..%{$fg[red]%} %? ↵)"

PS1="${ssh}${hostname}${separator}${pathname}${caret}"
RPS1="${vi}${git}${job}${error}%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"
