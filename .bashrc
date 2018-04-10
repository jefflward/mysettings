# .bashrc

# User specific aliases and functions

alias   ll='ls -l --color'
alias   ls='ls -G --color'
alias   la='ls -a -G --color'
alias   l='ls -al -G --color'
alias   lt='ls -alrt -G --color'
alias   c='clear'
alias   h='history'
alias   gvim='/cygdrive/c/Program\ Files\ \(x86\)/Vim/vim74/gvim'

alias   vs='cygstart `find . -maxdepth 2 -name "*.sln"`'
alias   open='cygstart'

alias   less='less -X '
alias   blame="git blame --date=format: $1 | awk '{sub(/\(.*\s+/,\"\")}1'"

#alias   gvim="~/bin/gvim"
alias   ssh-agent-cyg='eval `ssh-agent -s`'
set -o vi

# Example for loop to append .jpg to files
#  for i in $(ls * | grep -v jpg); do mv $i $i.jpg; done

# Fixes the prompt wrapping on itself.  No idea why this works...
alias   fix_term='kill -WINCH $$'

export LS_COLORS='no=00:fi=00:di=00;36:ln=00;35:ex=00;92'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export nodosfilewarning

#if [ -n "$PS1" ]; then PS1='\u@\h:\w\$ '; fi

#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

if [ -e "${HOME}/.git-completion.bash" ] ; then 
   source "${HOME}"/.git-completion.bash 
fi 

export PATH=$PATH:~/GitHub:~/bin

export TERM=xterm-256color

if [ -e /dev/clipboard ]; then
   alias pbcopy='cat >/dev/clipboard'
   alias pbpaste='cat /dev/clipboard'
fi

# PROMPT for git

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[0;36m\]"
MAGENTA="\[\033[0;35m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

ahead_color=${LIGHT_GRAY}
behind_color=${LIGHT_GRAY}
 
function parse_git_branch {
git_dir=$(git rev-parse --git-dir 2> /dev/null)
if [[ ${git_dir} =~ ".git" ]]; then
  head=$(more $git_dir/HEAD)
  branch=${head##*/} 
  behind=$(git log --oneline HEAD..origin 2> /dev/null | wc -l)
  ahead=$(git log --oneline origin..HEAD 2> /dev/null | wc -l)
  if [[ ${ahead} > 0 ]]; then
    ahead_color=${MAGENTA}
  fi
  if [[ ${behind} > 0 ]]; then
    behind_color=${RED}
  fi
  echo -e " (${branch} ${behind_color}${behind}${LIGHT_GRAY}|${ahead_color}${ahead}${GREEN})${remote}"
fi
}
 
function prompt_func() {
previous_return_value=$?;
# prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
prompt="${TITLEBAR}${LIGHT_GRAY}[${YELLOW}\w${GREEN}$(parse_git_branch)${LIGHT_GRAY}]${COLOR_NONE} "
if test $previous_return_value -eq 0
then
  PS1="${prompt}: "
fi
}
 
PROMPT_COMMAND=prompt_func

umask 022

command_not_found_handle() {
    if cmd.exe /c "(where $1 || (help $1 |find /V \"/?\")) >nul 2>nul && ($* || exit 0)"; then
        return $?
    else
        if [ -x /usr/lib/command-not-found ]; then
           /usr/lib/command-not-found -- "$1"
           return $?
        elif [ -x /usr/share/command-not-found/command-not-found ]; then
           /usr/share/command-not-found/command-not-found -- "$1"
           return $?
        else
           printf "%s: command not found\n" "$1" >&2
           return 127
        fi
    fi
}
