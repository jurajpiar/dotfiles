function ybk_reset --description 'Reset yubikey'
  gpg2 --card-status > /dev/null

  if test -S "$HOME/.gnupg/S.gpg-agent.ssh"
      echo "resetting yubikey..."
      set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
      gpgconf --launch gpg-agent
      gpgconf --kill all
      gpg2 --card-status > /dev/null
      ssh-add -L > /dev/null
      echo "yubikey reset"
  else
      echo "didn't find gpg-agent.ssh"
  end
end
