#!/bin/bash
# @author:Guilherme Augusto Peixoto de Campos
# @date:18/03/2015
# @description:A Script to install the basic applications for my ubuntu usage
#Alias
alias add-repo="sudo add-apt-repository"
alias upd-repo="sudo apt-get update"
alias ins-repo="sudo apt-get install"
#Install the Java Enviroment
add-repo ppa:webupd8team/java
upd-repo
ins-repo -y oracle-java7-installer
ins-repo -y oracle-java7-set-default
#Ant
ins-repo -y ant
# ANDROID ADB
add-repo ppa:nilarimogard/webupd8
upd-repo
ins-repo -y android-tools-adb android-tools-fastboot
ins-repo -y  libc6:i386 libgcc1:i386 gcc-4.6-base:i386 libstdc++5:i386 libstdc++6:i386
echo "export PATH=${PATH}:$HOME/android-sdk/sdk/platform-tools" >> .bashrc
echo "export PATH=${PATH}:$HOME/android-sdk/sdk/tools" >> .bashrc
