# История команд (для работы подсказок)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Красивое меню автодополнения по Tab
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Полезные цветные сокращения (алиасы)
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias cat='bat --theme=gruvbox-dark'
alias grep='grep --color=auto'

# Запуск красивой строки приглашения Starship
eval "$(starship init zsh)"

# Серые подсказки из истории
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Подсветка синтаксиса (всегда в самом конце файла)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
