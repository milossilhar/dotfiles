if [[ $OSTYPE == "darwin"* ]] -a [ -e "./bash_aliases_mac" ]; then
    source .bash_aliases_mac
fi

# ls tweaks :D
alias ls='ls -G' # colorful
alias ll='ls -lh' # long output right away
alias la='ls -a' # all output
alias lA='ls -A'
alias lm='ls|more'
alias lla='ls -la' # all and long