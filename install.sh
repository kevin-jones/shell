shopt -s expand_aliases
git clone --bare git@github.com:kevin-jones/shell.git $HOME/.shell
alias config='/usr/bin/git --git-dir=$HOME/.shell/ --work-tree=$HOME'
config checkout
