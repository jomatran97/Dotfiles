#! /bin/bash
# Utils
function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}

function install_macos {
  if [[ $OSTYPE != darwin* ]]; then
    return
  fi
  echo "MacOS detected"

  if [ "$(is_installed brew)" == "0" ]; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  if [ ! -d "/Applications/iTerm.app" ]; then
    echo "Installing iTerm2"
    brew tap homebrew/cask
    brew install iterm2 --cask
  fi

  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Install neovim"
    brew install neovim
    if [ "$(is_installed pip3)" == "1" ]; then
      pip3 install neovim --upgrade
    fi

  if ["$(is_installed npm) ==0"]; then
    echo "install nodejs 16"
    brew install node@16
    echo "installing some tools"
    npm install -g dockerfile-language-server-nodejs typescript typescript-language-server bash-language-server vscode-langservers-extracted
    pip3 install pyright
  fi
}
install_macos
