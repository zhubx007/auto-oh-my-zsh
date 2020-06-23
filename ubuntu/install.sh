#!/bin/bash

set -x
set -e

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# 更新源
sudo apt update

# 清理环境
sudo apt remove zsh -y
rm -rf $HOME/.zshrc
rm -rf $HOME/.oh-my-zsh

# 安装zsh
sudo apt install zsh -y

# 安装git
sudo apt install git -y

# 克隆oh-my-zsh库
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

#拷贝.zshrc配置文件
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

# 设置zsh为默认shell
chsh -s /bin/zsh

# 设置ys主题
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"ys\"/g" $HOME/.zshrc
# sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"philips\"/g" $HOME/.zshrc

# 安装配置autojump
sudo apt install autojump -y
echo ". /usr/share/autojump/autojump.sh" >>~/.zshrc

# 安装配置语法高亮
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>~/.zshrc

# 安装配置语法历史
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc

# 重启机器生效
echo -e "\033[31m请手动重启机器，用以生效zsh shell\033[0m"

set +x
