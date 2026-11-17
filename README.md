<div align="center">

# 🍂 Niri + Noctalia Shell (Gruvbox Edition)
## RU

Минималистичный райс **Arch Linux** на базе **Niri** и оболочки **Noctalia Shell** в палитре **Gruvbox Dark**.

![Main Desktop](screenshots/desktop.png)

</div>

---

## ✨ Компоненты системы

| Компонент | Программа | Описание |
| :--- | :--- | :--- |
| **WM / Compositor** | [Niri](https://github.com/niri-wm/niri) | Скроллящийся тайлинговый Wayland-композитор |
| **Shell / Bar** | [Noctalia Shell](https://github.com/noctalia-dev/noctalia) | Верхняя панель, виджеты, уведомления и менеджер обоев |
| **Terminal** | [Alacritty](https://alacritty.org) | Быстрый GPU-терминал в цветах Gruvbox Dark |
| **Shell & Prompt** | [Zsh](https://zsh.org) + [Starship](https://starship.rs) | Оболочка с промптом *Pastel Powerline* и утилитой `bat` |
| **App Launcher** | [Fuzzel](https://codeberg.org/dnkl/fuzzel) | Минималистичный Wayland-лаунчер приложений |
| **File Manager** | [yazi](https://github.com/sxyazi/yazi) | Терминальный файловый менеджер |
| **Theming** | [nwg-look](https://github.com/nwg-piotr/nwg-look) | Настройка тем оформления GTK3/GTK4 и иконок |

---

## 📸 Галерея

| Лаунчер и файловый менеджер | Обои в yazi [credits](https://github.com/AngelJumbo/gruvbox-wallpapers) |
| :---: | :---: |
| ![Launcher](screenshots/launcher.png) | ![Wallpapers](screenshots/wallpapers.png) |

---

## 📁 Структура репозитория

```text
dotfiles/
├── alacritty/    # Конфиг терминала Alacritty
├── fuzzel/       # Стили и настройки лаунчера Fuzzel
├── gtk/          # Темы GTK3/GTK4, шрифты и настройки nwg-look
├── niri/         # Конфиг композитора Niri (config.kdl)
├── noctalia/     # Настройки панели, палитры и плагины Noctalia Shell
├── screenshots/  # Скриншоты рабочего стола
├── starship/     # Конфиг промпта Starship (starship.toml)
├── wallpapers/   # Коллекция обоев в стиле Gruvbox
├── zsh/          # Конфигурация оболочки (.zshrc)
└── install.sh    # Скрипт автоматической установки
```

---

## 🚀 Быстрая установка

> **Внимание:** Скрипт рассчитан на **Arch Linux** и использует `yay` для установки пакетов из AUR. Все существующие конфиги автоматически сохраняются в резервную копию `~/.dotfiles_backup_*`.

1. **Клонируйте репозиторий:**
   ```bash
   git clone https://github.com/toor24deb/niri-gruvbox.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Запустите установку:**
   ```bash
   ./install.sh
   ```

### Ручная установка (через GNU Stow)
Если вы хотите применить только отдельные модули без установки пакетов:
```bash
cd ~/dotfiles
stow niri noctalia alacritty fuzzel zsh starship gtk wallpapers
```

---

## ⚠️ Примечание для VirtualBox / VM

Конфигурация создавалась и тестировалась в виртуальной машине на базе **Arch Linux**
