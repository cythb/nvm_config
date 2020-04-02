# README

# 0x01. defx-icon
## Install font

```bash
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

![install-font.png](images/install-font.png)

# 0x02. Markdown

```bash
#install grip
brew install grip
```

- <c-m> Open chrome to preview
- ~~Generate html when you save file (:w)~~

# 0x03. zshrc
Maintain one copy of .zshrc on git, so you should remove the local one and link to this new one.

```bash 
rm ~/.zshrc
ln -s ~/.config/nvim/iterm2/.zshrc ~/.zshrc
```

# 0x04. 安装oh-my-zsh主题

1. 在.zshrc中配置`export ZSH_CUSTOM`
2. `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"`
3. `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"`

注意如果用户名不是ihugo,则需要创建一个软link。比如 `ln -s /Users/hugo /Users/ihugo`


# 0x05. 安装iterm2 dark mode配色

在iterm中有一个dark模式的配色`Dracula.itermcolors`
light mode的配色暂时选择用 `Solarized light`

