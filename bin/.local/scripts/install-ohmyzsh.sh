#!/bin/bash

is_installed=$(ls ~/.oh-my-zsh)

if [[ -n "$is_installed" ]]; then
        exit 0
fi

(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Install spaceship
sudo git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
sudo ln -i -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i -e 's/^ZSH_THEME=".*"/ZSH_THEME="spaceship"/g' \
    -e '/^ZSH_THEME="spaceship"/a\
\
DISABLE_UPDATE_PROMPT=true\
\
SPACESHIP_PROMPT_ASYNC=true\
SPACESHIP_NODE_SHOW=false\
\
# Only load what you actually use\
SPACESHIP_PROMPT_ORDER=(\
    time\
    user\
    dir\
    git\
    line_sep\
    char\
)' ~/.zshrc

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i -e '/^plugins=(/,/)/c\
plugins=(\
  git\
  zsh-autosuggestions\
  zsh-syntax-highlighting # Always last\
)\
\
ZSH_AUTOSUGGEST_USE_ASYNC=1\
\
source $ZSH/oh-my-zsh.sh' ~/.zshrc

chsh -s $(which zsh)
