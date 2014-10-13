#!/bin/sh

# Ryan P.C. McQuen | Everett, WA | ryan.q@linux.com

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
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


VERSION=${VERSION:-0.9.36.4}

## script to automatically install mednafen on mac os
#
#  this should work, but i haven't tested it:
#
#  $ curl https://raw2.github.com/ryanpcmcquen/mednafenMacInstall/master/installMednafenMac.sh | sh


export CC=/usr/local/Cellar/gcc48/4.8.3/bin/gcc-4.8
export CPP=/usr/local/Cellar/gcc48/4.8.3/bin/cpp-4.8
export CXX=/usr/local/Cellar/gcc48/4.8.3/bin/c++-4.8

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update && brew upgrade
brew tap homebrew/versions
brew install gcc48 wget libcdio libsndfile sdl

wget -N https://prdownloads.sourceforge.net/mednafen/mednafen-$VERSION.tar.bz2 -P ~/Downloads/

tar xf ~/Downloads/mednafen-$VERSION.tar.bz2 -C ~/Downloads/
cd ~/Downloads/mednafen/

./configure
make
make install clean

rm ~/Downloads/mednafen-$VERSION.tar.bz2
rm -rf ~/Downloads/mednafen/

echo
echo "To run a rom type 'mednafen NAMEOFROM' from the command line."
echo


