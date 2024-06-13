### Copy script reverse-shells and upgrade-shell in /opt directory

### Setup aliases
alias reverse-shells='reverse_shells'
alias upgrade-shell='upgrade_shell'

export PATH=$PATH:/opt/scripts

reverse_shells(){
        cat /opt/reverse-shells
}

upgrade_shell() {
        cat /opt/upgrade-shell
}

