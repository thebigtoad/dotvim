#!/bin/bash
set -e

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Script to install or update various vim plugins and colour schemes. This script
# will first install pathogen for managing the plugins and then clone or pull the 
# plugins from their git repos.
# This script is intended to be run periodically to keep the plugins uptodate.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

VIM_DIR=~/.vim
VIM_BUNDLE_DIR=$VIM_DIR/bundle
VIM_AUTOLOAD_DIR=$VIM_DIR/autoload
VIM_PATHOGEN_DIR=$VIM_BUNDLE_DIR/vim-pathogen

#Shell Colour constants for use in 'echo -e'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

addPlugin(){
    if [ $# -ne 2 ]; then
        echo -e "${RED}Invalid args to addPlugin${NC}"
        exit 1
    fi

    dirName=$1
    gitUrl=$2
    pluginDir=$VIM_BUNDLE_DIR/$dirName

    if [ -d $pluginDir ]; then
        cd $pluginDir
        echo -e "Updating ${GREEN}${dirName}${NC}"
        git pull
    else
        cd $VIM_BUNDLE_DIR
        echo -e "Cloning ${GREEN}${dirName}${NC}"
        git clone --depth 1 $gitUrl
    fi
    echo
}

addColour() {
    if [ $# -ne 1 ]; then
        echo -e "${RED}Invalid args to addColour${NC}"
        exit 1
    fi
    gitUrl=$1
    colorsDir=$VIM_DIR/colors/
    latestDir=$colorsDir/latest/
    mkdir -p $latestDir
    wget --directory-prefix=$latestDir $gitUrl
    if [ $? -ne 0 ]; then
        echo -e "${RED}Something went wrong fetching ${GREEN}${gitUrl}${NC} into ${GREEN}${colorsDir}${NC}"
        exit 1
    fi
    mv $latestDir/*.vim $colorsDir
    rmdir $latestDir
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Start of script

mkdir -p $VIM_BUNDLE_DIR
mkdir -p $VIM_AUTOLOAD_DIR

# make sure pathogen is installed so it can manage the other plugins
addPlugin "vim-pathogen"   "https://github.com/tpope/vim-pathogen.git"
cp -u $VIM_PATHOGEN_DIR/autoload/pathogen.vim $VIM_AUTOLOAD_DIR/
rm -rf $VIM_PATHOGEN_DIR

#Install/update the following plugins, some require additional binaries to work
addPlugin "ack.vim"                         "https://github.com/mileszs/ack.vim.git" # requires silversearcher-ag
addPlugin "conoline.vim"                    "https://github.com/miyakogi/conoline.vim.git"
addPlugin "ctrlp.vim"                       "https://github.com/kien/ctrlp.vim.git"
addPlugin "fonts"                           "https://github.com/powerline/fonts.git"
addPlugin "fzf"                             "https://github.com/junegunn/fzf.git" #FuzzyFinder binaries
addPlugin "fzf.vim"                         "https://github.com/junegunn/fzf.vim.git" #FuzzyFinder vim plugin
addPlugin "groovyindent-unix"               "https://github.com/vim-scripts/groovyindent-unix.git" #groovy indenting
addPlugin "nerdcommenter"                   "https://github.com/scrooloose/nerdcommenter.git"
addPlugin "nerdtree"                        "https://github.com/scrooloose/nerdtree.git"
addPlugin "syntastic"                       "https://github.com/scrooloose/syntastic.git"
addPlugin "tabular"                         "https://github.com/godlygeek/tabular.git"
addPlugin "vim-abolish"                     "https://github.com/tpope/vim-abolish.git"
addPlugin "vim-airline"                     "https://github.com/bling/vim-airline.git"
addPlugin "vim-airline-themes"              "https://github.com/vim-airline/vim-airline-themes.git"
addPlugin "vim-bracketed-paste"             "https://github.com/ConradIrwin/vim-bracketed-paste.git"
addPlugin "vim-bufkill"                     "https://github.com/qpkorr/vim-bufkill" #delete buffers without closing panes
addPlugin "vim-easymotion"                  "https://github.com/easymotion/vim-easymotion.git"
addPlugin "vim-expand-region"               "https://github.com/terryma/vim-expand-region.git"
addPlugin "vim-fugitive"                    "https://github.com/tpope/vim-fugitive.git"
addPlugin "vim-gitgutter"                   "https://github.com/airblade/vim-gitgutter.git"
addPlugin "vim-javascript"                  "https://github.com/pangloss/vim-javascript.git"
addPlugin "vim-json"                        "https://github.com/elzr/vim-json.git"
addPlugin "vim-markdown"                    "https://github.com/plasticboy/vim-markdown.git"
addPlugin "vim-markdown-folding"            "https://github.com/nelstrom/vim-markdown-folding.git"
addPlugin "vim-markdown-preview"            "https://github.com/JamshedVesuna/vim-markdown-preview.git" #requires python, grip, xdotool and a browser to function
addPlugin "vim-markdown-toc"                "https://github.com/mzlogin/vim-markdown-toc.git"
addPlugin "vim-move"                        "https://github.com/matze/vim-move.git"
addPlugin "vim-repeat"                      "https://github.com/tpope/vim-repeat.git"
addPlugin "vim-scala"                       "https://github.com/derekwyatt/vim-scala.git"
addPlugin "vim-sneak"                       "https://github.com/justinmk/vim-sneak.git"
addPlugin "vim-surround"                    "https://github.com/tpope/vim-surround.git"
addPlugin "vim-textobj-brace"               "https://github.com/Julian/vim-textobj-brace.git"
addPlugin "vim-textobj-css"                 "https://github.com/jasonlong/vim-textobj-css.git"
addPlugin "vim-textobj-function"            "https://github.com/kana/vim-textobj-function.git"
addPlugin "vim-textobj-line"                "https://github.com/kana/vim-textobj-line.git"
addPlugin "vim-textobj-quotes"              "https://github.com/beloglazov/vim-textobj-quotes.git"
addPlugin "vim-textobj-user"                "https://github.com/kana/vim-textobj-user.git"
addPlugin "vim-textobj-variable-segment"    "https://github.com/Julian/vim-textobj-variable-segment.git"
addPlugin "vim-tmux-navigator"              "https://github.com/christoomey/vim-tmux-navigator.git"
addPlugin "vim-togglelist"                  "https://github.com/milkypostman/vim-togglelist.git"
addPlugin "vim-unimpaired"                  "https://github.com/tpope/vim-unimpaired.git"
addPlugin "vim-yaml"                        "https://github.com/stephpy/vim-yaml.git"
#YouCompleteMe is heavyweight and needs node/npm and the following
#sudo apt-get install -y build-essential cmake python-dev python3-dev
#cd ~/.vim/bundle/youcompleteme
#git submodule update --init --recursive
#./install.py --tern-completer
addPlugin "youcompleteme"                   "https://github.com/valloric/youcompleteme.git"

#Add various colour schemes
addColour "https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim"
addColour "https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim"
addColour "https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Eighties.vim"
addColour "https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Bright.vim"

#Checks for certain binaries
command -v ag 1>/dev/null || echo -e "\n${RED}ag (Silver Searcher) is not installed (this is used by ctrl-p, ack.vim and FZF), install using: 'apt-get install silversearcher-ag'${NC}"

[[ -f ~/.fzf.zsh ]] || echo -e "\n${RED}FZF is not installed, run 'install' in ~/.vim/bundle/fzf${NC}"

