# dotfiles

## how to

```
$ curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
$ wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# apt install git zsh build-essential python3 python3-pip python3-venv build-essential i3 suckless-tools direnv jq jid x11-xserver-utils lightdm imwheel httpie fonts-font-awesome fonts-noto apt-transport-https ripgrep rofi zathura binwalk exiftool nodejs sublime-merge sublime-text maim thunar thunar-archive-plugin ssh-audit qalc polybar wireshark tshark flameshot mate-polkit curl dnsutils gnupg2 materia-gtk-theme neofetch x11-utils sshfs mesa-utils picom feh vim autorandr arandr ranger fwupd network-manager-gnome virt-manager xclip command-not-found taskwarrior bat python3-i3ipc xdotool blueman psmisc hexyl sway swaymsg gdm3 wdisplays kanshi swaybar swayidle sway-notification-center grim slurp wofi waybar swaybg wl-clipboard meson ninja-build libgtk-3-dev scdoc

$ git clone https://github.com/janihy/dotfiles.git

$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

$ git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# pip3 install thefuck
$ pip3 install --user rofimoji

# rmmod pcspkr; echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf

# install kitty: https://sw.kovidgoyal.net/kitty/binary/#manually-installing
```
