# Adding GIT completion to ZSH (https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh)
autoload -Uz compinit && compinit

# Adding GIT branch info to PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

# Making my PROMPT
setopt PROMPT_SUBST
PROMPT='%F{yellow}%*%f %F{cyan}%~%f %F{red}${vcs_info_msg_0_}%f%F{magenta}%#%f '

# Homebrew integration to ZSH
eval "$(/usr/local/bin/brew shellenv)"

# ls tweaks :D
# Colored ls
CLICOLOR=1
LSCOLORS=dxcxfxexbxhaahBxBaDaDx
alias ls='ls -G' # colorful
alias ll='ls -lh' # long output right away
alias la='ls -a' # all output
alias lA='ls -A'
alias lm='ls|more'
alias lla='ls -la' # all and long

# make mac sleep
alias slp="osascript -e 'tell app \"Finder\" to sleep'"

# restart dock cause that stupid bug :(
alias restartDock="killall -Kill Dock"export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Adding JAVA to PATH
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
