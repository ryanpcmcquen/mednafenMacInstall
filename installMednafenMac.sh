#!/bin/sh
## script to automatically install mednafen on mac os
#
#  this should work, but i haven't tested it:
#
#  $ curl https://raw.github.com/ryanpcmcquen/mednafenMacInstall/master/installMednafenMac.sh | bash
#
# Copyright 2014  Ryan P.C. McQuen, ryan.q@linux.com, WA
#
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR IMPLIE
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

export CC=/usr/local/Cellar/gcc48/4.8.2/bin/gcc-4.8
export CPP=/usr/local/Cellar/gcc48/4.8.2/bin/cpp-4.8
export CXX=/usr/local/Cellar/gcc48/4.8.2/bin/c++-4.8

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update && brew upgrade
brew tap homebrew/versions
brew install gcc48 wget libcdio libsndfile sdl lzlib

wget -N https://prdownloads.sourceforge.net/mednafen/mednafen-0.9.34.1.tar.bz2 -P ~/Downloads/
tar xf ~/Downloads/mednafen-0.9.34.1.tar.bz2 -C ~/Downloads/
cd ~/Downloads/mednafen/

./configure
make
make install clean

rm ~/Downloads/mednafen-0.9.34.1.tar.bz2

echo "You may now delete the mednafen directory in your ~/Downloads folder. Enjoy."
echo "To run a rom type 'mednafen NAMEOFROM' from the command line."

