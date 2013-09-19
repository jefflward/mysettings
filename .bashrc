# .bashrc

# User specific aliases and functions

alias   ll='ls -l --color'
alias   ls='ls -G --color'
alias   la='ls -a -G --color'
alias   l='ls -al -G --color'
alias   lt='ls -alrt -G --color'
alias   c='clear'
alias   h='history'

alias   gvim="~/bin/gvim"

# Fixes the prompt wrapping on itself.  No idea why this works...
alias   fix_term='kill -WINCH $$'

export LS_COLORS='no=00:fi=00:di=00;36:ln=00;35:ex=00;92'

export nodosfilewarning

#if [ -n "$PS1" ]; then PS1='\u@\h:\w\$ '; fi

#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'


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
 
function parse_git_branch {
 
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="${RED}Z"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}^"
    else
      remote="${YELLOW}v"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}^v"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}
 
function prompt_func() {
    previous_return_value=$?;
    # prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
    prompt="${TITLEBAR}${BLUE}[${YELLOW}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE} "
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}: "
    else
        PS1="${prompt}${RED}:${COLOR_NONE} "
    fi
}
 
PROMPT_COMMAND=prompt_func

if [ -e "${HOME}/.git-completion.bash" ] ; then 
   source "${HOME}"/.git-completion.bash 
fi 

export PATH=$PATH:~/GitHub

export TERM=xterm-256color

