#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}==> [1/4] Установка пакетов из официальных репозиториев...${NC}"
sudo pacman -S --needed --noconfirm \
    base-devel git stow \
    niri alacritty fuzzel yazi nwg-look \
    zsh starship bat eza \
    ttf-jetbrains-mono-nerd noto-fonts-emoji \
    wl-clipboard grim slurp

echo -e "${GREEN}==> [2/4] Проверка AUR-хелпера (yay)...${NC}"
if ! command -v yay &> /dev/null; then
    AUR_URL="https://aur.archlinux.org/yay.git"
    rm -rf /tmp/yay
    git clone "$AUR_URL" /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
fi

echo -e "${GREEN}==> [3/4] Установка Noctalia Shell и тем Gruvbox из AUR...${NC}"
yay -S --needed --noconfirm noctalia-shell gruvbox-dark-gtk gruvbox-dark-icons-gtk

echo -e "${GREEN}==> [4/4] Бэкап старых конфигов и применение дотфайлов (GNU Stow)...${NC}"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
HAS_BACKUP=false

TARGETS=(
    .zshrc
    .gtkrc-2.0
    .config/starship.toml
    .config/niri
    .config/noctalia
    .config/alacritty
    .config/fuzzel
    .config/gtk-3.0
    .config/gtk-4.0
    .config/nwg-look
    .config/fontconfig
    .local/state/noctalia
    Wallpapers
)

for item in "${TARGETS[@]}"; do
    if [ -e "$HOME/$item" ] && [ ! -L "$HOME/$item" ]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$item")"
        mv "$HOME/$item" "$BACKUP_DIR/$item"
        HAS_BACKUP=true
    fi
done

cd "$(dirname "$0")"

for module in niri noctalia alacritty fuzzel zsh starship gtk wallpapers; do
    if [ -d "$module" ]; then
        stow -v -t "$HOME" "$module"
    fi
done

if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
fi

if [ "$HAS_BACKUP" = true ]; then
    echo -e "${YELLOW}Готово! Бэкап старых настроек сохранён в $BACKUP_DIR.${NC}"
else
    echo -e "${YELLOW}Готово! Все конфиги успешно применены.${NC}"
fi
echo -e "${YELLOW}Перезайди в сессию или перезагрузи систему.${NC}"
