#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}==> [1/4] Установка пакетов из официальных репозиториев...${NC}"
sudo pacman -S --needed --noconfirm \
    niri alacritty fuzzel thunar nwg-look \
    zsh starship bat eza git stow \
    ttf-jetbrains-mono-nerd noto-fonts-emoji \
    wl-clipboard grim slurp

echo -e "${GREEN}==> [2/4] Проверка yay...${NC}"
if ! command -v yay &> /dev/null; then
    git clone https://archlinux.org /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
fi

echo -e "${GREEN}==> [3/4] Установка Noctalia Shell и тем Gruvbox из AUR...${NC}"
yay -S --needed --noconfirm noctalia-shell gruvbox-dark-gtk gruvbox-dark-icons-gtk

echo -e "${GREEN}==> [4/4] Бэкап старых конфигов и применение дотфайлов (GNU Stow)...${NC}"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for item in .zshrc .gtkrc-2.0 .config/starship.toml .config/niri .config/noctalia .config/alacritty .config/fuzzel .config/gtk-3.0 .config/gtk-4.0 .local/state/noctalia; do
    if [ -e "$HOME/$item" ] && [ ! -L "$HOME/$item" ]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$item")"
        mv "$HOME/$item" "$BACKUP_DIR/$item"
    fi
done

cd "$(dirname "$0")"
stow -v niri noctalia alacritty fuzzel zsh starship gtk wallpapers

if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
fi

echo -e "${YELLOW}Готово! Бэкап сохранён в $BACKUP_DIR. Перезайди в сессию.${NC}"
