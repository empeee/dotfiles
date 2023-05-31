#alias ls='ls --color=auto'
alias lsa='ls -lah'

#alias grep='grep --color=auto'

alias git-graph='git log --all --decorate --oneline --graph'

# Unraid
alias cdapp='cd /mnt/user/appdata'

# Arch
alias pacman-unused='pacman -Qtdq'
alias pacman-remove-unused='sudo pacman -Rns $(pacman-unused)'
alias pacman-user-installed='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)'
