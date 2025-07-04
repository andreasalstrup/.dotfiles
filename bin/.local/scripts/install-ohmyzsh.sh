#!/bin/bash

is_installed=$(ls ~/.oh-my-zsh)

if [[ -n "$is_installed" ]]; then
        exit 0
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -e 's/^ZSH_THEME=".*"/ZSH_THEME="spaceship"/g' \
    -e '/^ZSH_THEME="spaceship"/a\
SPACESHIP_PROMPT_ASYNC=false\nSPACESHIP_NODE_SHOW=false' ~/.zshrc

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i -e '/^plugins=(/,/)/c\
plugins=(\
  git\
  zsh-autosuggestions\
  zsh-syntax-highlighting # Always last\
)' ~/.zshrc
