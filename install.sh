#!/usr/bin/env bash

echo "Existing .tmux.conf, .vimrc and .zshrc will be overwritten!!!"
read -p "Do you want to continue? (Y/N)" confirm

PWD=`pwd`
if [ "${confirm}" == "Y" ]
then
	rm ~/.tmux.conf ~/.vimrc ~/.zshrc
        echo "ln -s $PWD/tmux.conf ~/.tmux.conf"
        ln -s $PWD/tmux.conf ~/.tmux.conf
        echo "ln -s $PWD/vimrc ~/.vimrc"
        ln -s $PWD/vimrc ~/.vimrc
        echo "ln -s $PWD/zshrc ~/.zshrc"
        ln -s $PWD/zshrc ~/.zshrc
else
        echo "See you next time"
fi

