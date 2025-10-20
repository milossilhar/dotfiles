#!/bin/bash

# stupid Apple Shell Warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Using TextMate with subversion programs
export EDITOR="/usr/local/bin/mate -w"

# Make some aliases

# get image dimensions
alias imgdim="sips -g pixelHeight -g pixelWidth"

# GIT changing username and email
function setGitHub() {
  git config --global user.name "Miloš Šilhár"
  git config --global user.email "migmig095@gmail.com"
}
export -f setGitHub

# Make my own PS1 and PS2
export PS1="\[\e[00;35m\]\u\[\e[0m\] @ \[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\][\W]\[\e[0m\]\$ "
export PS2="\[\e[00;32m\]>\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
