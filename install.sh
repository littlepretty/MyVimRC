#!/usr/bin/env bash

echo "Existing .tmux.conf, .vimrc and .zshrc will be overwritten!!!"
read -p "Do you want to continue? (Y/N)" confirm

if [ "${confirm}" == "Y" ]
then
        echo "ln -s tmux.conf ~/.tmux.conf"
        ln -s tmux.conf ~/.tmux.conf
        echo "ln -s vimrc ~/.vimrc"
        ln -s vimrc ~/.vimrc
        echo "ln -s zshrc ~/.zshrc"
        ln -s zshrc ~/.zshrc
else
        echo "See you next time"
fi

