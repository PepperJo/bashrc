# .bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

source /etc/profile.d/vte.sh

source /usr/share/git/git-prompt.sh

COLOR_USERNAME="31"
COLOR_HOSTNAME="33"
COLOR_PATH="34"

function fg_color {
    printf "\[\033[%sm\]%s\[\033[m\]" $1 $2
}

GIT_PRE="[$(fg_color $COLOR_USERNAME "\u")@$(fg_color $COLOR_HOSTNAME "\h"):$(fg_color $COLOR_PATH "\w")"
GIT_POST="]\$ "
GIT_FORMAT="|%s"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_STATESEPARATOR=""
GIT_PS1_HIDE_IF_PWD_IGNORED=1

function __restore_path {
    __vte_osc7 2>/dev/null
}

if [ "$TERM" != "linux" ]; then
     PROMPT_COMMAND="__restore_path;__git_ps1 '$GIT_PRE' '$GIT_POST' '$GIT_FORMAT'"
fi

export HISTFILESIZE=5000
export HISTSIZE=5000
shopt -s checkwinsize
