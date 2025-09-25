# ton1ght's config

## Setup config on new machine

```sh
git clone --bare git@github.com:ton1ght/config.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "checked out config.";
  else
    echo "backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -i{} mv {} .config-backup/{}
fi;
config checkout
config config status.showuntrackedfiles no
config submodule update --init --recursive
```

## Recommended Software

- fzf
- eza
- neovim
- ranger

## Credits

Thanks to:

- https://www.atlassian.com/git/tutorials/dotfiles
