# macOs only
if type brew &> /dev/null; then
  # asdf is faster alternative to nvm
  # and can be used to install golang, nodejs, python
  . /opt/homebrew/opt/asdf/libexec/asdf.sh

  # react-native
  export ANDROID_SDK_ROOT=~/Library/Android/sdk
  export ANDROID_HOME=~/Library/Android/sdk
  export ANDROID_AVD_HOME=~/.android/avd
  export GOPATH=$(go env GOPATH)

  export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$GOPATH/bin:$PATH"

  # golang
  export CGO_CFLAGS=-I/opt/homebrew/include 
  export CGO_LDFLAGS=-L/opt/homebrew/lib
  export CXXFLAGS="--std=c++17"

  # uncomment to use nvm
  # export NVM_DIR="$HOME/.nvm"
  # [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  # [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  # [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
else
  # asdf is faster alternative to nvm
  # and can be used to install golang, nodejs, python
  . $HOME/.asdf/asdf.sh

  # use wayland backend for firefox
  export MOZ_ENABLE_WAYLAND=1
fi