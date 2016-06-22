#!/bin/sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

VIM_DIR=~/.vim
VIM_BUNDLE_DIR=$VIM_DIR/bundle
VIM_AUTOLOAD_DIR=$VIM_DIR/autoload
VIM_PATHOGEN_DIR=$VIM_BUNDLE_DIR/vim-pathogen

addPlugin(){
    if [ $# -ne 2 ]; then
        echo "Invalid args to addPlugin"
        exit 1
    fi

    dirName=$1
    gitUrl=$2
    pluginDir=$VIM_BUNDLE_DIR/$dirName

    if [ -d $pluginDir ]; then
        cd $pluginDir
        echo "Updating $dirName"
        git pull
    else
        cd $VIM_BUNDLE_DIR
        echo "Cloning $dirName"
        git clone $gitUrl
    fi
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Start of script

mkdir -p $VIM_BUNDLE_DIR
mkdir -p $VIM_AUTOLOAD_DIR

# make sure pathogen is installed so it can manage the other plugins
addPlugin "vim-pathogen"   "https://github.com/tpope/vim-pathogen.git"
cp -u $VIM_PATHOGEN_DIR/autoload/pathogen.vim $VIM_AUTOLOAD_DIR/
rm -rf $VIM_PATHOGEN_DIR


addPlugin "ctrlp.vim"                       "https://github.com/kien/ctrlp.vim.git"
addPlugin "fonts"                           "https://github.com/powerline/fonts.git"
addPlugin "nerdtree"                        "https://github.com/scrooloose/nerdtree.git"
addPlugin "nerdcommenter"                   "https://github.com/scrooloose/nerdcommenter.git"
addPlugin "syntastic"                       "https://github.com/scrooloose/syntastic.git"
addPlugin "vim-airline"                     "https://github.com/bling/vim-airline.git"
addPlugin "vim-airline-themes"              "https://github.com/vim-airline/vim-airline-themes.git"
addPlugin "vim-easymotion"                  "https://github.com/easymotion/vim-easymotion.git"
addPlugin "vim-fugitive"                    "https://github.com/tpope/vim-fugitive.git"
addPlugin "vim-surround"                    "https://github.com/tpope/vim-surround.git"
addPlugin "vim-abolish"                     "https://github.com/tpope/vim-abolish.git"
addPlugin "vim-repeat"                      "https://github.com/tpope/vim-repeat.git"
addPlugin "vim-scala"                       "https://github.com/derekwyatt/vim-scala.git"
addPlugin "vim-markdown"                    "https://github.com/plasticboy/vim-markdown.git"
addPlugin "tabular"                         "https://github.com/godlygeek/tabular.git"
addPlugin "vim-move"                        "https://github.com/matze/vim-move.git"
# ack.vim requires the perl tool Ack which can be obtained from the packager manager as 'ack-grep'
addPlugin "ack.vim"                         "https://github.com/mileszs/ack.vim.git"
addPlugin "vim-textobj-user"                "https://github.com/kana/vim-textobj-user.git"
addPlugin "vim-textobj-function"            "https://github.com/kana/vim-textobj-function.git"
addPlugin "vim-textobj-line"                "https://github.com/kana/vim-textobj-line.git"
addPlugin "vim-textobj-css"                 "https://github.com/jasonlong/vim-textobj-css.git"
addPlugin "vim-textobj-brace"               "https://github.com/Julian/vim-textobj-brace.git"
addPlugin "vim-textobj-variable-segment"    "https://github.com/Julian/vim-textobj-variable-segment.git"



# TODO add vim-textobj-user (and the text objects vim-textobj-line, vim-textobj-function, vim-textobj-css
