#!/bin/bash
# Settings to my Account MilosSilhar

# Colored ls
export CLICOLOR=1
export LSCOLORS=dxcxfxexbxhaahBxBaDaDx

export PATH=$PATH:~/.bin

# stupid Apple Shell Warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Using TextMate with subversion programs
export EDITOR="/usr/local/bin/mate -w"

# Make common paths
export TV_SERIES_LOCAL="/Volumes/Media/TV Series/"
export TV_SERIES_EXT="/Volumes/My Passport/TV Series/"
export MOVIES_LOCAL="/Volumes/Media/Movies/"
export MOVIES_EXT="/Volumes/My Passport/Movies/"

export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Make some aliases

# login to Aisa at FI MUNI
alias aisa='ssh xsilhar@aisa.fi.muni.cz'

# ls tweaks :D
alias ls='ls -G' # colorful
alias ll='ls -lh' # long output right away
alias la='ls -a' # all output
alias lA='ls -A'
alias lm='ls|more'
alias lla='ls -la' # all and long

# get image dimensions
alias imgdim="sips -g pixelHeight -g pixelWidth"

# make mac sleep
alias slp="osascript -e 'tell app \"Finder\" to sleep'"

# open file in different applications
alias play="open -a MPlayerX"
alias text="open -a TextMate"
alias web="open -a Safari"
alias rr="open -a RStudio"

# restart dock cause that stupid bug :(
alias restartDock="killall -Kill Dock"

# sync tv series folder to my volume (have to rewrite it as some script because this has so many flaus)
alias syncTVShows="/usr/local/bin/rsync -au --delete --progress /Volumes/Media/TV\ Series/ /Volumes/My\ Passport/TV\ Series/"
alias syncMovies="/usr/local/bin/rsync -au --delete --progress /Volumes/Media/Movies/ /Volumes/My\ Passport/Movies/"
alias syncToDest="rsync -au --delete --progress"
alias showLastTVSeries="~/.utilities/lastFile.py \"$TV_SERIES_EXT\""
alias showMovies="find /Volumes/My\ Passport/Movies ! -path /Volumes/My\ Passport/Movies -type d | cut -c 29- | sort"

# IB015 Neimperativne programovanie
alias haskell="stack ghci"

# GCC alias with all flags
alias gccf='gcc -std=c99 -pedantic -Wall -Wextra -Werror'
alias gccf+='clang++ -std=c++1y -pedantic -Wall -Wextra -Werror'
# C++ formatting function
function cpp-format() {
	FILE=$1;
	clang-format -style=file $FILE | diff -au $FILE - >${FILE}.patch;
}

# GIT changing username and email
function setGitHub() {
  git config --global user.name "milossilhar"
  git config --global user.email "migmig095@gmail.com"
}
function setGitLab() {
  git config --global user.name "Miloš Šilhár"
  git config --global user.email "xsilhar@fi.muni.cz"
}
export -f setGitHub
export -f setGitLab

# Bakalarska praca
#alias mongod='sudo mongod -f /usr/local/etc/mongod.conf'
#alias mongors1='echo -n -e "\033]0;27017\007"; sudo mongod -f /usr/local/etc/mongors1.conf'
#alias mongors2='echo -n -e "\033]0;27018\007"; sudo mongod -f /usr/local/etc/mongors2.conf'
#alias mongors3='echo -n -e "\033]0;27019\007"; sudo mongod -f /usr/local/etc/mongors3.conf'
#export RS_HOSTS='192.168.1.1:27017,192.168.1.1:27018,192.168.1.1:27019'

# Diplomova praca
alias kafka='zookeeper-server-start ~/Dropbox/diplomka/configs/zookeeper.properties & kafka-server-start ~/Dropbox/diplomka/configs/server-1.properties'
alias kafka1='echo -n -e "\033]0;kafka-1\007"; kafka-server-start ~/Dropbox/diplomka/configs/server-1.properties'
alias kafka2='echo -n -e "\033]0;kafka-2\007"; kafka-server-start ~/Dropbox/diplomka/configs/server-2.properties'
alias kafka3='echo -n -e "\033]0;kafka-3\007"; kafka-server-start ~/Dropbox/diplomka/configs/server-3.properties'

# LaTeX
#alias vlna='vlna -r -l -v KkSsVvZzOoUuAaIi'

# Make my own PS1 and PS2
export PS1="\[\e[00;35m\]\u\[\e[0m\] @ \[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\][\W]\[\e[0m\]\$ "
export PS2="\[\e[00;32m\]>\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
