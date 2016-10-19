# virtualenv
export WORKON_HOME=$HOME/.virtualenvs

# Add $HOME/bin to path
export PATH=$HOME/bin:$PATH

# Cask
export PATH="$HOME/.cask/bin:$PATH"

# npm
export PATH="$HOME/.npm/bin:$PATH"

# ruby
export PATH="$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH"

# Android sdk
export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH
