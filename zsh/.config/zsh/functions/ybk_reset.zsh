#!/bin/zsh

gpg2 --card-status > /dev/null

if [[ -S "$HOME/.gnupg/S.gpg-agent.ssh" ]]
then
  echo "resetting yubikey..."
    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
    gpgconf --launch gpg-agent
    gpgconf --kill all
    exec > /dev/null
    gpg2 --card-status > /dev/null && ssh-add -L > /dev/null
    exec > /dev/tty
  echo "ybikey reset"
else
  echo "didn't find gpg-agent.ssh"
fi
