#!/bin/bash
set -e

set -euo pipefail
 
function command_exists() {
  type "$1" &> /dev/null ;
}
 
: "install brew" && {
  if ! command_exists brew; then
    info "installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "installed brew "
  else
    echo "brew is already installed"
  fi
}

: "install zsh by brew" && {
  BREW_ZSH_PATH="/usr/local/bin/zsh"
  if ! brew list | grep zsh &> /dev/null; then
    brew install zsh zsh-completions
    sudo sh -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells'
    chsh -s $(brew --prefix)/bin/zsh
    echo "installed zsh"
  else
    echo "zsh is already installed"
  fi
}

: "install other packages by brew" && {
  packages=( peco tree wget )
  for package in ${packages[@]}; do
    if ! brew list | grep $package &> /dev/null; then
      #info "installing ${package}..."
      brew install ${package}
      echo "installed ${package}"
    else
      echo "${package} is already installed"
    fi
  done
}

: "install zplug" && {
  ZPLUG_DIR=$HOME/.zplug
  if [ ! -e $ZPLUG_DIR ]; then
    #info "installing zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    #brew install zplug
    echo "installed zplug "
  else
    echo "zplug is already installed"
  fi
}

: "clone dein" && {
  DEIN_DIR=$HOME/dotfile/.cache/dein/repos/github.com/Shougo/dein.vim
  if [ ! -e $ZPLUG_DIR ]; then
    echo "make dir for dein"
    mkdir -p DEIN_DIR
    git clone git@github.com:Shougo/dein.vim.git $DEIN_DIR
    echo "cloned dein "
  else
    echo "dein is already cloned"
  fi
}

: "install other packages by brew" && {
  packages=( nodebrew )
  for package in ${packages[@]}; do
    if ! brew list | grep $package &> /dev/null; then
      #info "installing ${package}..."
      brew install ${package}
      echo "installed ${package}"
      source .zshrc
    else
      echo "${package} is already installed"
    fi
  done
}


echo "Set Complete!"
