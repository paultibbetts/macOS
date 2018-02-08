#!/bin/sh

# Variables
user="${USER}"
repo="https://github.com/ptibbetts/macOS.git"
install="$HOME/.macOS"

# Text formatting
bold=$(tput bold)
normal=$(tput sgr0)

echo() {
  printf "$1\n"
}

confirm() {
  read -r -p "${1}" response
  case "$response" in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
    esac
}

# Confirmation
if ! confirm "Are you sure you want to do this? [y\N]: "; then
  echo "Cancelling…"
  exit
fi

# Exit if the scripts run into any errors
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT
set -e

# Ensure Apple's command line tools are installed
if ! command -v cc >/dev/null; then
  echo "${bold}XCode:${normal} Installing…"
  xcode-select --install
else
  echo "${bold}XCode:${normal} Skipping, already installed."
fi

# Install Homebrew
if ! command -v brew >/dev/null; then
  echo "${bold}Homebrew:${normal} Installing…"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
else
  echo "${bold}Homebrew:${normal} Skipping, already installed."
fi

# Install Git with Homebrew
if ! command -v git >/dev/null; then
  echo "${bold}Git:${normal} Installing…"
  brew install git
else
  echo "${bold}Git:${normal} Skipping, already installed."
fi

# Install Ansible with Homebrew
if ! command -v ansible >/dev/null; then
 echo "${bold}Ansible:${normal} Installing…"
 brew install ansible
else
 echo "${bold}Ansible:${normal} Skipping, already installed."
fi

# Clone the repository to the local drive and cd into it
if [ -d $install ]; then
  echo "${bold}Playbook:${normal} Already installed, attempting to update…"
  cd $install
  git pull origin master
else
  echo "${bold}Playbook:${normal} Cloning…"
  git clone $repo $install
  cd $install
fi

echo "${bold}Ansible:${normal} Installing roles…"
ansible-galaxy install -r requirements.yml 

echo "${bold}Running ansible playbook for user ${user}…"
ansible-playbook playbook.yml -e install_user=${user} -i hosts --ask-become-pass

echo "${bold}Done!"