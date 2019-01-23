#!/bin/bash -x

function show_step_title() {
    echo "\033[35m\033[01m$1\033[0m":
}

function show_info() {
    echo "\033[32m\033[05m$1\033[0m"
}

while [[ "$#" > 0 ]]; do case $1 in
    -a|--atom) set_atom=1; shift;;
    *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done


show_step_title 'STEP 1: Install some nessesary tools'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python
pip3 install powerline-status --user


show_step_title 'STEP 2: Download fonts/colors/theme to make Iterm2 cooler'
mkdir -p ~/Work/Tools/
cd ~/Work/Tools/
git clone https://github.com/powerline/fonts.git
git clone https://github.com/altercation/solarized.git
git clone https://github.com/fcamblor/oh-my-zsh-agnoster-fcamblor.git

cd fonts
./install.sh
cd ..

cd oh-my-zsh-agnoster-fcamblor
./install
sed -i '' 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/g' ~/.zshrc
cd ../


show_step_title 'STEP 3: Download some plugins to make ZSH cooler'
brew install autojump
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
sed -i '' 's/plugins=(.*)/plugins=(git autojump web-search last-working-dir zsh-syntax-highlighting)/g' ~/.zshrc
source ~/.zshrc
cd -


show_step_title 'STEP 4: Download some plugins to make Atom cooler'
if [[ $set_atom ]]; then
    apm install vim-mode
    apm install minimap
    apm install git-plus
    apm install autocomplete-paths
    apm install terminal-plus # doesn't work, don't know why :(
    apm install file-icons
    apm install activate-power-mode # LOL
else
    show_info 'Skipped...'
fi


show_step_title 'STEP 5: Manual setups'
show_info 'Please set Iterm2 font to 12pt Meslo LG S DZ Regular for Powerline'
show_info 'Please set Iterm2 color to Solarized Dark.itermcolors or Solarized Light.itermcolors'
