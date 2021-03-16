# Manish Yadav's Dotfiles

![Terminal](terminal.png)

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Prerequisite

### iTerm

Download iTerm from [website](https://iterm2.com/downloads.html)

### Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

You could close this repository wherever you want and run the following command

```bash
git clone https://github.com/meanmachin3/dot-files.git && cd dot-files

```

Give executable permission to the script

```bash
chmod +x setup.sh
```

To install, run the following command

```bash
./setup.sh
```

To install vim plugins, install vim-plug using 

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
