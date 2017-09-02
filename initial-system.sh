ubuntuInitialSettingsPath="$GitHubPath/ubuntu-initial-settings"
# Remove packages
sudo apt-get purge gv libreoffice* openoffice* remmina firefox unity-lens-photos onboard shotwell gnome-contacts imagemagick aisleriot activity-log-manager gucharmap webbrowser-app rhythmbox cheese xdiagnose thunderbird gnome-online-accounts gnome-orca xterm simple-scan gnome-system-log seahorse gnome-disk-utility gnome-font-viewer brasero empathy evolution gnome-documents gnome-maps gnome-music gnome-photos baobab

# Opera install
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add - && sudo add-apt-repository 'deb https://deb.opera.com/opera-stable/ stable non-free' && sudo apt update && sudo apt install opera-stable

# Atom install
sudo add-apt-repository ppa:webupd8team/atom && sudo apt update && sudo apt install atom

# Avocode install
xdg-open https://avocode.com/download

# Gparted install and open
sudo apt update && sudo apt install gparted

# Change system files
systemFilesToReinstallPath="$ubuntuInitialSettingsPath/system-files-to-reinstall"

environmentPath="/etc/environment"
bashrcPath="~"
sudo rm $environmentPath && sudo cp $systemFilesToReinstallPath/environment $environmentPath
sudo rm $bashrcPath && sudo cp $systemFilesToReinstallPath/.bashrc $bashrcPath

chmod +x $ubuntuInitialSettingsPath/scripts/*
cp $ubuntuInitialSettingsPath/scripts ~/.bashrc

# Move windows icons to left corner
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

appearancePath="$ubuntuInitialSettingsPath/appearance"

# Set fonts
fontsPath="/usr/share/fonts"
FontsPath="$appearancePath/Fonts"
sudo cp $FontsPath/* $fontsPath

# Add icons and themes folders to ~
cp $appearancePath/icons ~/.icons
cp $appearancePath/themes ~/.themes

gnome-tweak-tool & # Set backgrounds, theme and icons 
