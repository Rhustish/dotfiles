#Downloading required packages
sudo pacman -S nvidia fish ranger openssh network-manager-applet dmenu gnome-keyring nano git htop neofetch make feh ttf-dejavu alacritty xorg xorg-xinit i3-gaps pulseaudio-bluetooth discord steam

#Making fish default terminal
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
yay -S visual-studio-code-bin blueberry google-chrome qtkeychain dbus-broker brightnessctl polybar spotifyd

#Enabling bluetooth
sudo systemctl enable bluetooth.service

#Making the home Directory
mkdir Pictures
mkdir Downloads

# copying .config files 
cp i3/config  ~/.config/i3/
mkdir ~/.config/polybar/

cp polybar/config.ini ~/.config/polybar/
cp polybar/launch.sh ~/.config/polybar/
chmod +x ~/.config/polybar/launch.sh

#configuring spotify-tui
cp -r spotify-tui/ ~.conf/
cp -r spotifyd/ ~/conf/

sudo reboot