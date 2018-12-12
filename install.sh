#!/usr/bin/env bash

echo "Existing .tmux.conf, .vimrc and .zshrc will be overwritten!!!"
read -p "Do you want to continue? (Y/N)" confirm

PWD=`pwd`
if [ "${confirm}" == "Y" ]
then
	rm ~/.tmux.conf ~/.vimrc ~/.zshrc
        echo "Link tmux config file: ln -s $PWD/tmux.conf ~/.tmux.conf"
        ln -s $PWD/tmux.conf ~/.tmux.conf
        echo "Link vimrc: ln -s $PWD/vimrc ~/.vimrc"
        ln -s $PWD/vimrc ~/.vimrc
        echo "Link zshrc: ln -s $PWD/zshrc ~/.zshrc"
        ln -s $PWD/zshrc ~/.zshrc
        echo "Link matplotlibrc: ln -s $PWD/matplotlibrc ~/.matplotlib/matplotlibrc"
        ln -s $PWD/matplotlibrc ~/.matplotlib/matplotlibrc
else
        echo "See you next time"
fi

