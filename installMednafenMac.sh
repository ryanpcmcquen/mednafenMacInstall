#!/bin/sh

#  $ curl https://raw2.github.com/ryanpcmcquen/mednafenMacInstall/master/installMednafenMac.sh | sh

# Ryan P.C. McQuen | Everett, WA | ryanpcmcquen@member.fsf.org

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version, with the following exception:
# the text of the GPL license may be omitted.

# This program is distributed in the hope that it will be useful, but
# without any warranty; without even the implied warranty of
# merchantability or fitness for a particular purpose. Compiling,
# interpreting, executing or merely reading the text of the program
# may result in lapses of consciousness and/or very being, up to and
# including the end of all existence and the Universe as we know it.
# See the GNU General Public License for more details.

# You may have received a copy of the GNU General Public License along
# with this program (most likely, a file named COPYING).  If not, see
# <http://www.gnu.org/licenses/>.

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


