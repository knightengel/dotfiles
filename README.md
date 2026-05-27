<h1 align="center">dotfiles</h1>

<p align="center">Personal macOS dotfiles managed with GNU Stow</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS-0f172a?style=for-the-badge&logo=apple" alt="macOS">
  <img src="https://img.shields.io/badge/manager-GNU%20Stow-1f2937?style=for-the-badge&logo=gnu" alt="GNU Stow">
  <img src="https://img.shields.io/badge/shell-zsh-0b3d2e?style=for-the-badge&logo=gnubash" alt="zsh">
  <img src="https://img.shields.io/badge/editor-Neovim-14532d?style=for-the-badge&logo=neovim" alt="Neovim">
  <img src="https://img.shields.io/badge/terminal-Ghostty-082f49?style=for-the-badge" alt="Ghostty">
</p>

<p align="center">
  <a href="#quick-start"><img src="https://img.shields.io/badge/Quick%20Start-2563eb?style=for-the-badge" alt="Quick Start"></a>
  <a href="#install"><img src="https://img.shields.io/badge/Install-16a34a?style=for-the-badge" alt="Install"></a>
  <a href="README.ru.md"><img src="https://img.shields.io/badge/Russian%20Version-README.ru.md-eab308?style=for-the-badge" alt="Russian version"></a>
</p>

## Quick Start

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
stow -R */
```

## Included packages

- `zsh` - `~/.zshrc`, `~/.hushlogin`
- `tmux` - `~/.tmux.conf`
- `git` - `~/.gitconfig`, `~/.gitignore_global`
- `aerospace` - `~/.aerospace.toml`
- `nvim` - `~/.config/nvim`
- `ghostty` - `~/.config/ghostty/config`
- `starship` - `~/.config/starship.toml`
- `atuin`, `direnv`, `bat`, `btop`, `rg`, `yazi`, `opencode` - matching paths under `~/.config`

## Stow layout

Each top-level directory in this repository is a Stow package.

```text
dotfiles/
  zsh/
  tmux/
  git/
  aerospace/
  nvim/
  ghostty/
  starship/
  atuin/
  direnv/
  bat/
  btop/
  rg/
  yazi/
  opencode/
```

## Requirements

Minimum:

- `git`
- `stow`

Recommended for this setup:

- `zsh`, `tmux`, `neovim`, `ghostty`, `starship`
- `eza`, `bat`, `ripgrep`, `fd`, `fzf`, `zoxide`
- `atuin`, `direnv`, `yazi`, `btop`, `lazygit`
- `aerospace` (tiling WM for macOS)

## Install

1. Clone the repo:

```bash
git clone https://github.com/knightengel/dotfiles.git
cd ~/dotfiles
```

2. Back up existing files (if present):

```bash
mkdir -p ~/.dotfiles-backup
for p in \
  ~/.zshrc ~/.hushlogin ~/.tmux.conf ~/.gitconfig ~/.gitignore_global ~/.aerospace.toml \
  ~/.config/nvim ~/.config/ghostty ~/.config/starship.toml ~/.config/atuin ~/.config/direnv \
  ~/.config/bat ~/.config/btop ~/.config/rg ~/.config/yazi ~/.config/opencode
do
  [ -e "$p" ] && mv "$p" ~/.dotfiles-backup/
done
```

3. Apply packages with Stow:

```bash
stow zsh tmux git aerospace nvim ghostty starship atuin direnv bat btop rg yazi opencode
```

Or restow everything from repo root:

```bash
stow -R */
```

## Update after pull

```bash
cd ~/dotfiles
git pull
stow -R */
```

## Rollback

```bash
cd ~/dotfiles
stow -D zsh tmux git aerospace nvim ghostty starship atuin direnv bat btop rg yazi opencode
```

## Notes

- This setup is macOS-focused.
- Ghostty config expects `JetBrains Mono`.
- `~/.zshrc` already includes helper aliases for this repo (`stowall`, `stzsh`, `stnvim`, etc.).
