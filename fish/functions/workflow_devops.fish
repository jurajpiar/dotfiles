function hostfile --description 'Opens local host file in the default editor'
  eval sudo $EDITOR /etc/hosts
end

function lssh --description 'Quickly list all hosts in ssh config'
  command grep -w -i "Host" ~/.ssh/config | sed 's/Host//'
end

function editssh --description 'Opens ssh known host file in the default editor'
  eval $EDITOR ~/.ssh
end

function pubkey
    cat ~/.ssh/id_rsa.pub | pbcopy; and echo '=> Public key copied to clipboard.'
end

# Often used shortcuts/aliases for Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com" # dumps [YOUR PUBLIC IP] [URL IP]
alias localip="ipconfig getifaddr en0" #internal network IP
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Often used shortcuts/aliases for View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias htop="btm"

# Apps/VMs/Docker/Vagrant - see vaga.fish
alias dcons="docker container ls --all"
alias dc="docker-compose"
alias dcrun="docker-compose run --rm"
alias vssh="vagrant ssh"

# Editors
#alias code="code-insiders"
alias mux="tmux"
alias vim="nvim"

# Language Support
alias python="python3"
#alias pip="pip3"
