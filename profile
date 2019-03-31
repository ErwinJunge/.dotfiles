# virtualenv
export WORKON_HOME=$HOME/.virtualenvs

# Add $HOME/bin to path
export PATH=$HOME/bin:$PATH

# Cask
export PATH="$HOME/.cask/bin:$PATH"

# npm
export PATH="$HOME/.npm/bin:$PATH"

# ruby
export GEM_HOME=$HOME/.gem
export PATH="$(ruby -rrubygems -e "puts Gem.user_dir")/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="/usr/src/rust/src/"

# Android sdk
export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH
