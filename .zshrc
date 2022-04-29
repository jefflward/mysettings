alias c='clear'
alias ls='ls --color'
alias l='ls -al --color'

export LSCOLORS='gxfxcxdxbxegedabagacad'

function powerline_precmd() {
    PS1="$(powerline-go -modules venv,host,ssh,cwd,perms,git,hg,jobs,exit -hostname-only-if-ssh -shell zsh)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
# Setup zsh completion
autoload -U compinit && compinit
zmodload -i zsh/complist
ZSH_THEME="agnoster"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# set up nvm to use a symlink for the current version at $NVM_DIR/current
export NVM_SYMLINK_CURRENT=true
# Add NVM to PATH
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash
# Add dotnet tools to PATH
export PATH="$PATH:/Users/j.ward/.dotnet:/Users/j.ward/.dotnet/tools"
