# usage: 
#
# 1. symlink whole dir to $HOME/.zsh/config
# 2. add next line to $HOME/.zshrc
#
#     source "$HOME/.zsh/config/.zshrc"
#

pwd=$(dirname $0)

. "$pwd/env.sh"
. "$pwd/appearance.sh"
. "$pwd/alias.sh"
