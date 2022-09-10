#! /bin/bash

set -u

BASEDIR=$PWD

ln -snfv ${BASEDIR}/.vimrc ~/.vimrc
ln -snfv ${BASEDIR}/.vim/dein.toml ~/.vim/dein.toml
ln -snfv ${BASEDIR}/.vim/dein_lazy.toml ~/.vim/dein_lazy.toml

source ${BASEDIR}/.bash/function.bash
