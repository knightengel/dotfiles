<h1 align="center">dotfiles</h1>

<p align="center">Личный набор конфигов для macOS с установкой через GNU Stow</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS-0f172a?style=for-the-badge&logo=apple" alt="macOS">
  <img src="https://img.shields.io/badge/manager-GNU%20Stow-1f2937?style=for-the-badge&logo=gnu" alt="GNU Stow">
  <img src="https://img.shields.io/badge/shell-zsh-0b3d2e?style=for-the-badge&logo=gnubash" alt="zsh">
  <img src="https://img.shields.io/badge/editor-Neovim-14532d?style=for-the-badge&logo=neovim" alt="Neovim">
  <img src="https://img.shields.io/badge/terminal-Ghostty-082f49?style=for-the-badge" alt="Ghostty">
</p>

<p align="center">
  <a href="#быстрый-старт"><img src="https://img.shields.io/badge/Quick%20Start-2563eb?style=for-the-badge" alt="Быстрый старт"></a>
  <a href="#установка"><img src="https://img.shields.io/badge/Install-16a34a?style=for-the-badge" alt="Установка"></a>
  <a href="README.md"><img src="https://img.shields.io/badge/English%20Version-README.md-eab308?style=for-the-badge" alt="English version"></a>
</p>

## Быстрый старт

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
stow -R */
```

## Что внутри

- `zsh` - `~/.zshrc`, `~/.hushlogin`
- `tmux` - `~/.tmux.conf`
- `git` - `~/.gitconfig`, `~/.gitignore_global`
- `aerospace` - `~/.aerospace.toml`
- `nvim` - `~/.config/nvim`
- `ghostty` - `~/.config/ghostty/config`
- `starship` - `~/.config/starship.toml`
- `atuin`, `direnv`, `bat`, `btop`, `rg`, `yazi`, `opencode` - соответствующие каталоги в `~/.config`

## Структура под Stow

Каждая папка в корне репозитория - отдельный пакет Stow.

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

## Зависимости

Минимум:

- `git`
- `stow`

Желательно (по этим конфигам):

- `zsh`, `tmux`, `neovim`, `ghostty`, `starship`
- `eza`, `bat`, `ripgrep`, `fd`, `fzf`, `zoxide`
- `atuin`, `direnv`, `yazi`, `btop`, `lazygit`
- `aerospace` (tiling WM для macOS)

## Установка

1. Клонируй репозиторий:

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

2. Сделай бэкап существующих конфигов (если они уже есть):

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

3. Применяй пакеты через Stow:

```bash
stow zsh tmux git aerospace nvim ghostty starship atuin direnv bat btop rg yazi opencode
```

Или сразу все пакеты из корня:

```bash
stow -R */
```

## Обновление после git pull

```bash
cd ~/dotfiles
git pull
stow -R */
```

## Быстрый откат

```bash
cd ~/dotfiles
stow -D zsh tmux git aerospace nvim ghostty starship atuin direnv bat btop rg yazi opencode
```

## Примечания

- Конфиги ориентированы на macOS.
- Для Ghostty в конфиге указан `JetBrains Mono`.
- В `~/.zshrc` уже есть алиасы для работы с этим репо (`stowall`, `stzsh`, `stnvim` и т.д.).
