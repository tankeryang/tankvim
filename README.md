# TANKVIM

- neovim: v0.10.x
- ref: [nvimdots](https://github.com/ayamir/nvimdots)

## Pre-Requirements

### Linux

```bash
sudo apt install python3-dev python3-pip python3-venv ripgrep
npm install -g tree-sitter-cli
```

> NOTE: `python3-venv` is for plugin **Mason**, `ripgrep` is for plugin **telescope**, `tree-sitter-cli` is for plugin **nvim-treesitter**

install golang for golang plugin

if use **Windows WSL**, you should install `win32yank` to support clipboard (use `y` and `p` to copy and paste)  
download the latest releases here: [Releases](https://github.com/equalsraf/win32yank/releases)

```bash
# move to a Downloads folder
curl -sLo win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
unzip -p win32yank.zip win32yank.exe > ~/.local/bin/win32yank.exe
chmod +x ~/.local/bin/win32yank.exe
```
