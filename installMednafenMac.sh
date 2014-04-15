#!/bin/sh
## script to automagically install mednafen on mac os

export CC=/usr/local/Cellar/gcc48/4.8.2/bin/gcc-4.8
export CPP=/usr/local/Cellar/gcc48/4.8.2/bin/cpp-4.8
export CXX=/usr/local/Cellar/gcc48/4.8.2/bin/c++-4.8

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update && brew upgrade
brew tap homebrew/versions
brew install gcc48 wget libcdio libsndfile sdl lzlib

wget -N https://prdownloads.sourceforge.net/mednafen/mednafen-0.9.33.2.tar.bz2 -P ~/Downloads/
tar xf ~/Downloads/mednafen-0.9.33.2.tar.bz2 -C ~/Downloads/
cd ~/Downloads/mednafen/

#sudo ./configure --build=x86_64-apple-darwin`uname -r`
#sudo make
#sudo make install clean


./configure #--build=x86_64-apple-darwin'uname -r'
make
make install clean

rm ~/Downloads/mednafen-0.9.33.2.tar.bz2

echo "You may now delete the mednafen directory in your ~/Downloads folder. Enjoy."
echo "To run a rom type 'mednafen NAMEOFROM' from the command line."

