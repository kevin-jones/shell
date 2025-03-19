# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias config='/usr/bin/git --git-dir=$HOME/.shell/ --work-tree=$HOME'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# Tail the laravel.log
function lalog() {
    local LOG_DIR="${1:-storage/logs}"       # optional first argument for custom log dir
    local TODAY_LOG="laravel-$(date +%F).log"
    local DEFAULT_LOG="laravel.log"

    # Full paths for convenience
    local TODAY_PATH="$LOG_DIR/$TODAY_LOG"
    local DEFAULT_PATH="$LOG_DIR/$DEFAULT_LOG"

    if [ -f "$TODAY_PATH" ]; then
        echo "Tailing today's log ($TODAY_LOG)..."
        tail -f "$TODAY_PATH"
    elif [ -f "$DEFAULT_PATH" ]; then
        echo "Today's log not found; falling back to $DEFAULT_LOG..."
        tail -f "$DEFAULT_PATH"
    else
        echo "No log file found at either:"
        echo " - $TODAY_PATH"
        echo " - $DEFAULT_PATH"
        return 1
    fi
}

