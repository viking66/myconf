#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
shopt -s checkwinsize
complete -cf sudo

export GREP_COLOR="1;33"
export LESS="-R"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias tmux='tmux -2'
export EDITOR=vim

source ~/.git-completion.bash

export HISTFILESIZE=
export HISTSIZE=
export HISTFILE=~/.bash_eternal_history
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

#PATH="~/bin:$PATH"

prompt_command () {
    local rts=$?
    local w=$(echo "${PWD/#$HOME/~}" | sed 's/.*\/\(.*\/.*\/.*\)$/\1/') # pwd max depth 3
# pwd max length L, prefix shortened pwd with m
    local L=30 m='...'
    [ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
    local w="\[\033[0;32m\]${m}\[\033[0;37m\]${w:$n}\[\033[0m\]" ; } \
    ||   local w="\[\033[0;37m\]${w}\[\033[0m\]"
# different colors for different return status
    [ $rts -eq 0 ] && \
    local p="\[\033[0;36m\]>\[\033[1;36m\]>\[\033[m\]" || \
    local p="\[\033[0;31m\]>\[\033[1;31m\]>\[\033[m\]"
    local rt="\[\033[0:32m\][\u@\h]"
    # PS1="${rt} ${w} ${p} "
    PS1="${w} ${p} "
    history -a; history -c; history -r
}
PROMPT_COMMAND=prompt_command

LS_COLORS='no=00:fi=00:di=02;32:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;93:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.tex=01;33:*.sxw=01;33:*.sxc=01;33:*.lyx=01;33:*.pdf=0;35:*.ps=00;36:*.asm=1;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=1;30:*.am=1;33:*.py=0;34:'
export LS_COLORS
