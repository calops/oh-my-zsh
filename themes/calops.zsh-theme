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
    ssh='%B%F{red}ssh %b'
fi

# Hostname
local hostname
hostname="%F{cyan}%n%B%F{blue}@%b%F{cyan}%m%f"

# Git
local git
if whence prompt_git_status >/dev/null; then
    git='$(prompt_git_status "(%s)")'
fi

# Path
local pathname
pathname="%B%F{green}%3~%b"

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
caret=" %B%F{$caretcolor}%#%b "

# Background jobs
local job='$(if [ ! -z "$(jobs)" ]; then echo "%F{yellow} ⚙ %j"; fi)'

# Vi mode
local vi='$(vi_mode_prompt_info)'

# Error code
local error="%(?..%F{red} %? ↵)"

PS1="${ssh}${hostname}${separator}${pathname}${caret}%b%f"
RPS1="${vi}${git}${job}${error}%b%f"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{cyan}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

MODE_INDICATOR="%B%F{magenta}<%b%F{magenta}<<%{$reset_color%}"
