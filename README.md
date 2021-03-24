# dotfiles

## how to

```
curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

apt install git zsh build-essential open-vm-tools open-vm-tools-desktop python3 python3-pip build-essential i3 suckless-tools direnv jq x11-xserver-utils lightdm imwheel httpie fonts-font-awesome fonts-noto apt-transport-https ripgrep rofi zathura maim binwalk exiftool nodejs sublime-merge sublime-text maim

git clone https://github.com/janihy/dotfiles.git
"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pip3 install thefuck
sudo npm install -g diff-so-fancy

rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf
```
