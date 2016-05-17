#!/bin/bash
# @author:Guilherme Augusto Peixoto de Campos
# @date:18/03/2015
# @description:A Script to install the basic applications for my ubuntu usage, when i am using openbox


#Alias
alias add-repo="sudo add-apt-repository"
alias upd-repo="sudo apt-get update"
alias ins-repo="sudo apt-get install"

#Install the Java Enviroment
function Java_Enviroment(){
	add-repo ppa:webupd8team/java
    upd-repo
    ins -y oracle-java7-installer
    ins -y oracle-java7-set-default
    #Ant
    ins-repo -y ant
    #eclipse
    install -y eclipse-plataform
}

function android_development(){
	# ANDROID ADB
    add-repo ppa:nilarimogard/webupd8
    upd-repo
    ins -y android-tools-adb android-tools-fastboot
    ins -y  libc6:i386 libgcc1:i386 gcc-4.6-base:i386 libstdc++5:i386 libstdc++6:i386
    echo "export PATH=${PATH}:$HOME/android-sdk/sdk/platform-tools" >> .bashrc
    echo "export PATH=${PATH}:$HOME/android-sdk/sdk/tools" >> .bashrc
    echo $PATH
    android-sdk
}

function phonegap(){
	#PhoneGAP
    install -y python-software-properties python g++ make
    add-repo ppa:chris-lea/node.js 
    upd-repo
    install -y nodejs
    node -v
    sudo npm install -g cordova
    cd android-sdk
    mkdir cordova
    cd cordova

}

function sublime(){
	#Sublime Text 3
    add-repo ppa:webupd8team/sublime-text-3
    upd-repo
    install -y sublime-text-installer
}

function git(){
	#SmartGit,i am a noob a need GUI tools
    wget -c http://www.syntevo.com/smartgit/download?file=smartgit/smartgit-6_5_6.deb
    dpkg -i smartgit-6_5_6.deb
    install -y git
}
function web(){
	#google chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}

function xubuntu_solve_lock_error(){
	# "Solve" Xubuntu lock problem
sudo mkdir /etc/X11/xorg.conf.d/
echo -e 'Section "Device"\n Identifier "Card0"\n Driver "Intel"\n Option "AccelMethod" "uxa"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/20-intel.conf
}


android_development()
phonegap()
sublime()
git()
web()
xubuntu_solve_lock_error()
Java_Enviroment()
