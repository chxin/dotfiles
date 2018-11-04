cp hosts /etc/hosts
apt update && echo "Y" | apt upgrade

echo "install oh-my-zsh"
echo "============================================"
echo "Y" | apt install curl zsh git
chsh -s /bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp -r ./_oh-my-zsh/.zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cd .. && git clone git://github.com/wting/autojump.git
cd autojump && ./install.py && cd ../DotFilesCHxin

echo "install vim latest"
echo "============================================"
dpkg -l | grep vim
echo "Y" | apt-get remove vim vim-runtime vim-tiny vim-common 
echo "Y" | apt-get install libncurses5-dev python-dev python3-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev cmake ctags fonts-powerline
cp -r ./_vim/. ~
cd .. && git clone https://github.com/vim/vim.git && cd vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp --enable-cscope --enable-gui=gtk3 --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/
make && make install && cd ../DotFilesCHxin

echo "install chrome"
echo "==========================================="
wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
apt-get update && echo "Y" | apt-get install google-chrome-stable

echo "install docker"
echo "==========================================="
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker xin

echo "system config"
echo "Y" | apt install fcitx fcitx-pinyin gnome-tweak-tool gnome-shell-extensions
apt install python-pip python-setuptools python3-pip
pip install cheat
echo "install vimix theme"
echo "==========================================="
echo "Y" | apt install gtk2-engines-murrine gtk2-engines-pixbuf meson
cd .. && git clone https://github.com/vinceliuice/vimix-gtk-themes.git && git clone https://github.com/snwh/paper-icon-theme.git
cd vimix-gtk-themes && ./Install && cd ..
cd paper-icon-theme && meson "build" --prefix=$HOME/.local && ninja -C "build" install
gsettings set org.gnome.desktop.interface icon-theme "Paper"
gsettings set org.gnome.desktop.interface cursor-theme "Paper"
cd ../DotFilesCHxin

