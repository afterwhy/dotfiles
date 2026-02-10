afterhwy dotfiles
===================

Repository to store and bootstrap dotfiles

Currently contains:

* zsh
* starship

## Usage

1. Install dependencies

> NOTE: Starhip installation is not implemented yet.

```sh
.\bootstrap.sh
```

2. Add symlinks

```sh
ln -s /path/to/this/repo/zsh ~/.config/zsh
ln -s /path/to/this/repo/starship.toml ~/.config/starship.toml
```

3. Source zshrc in ~/.zshrc

```sh
echo 'source ~/.config/zsh/zshrc' >> ~/.zshrc
```
