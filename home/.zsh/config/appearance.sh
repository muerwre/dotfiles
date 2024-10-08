export ZSH="$HOME/.oh-my-zsh"
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

DISABLE_AUTO_UPDATE="true"
ZSH_THEME="robbyrussell"

plugins=(git rsync asdf yarn cp docker docker-compose systemd)

if [ ! -d "$HOME/.zsh" ]; then
  echo "[init]\tcreated $HOME/.zsh"
  mkdir -p "$HOME/.zsh"
fi

# init oh-my-zsh
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source $ZSH/oh-my-zsh.sh
else 
  echo "[install]\toh-my-zsh:\tsh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

# init pure prompt
if [ -d "$HOME/.zsh/pure" ]; then
  FPATH=$HOME/.zsh/pure:$FPATH
  autoload -U promptinit
  promptinit
  prompt pure
else 
  echo "[install]\tprompt:\tgit clone https://github.com/sindresorhus/pure.git \"$HOME/.zsh/pure\""
fi

# fzf-tab for better tab suggestions
if [ -d "$HOME/.zsh/fzf-tab" ]; then
    source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
    zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:git-checkout:*' sort false
else
    echo "[install]\tgit clone https://github.com/Aloxaf/fzf-tab \"$HOME/.zsh/fzf-tab\""
fi

# autocomplete from history
if [ -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  echo "[install]\tgit clone https://github.com/zsh-users/zsh-autosuggestions.git \"$HOME/.zsh/zsh-autosuggestions\""
fi

# colorful input
if [ -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
  source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "[install]\tgit clone https://github.com/zsh-users/zsh-syntax-highlighting.git \"$HOME/.zsh/zsh-syntax-highlighting\""
fi

# fuzzy search
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin" ]; then
  if [ ! -f "$HOME/.fzf.zsh" ]; then
    if type brew &> /dev/null; then
      $(brew --prefix)/opt/fzf/install --all
    else
      #. "/usr/share/fzf/key-bindings.zsh"
      #. "/usr/share/fzf/completion.zsh"
      source <(fzf  --zsh)
    fi
  fi

  plugins=($plugins fzf-zsh-plugin)
else
  echo "[install]\tgit clone https://github.com/unixorn/fzf-zsh-plugin.git  \"${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin\""
fi
