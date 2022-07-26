#!/bin/bash

set -x
set -e

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

sudo yum install epel-release -y
sudo yum makecache

sudo yum remove zsh -y
rm -rf $HOME/.zshrc
rm -rf $HOME/.oh-my-zsh

sudo yum install zsh -y

sudo yum install git -y

git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

chsh -s /bin/zsh

git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" $HOME/.zshrc
# sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"philips\"/g" $HOME/.zshrc

sudo yum install autojump -y

sed -i "s/plugins=(git)/plugins=(git autojump)/g" $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>~/.zshrc

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc

echo -e "\033[31mplease reboot to use zsh shell\033[0m"

set +x
