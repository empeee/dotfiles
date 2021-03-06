# If this is a non-interactive shell then exit
if (! $?prompt) exit

# Source any files here
# your aliases file
if ( -e ~/.alias_csh ) source ~/.alias_csh

#xrdb ~/.Xdefaults
set   black="%{\033[0;30m%}"
set    blue="%{\033[0;34m%}"
set    cyan="%{\033[0;36m%}"
set   green="%{\033[0;32m%}"
set  orange="%{\033[1;31m%}"
set  purple="%{\033[1;35m%}"
set     red="%{\033[0;31m%}"
set  violet="%{\033[1;35m%}"
set   white="%{\033[0;37m%}"
set  yellow="%{\033[0;33m%}"
set     end="%{\033[0m%}" # This is needed at the end... :(

#set prompt="$USER@`hostname`: %~> "
#set prompt="${green}%n${white}@${blue}%M ${white}%~${green} >${end} "
set prompt="\n${orange}%n${white} at ${yellow}%M${white} in ${green}%~\n${white}$ ${end}"
set autolist
set color
set colorcat

setenv TERM screen-256color
setenv WORKENV 1

if (-e ~/.dircolors ) eval `dircolors -c ~/.dircolors`
