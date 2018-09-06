#!/bin/sh

get_os() {
  uname_out="$(uname -s)"
  case "${uname_out}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${uname_out}"
  esac
  echo ${machine}
}

homebrew_mac_install() {
  if ! command -v brew
  then
    echo "Installing macOS Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "macOS Homebrew installed."
  else
    echo "Homebrew is already installed"
  fi
}

# homebrew_linux_install() {
# }

case $(get_os) in
  Mac)    homebrew_mac_install;;
esac

brew bundle
