#Downloading required packages
sudo pacman -S virualbox kernel-headers nvidia fish ranger openssh network-manager-applet dmenu gnome-keyring nano git htop neofetch make feh ttf-dejavu alacritty xorg xorg-xinit i3-gaps pulseaudio-bluetooth discord steam

#Making fish default shell
echo /usr/bin/fish | tee -a /etc/shells
chsh -s /usr/bin/fish

#Configuring xinitrc
echo xinitrc | tee -a ~/.xinitrc

#Enabling autologin
echo fish | tee -a ~/.config/fish/config.fish

#Configuring touchpad
sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/

#Installing YAY
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ..

#Downloading required packages from AUR
yay -S visual-studio-code-bin blueberry google-chrome qtkeychain dbus-broker brightnessctl polybar spotifyd auto-cpufreq

#Enabling auto-cpufreq
sudo systemctl enable auto-cpufreq.service
sudo systemctl start auto-cpufreq.service
sudo cp auto-cpufreq.conf /etc/

#Virtualbox setup
sudo modprobe vboxdrv

#Enabling bluetooth
sudo systemctl enable bluetooth.service

#Making the home Directory && copying wallpaper
mkdir Pictures
cp wallpaper.jpg ~/Pictures/
mkdir Downloads

# copying i3 config files 
cp i3/config  ~/.config/i3/

# copying htop config 
cp htoprc ~/.config/htop/

# copying polybar config
mkdir ~/.config/polybar/
cp polybar/config.ini ~/.config/polybar/
cp polybar/launch.sh ~/.config/polybar/
chmod +x ~/.config/polybar/launch.sh

# configuring spotify-tui
cp -r spotify-tui/ ~.conf/
cp -r spotifyd/ ~/conf/

sudo reboot
