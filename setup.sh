#!/bin/bash

if [ -z "$(command -v zsh)" ]; then
    sudo apt-get install -y zsh
    [ $? -ne 0 ] && exit 1
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    [ $? -ne 0 ] && exit 1
fi

chsh -s $(which zsh)

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

# Fetch .zshrc from GitHub
curl -fsSL https://raw.githubusercontent.com/yourusername/your-dotfiles-repo/main/.zshrc -o ~/.zshrc

read -p "Do you want to install pyenv? (y/n): " install_pyenv
if [ "$install_pyenv" == "y" ]; then
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
    
    curl https://pyenv.run | bash
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
fi

read -p "Do you want to install fnm? (y/n): " install_fnm
if [ "$install_fnm" == "y" ]; then
    curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash

    echo 'export PATH="$HOME/.fnm:$PATH"' >> ~/.zshrc
    echo 'eval "$(fnm env --multi)"' >> ~/.zshrc
fi

clear
