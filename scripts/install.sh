#!/bin/bash
. ./installers.sh

DISTRO=${1^^}

case $DISTRO in
  MANJARO)
    echo installing for manjaro
  ;;
  *)
    echo not supported distro
    exit 1
  ;;
esac

TEMP_DIR=~/setup-temp
CONFIG_DIR=~/configs
EMAIL=alessandro@narciso.dev
NERDFONT_VERSION=2.0.0
FIRACODE_VERSION=2
JETBRAINS_TOOLBOX=jetbrains-toolbox-1.14.5179

mkdir -p $TEMP_DIR
mkdir -p ~/.config/autostart
cd $TEMP_DIR

## HELPERS

echo '# GLOBAL SOFTWARE #'

updateSystem

if ! [ -x "$(command -v yay)" ]; then
  echo INSTALLING YAY
  installYay
else
  echo YAY ALREADY INSTALLED
fi

if ! [ -x "$(command -v git)" ]; then
  echo INSTALLING GIT
  installGit
else
  echo GIT ALREADY INSTALLED
fi

if ! [ -x "$(command -v git-flow)" ]; then
  echo INSTALLING GIT FLOW
  # installGitFlow
else
  echo GIT FLOW ALREADY INSTALLED
fi

echo '# SOFTWARE #'

if ! [ "$(fc-list | grep -c 'FiraCode')" -ge 1 ]; then
  echo INSTALLING FIRACODE
  installFiraCode
else
  echo FIRACODE ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'Fura Code')" -ge 1 ]; then
  echo INSTALLING PATCHED FIRACODE
  installFuraCode
else
  echo PATCHED FIRACODE ALREADY INSTALLED
fi

if [ ! -d ~/.oh-my-zsh ]; then
  echo INSTALLING OH-MY-ZSH
  installOhMyZsh
else
  echo OH-MY-ZSH ALREADY INSTALLED
fi

if ! [ -x "$(command -v google-chrome-stable)" ]; then
  echo INSTALLING CHROME
  installChrome
else
  echo CHROME ALREADY INSTALLED
fi

if ! [ -x "$(command -v brave)" ]; then
  echo INSTALLING BRAVE
  installBrave
else
  echo BRAVE ALREADY INSTALLED
fi

if ! [ -x "$(command -v code)" ]; then
  echo INSTALLING VSCODE
  installVsCode
else
  echo VSCODE ALREADY INSTALLED
fi

if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
  echo INSTALLING JETBRAINS TOOLBOX
  installJetbrainsToolbox
else
  echo JETBRAINS TOOLBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v telegram-desktop)" ]; then
  echo INSTALLING TELEGRAM
  installTelegram
else
  echo TELEGRAM ALREADY INSTALLED
fi

if ! [ -x "$(command -v bd)" ]; then
  echo INSTALLING BD
  installBd
else
  echo BD ALREADY INSTALLED
fi

if ! [ -x "$(command -v xclip)" ]; then
  echo INSTALLING XCLIP
  installXClip
else
  echo XCLIP ALREADY INSTALLED
fi

if ! [ -x "$(command -v smerge)" ]; then
  echo INSTALLING SUBLIME MERGE
  installSublimeMerge
else
  echo SUBLIME MERGE ALREADY INSTALLED
fi

if ! [ -x "$(command -v dotnet)" ]; then
  echo INSTALLING DOTNETCORE SDK
  installDotnetSdk
else
  echo DOTNETCORE SDK ALREADY INSTALLED
fi

if ! [ -x "$(command -v node)" ]; then
  echo INSTALLING NODE
  installNode
else
  echo NODE ALREADY INSTALLED
fi

if ! [ -x "$(command -v yarn)" ]; then
  echo INSTALLING YARN
  installYarn
else
  echo YARN ALREADY INSTALLED
fi

if ! [ -x "$(command -v docker)" ]; then
  echo INSTALLING DOCKER
  installDocker
else
  echo DOCKER ALREADY INSTALLED
fi

if ! [ -x "$(command -v docker-compose)" ]; then
  echo INSTALLING DOCKER-COMPOSE
  installDockerCompose
else
  echo DOCKER-COMPOSE ALREADY INSTALLED
fi

if ! [ -x "$(command -v teams)" ]; then
  echo INSTALLING TEAMS
  installTeams
else
  echo TEAMS ALREADY INSTALLED
fi

if ! [ -x "$(command -v slack)" ]; then
  echo INSTALLING SLACK
  installSlack
else
  echo SLACK ALREADY INSTALLED
fi

if ! [ -x "$(command -v i3)" ]; then
  echo INSTALLING I3
  installI3
else
  echo I3 ALREADY INSTALLED
fi

if ! [ -x "$(command -v dunst)" ]; then
  echo INSTALLING DUNST
  installDunst
else
  echo DUNST ALREADY INSTALLED
fi

if ! [ -x "$(command -v kitty)" ]; then
  echo INSTALLING KITTY
  installKitty
else
  echo KITTY ALREADY INSTALLED
fi

if ! [ -x "$(command -v ntpq)" ]; then
  echo INSTALLING NTP
  installNTP
else
  echo NTP ALREADY INSTALLED
fi

if ! [ -x "$(command -v filezilla)" ]; then
  echo INSTALLING FILEZILLA
  installFilezilla
else
  echo FILEZILLA ALREADY INSTALLED
fi

if ! [ -x "$(command -v spotify)" ]; then
  echo INSTALLING SPOTIFY
  installSpotify
else
  echo SPOTIFY ALREADY INSTALLED
fi

echo '# CONFIGURATIONS'

if [ ! -f ~/.gitconfig ]; then
  echo CONFIGURING GIT
  configureGit
else
  echo GIT ALREADY CONFIGURED
fi

if [ ! -f ~/.config/polybar/launch.sh ]; then
  echo CONFIGURING I3
  configureI3
else
  echo I3 ALREADY CONFIGURED
fi

if [ ! -f ~/.config/dunst/dunstrc ]; then
  echo CONFIGURING DUNST
  configureDunst
else
  echo DUNST ALREADY CONFIGURED
fi

if [ ! -f ~/.config/kitty/kitty.conf ]; then
  echo CONFIGURING KITTY
  configureKitty
else
  echo KITTY ALREADY CONFIGURED
fi

if [ ! -f ~/.config/kitty/kitty.conf ]; then
  echo CONFIGURING BIN SCRIPTS
  configureScripts
else
  echo BIN SCRIPTS ALREADY CONFIGURED
fi

rm -rf $TEMP_DIR

echo Purged temp folder

echo TODO:
echo - Install Rider with JetBrains Toolbox
echo - Install Ionicons manually
echo - Install vscode settings by using extension 'setting sync'
echo - Register the following generate SSH public key 'narciso_git' to github:
cat ~/.ssh/narciso_git.pub
echo ""
echo - reboot
