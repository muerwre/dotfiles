export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting rsync)

if [ ! -d "$HOME/.zsh" ]; then
  echo "[init]\tcreated $HOME/.zsh"
  mkdir -p "$HOME/.zsh"
fi

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source $ZSH/oh-my-zsh.sh
else 
  echo "[install]\toh-my-zsh:\tsh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

if [ -d "$HOME/.zsh/pure" ]; then
  fpath+=$HOME/.zsh/pure
  autoload -U promptinit
  promptinit
  prompt pure
else 
  echo "[install]\tprompt:\tgit clone https://github.com/sindresorhus/pure.git \"$HOME/.zsh/pure\""
fi

# init autocompletions
if type brew &> /dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi