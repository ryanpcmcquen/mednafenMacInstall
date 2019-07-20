#!/bin/sh

#  $ curl https://raw2.github.com/ryanpcmcquen/mednafenMacInstall/master/installMednafenMac.sh | sh

# Ryan P. C. McQuen | Everett, WA | ryanpcmcquen@member.fsf.org

wget mednafen.sourceforge.net/releases/ -O ~/mednafen-release-page.html
cat ~/mednafen-release-page.html | grep mednafen | grep .tar.bz2 | cut -d'"' -f2 | sed 's/\?download//' | \
  cut -d/ -f5 > ~/mednafenReleaseVersion

rm -v ~/mednafen-release-page.html
export MEDNAFENTARBALL=${MEDNAFENTARBALL="$(tr -d '\n\r' < ~/mednafenReleaseVersion)"}

export CC=/usr/local/Cellar/gcc48/4.8.4/bin/gcc-4.8
export CPP=/usr/local/Cellar/gcc48/4.8.4/bin/cpp-4.8
export CXX=/usr/local/Cellar/gcc48/4.8.4/bin/c++-4.8

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew upgrade
brew tap homebrew/versions
brew install gcc48 wget libcdio libsndfile sdl

wget -N https://prdownloads.sourceforge.net/mednafen/$MEDNAFENTARBALL -P ~/Downloads/

tar xvf ~/Downloads/$MEDNAFENTARBALL -C ~/Downloads/
cd ~/Downloads/mednafen/

./configure
make
make install clean

rm -v ~/Downloads/$MEDNAFENTARBALL
rm -rfv ~/Downloads/mednafen/
rm -v ~/mednafenReleaseVersion

echo
echo "To run a rom type 'mednafen NAMEOFROM' from the command line."
echo


