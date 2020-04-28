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
2. 进入目录更新submodule
```bash
cd /Users/ihugo/.config/nvim/iterm2/themes/spaceship-prompt
git submodule update --init
```
3. `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"`

注意如果用户名不是ihugo,则需要创建一个软link。比如 `ln -s /Users/hugo /Users/ihugo`

# 0x05. 安装iterm2 dark mode配色

在iterm中有一个dark模式的配色`Dracula.itermcolors`
light mode的配色暂时选择用 `Solarized light`

# 0x06. 同步Alfred数据
Alfred/Advanced页面左下有一个按钮`Set preferences folder`。设置成OneDriver中`macOS/apps/Alfred/`即可。

# 0x07. 删除`spaceship.zsh-theme`
```bash
rm $ZSH/themes/spaceship.zsh-theme
```

# 0x08. ctags
安装ctags 

```bash
brew install ctags
ln /Users/ihugo/.config/nvim/.ctags ~/.ctags
```

ctags使用方法： 

- (c-]) 跳转到方法实现； 

- (control-t)返回跳转前位置;

# 0x09. 使用caps键代替control键
因为caps使用频率不高，所以决定使用**使用caps键代替control键**
在苹果设置(setting/keyboard/modifier keys)里面将caps和control键交换。
主要是因为无法在vim层面将caps替换成control。

# 0x10. vim键位设置
1. ~~使用tab键来代替esc。~~
    1. <Tab>用来匹配括号，选择补全比较方便。
    2. 为了保持和xcode统一。
    3. 通过<C-[>来替换ESC使用也是比较方便。
2. use <C-i> to insead of <Tab>

# 0x11. frida-ios-dump
install frida-ios-dump
update .zshrc
