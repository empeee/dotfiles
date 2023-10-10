# .bashrc

# Source Silicon Team bashrc
if [ -f /opt/tools/bin/silicon_team_bashrc ]; then
        . /opt/tools/bin/silicon_team_bashrc
elif [ -f /etc/bashrc ]; then # look for system bashrc if we dont find the silicon team file
  . /etc/bashrc
fi

#
# User customization starts here
#

# Setup Prompt

# Are we running in a docker

shopt -s direxpand

if [ -f /proc/self/cgroup ]; then
  grep docker /proc/self/cgroup > /dev/null
  if [ $? -eq 0 ] ; then
    export IS_DOCKER="docker "
  fi
fi

if [ "$TERM" == "xterm" ] || [ "$TERM" == "screen" ] || [ "$TERM" == "xterm-256color" ]; then
  reset=$(tput sgr0)
  bold=$(tput bold)
  black=$(tput setaf 0)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
  white=$(tput setaf 7)
  user_color=$yellow
  [ "$UID" -eq 0 ] && { user_color=$red; }

  alias ls='ls --color=auto'
  alias __git_ps1='git rev-parse --abbrev-ref HEAD >& /dev/null && echo "{`git rev-parse --abbrev-ref HEAD`}"'

  export PS1='\[$reset\]\[$user_color\][\u@\h]\[$reset\]$(__git_ps1) \[$cyan\]jobs=\j\[$reset\] \w \n\[$bold\][\@]\[$reset\] $IS_DOCKER>'
else
  export PS1='[\u@\h] $(__git_ps1) jobs=\j \w \n[\@] $IS_DOCKER>'
fi

#
export MAILCHECK=0   # Disable mail messages in shell

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

umask 002                                          # set a reasonable umask
export SWS_TOOLS=$HOME/sws_tools
export EDITOR=vi                                   # User's should set their favorite editor here
export VISUAL=gvim
export LS_COLORS

remove_path .
prepend_path .                                     # current directory

[ -n "$PS1" ] && source $HOME/.bash_profile;

