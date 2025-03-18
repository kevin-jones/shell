# shell
Configure your shell with common aliases and config

## deploy to a new machine

```bash
git clone --bare git@github.com:kevin-jones/shell.git $HOME/.shell
alias config='/usr/bin/git --git-dir=$HOME/.shell/ --work-tree=$HOME'
config checkout
```

or

```bash
$ curl -Lks https://bit.ly/kj-shell | /bin/bash
```

