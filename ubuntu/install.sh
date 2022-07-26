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

# 安装 zsh
sudo apt install zsh -y

# 安装 git
sudo apt install git -y

# 克隆 oh-my-zsh 库
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh

#拷贝 .zshrc 配置文件
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

# 设置 zsh 为默认 shell
chsh -s /bin/zsh

# 设置 powerlevel10k 主题
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" $HOME/.zshrc
# sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"philips\"/g" $HOME/.zshrc

# 安装配置 autojump
sudo apt install autojump -y
echo ". /usr/share/autojump/autojump.sh" >>~/.zshrc

# 安装配置语法高亮
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>~/.zshrc

# 安装配置语法历史
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc

# 重启机器生效
echo -e "\033[31m请手动重启机器, 用以生效zsh shell\033[0m"

set +x
