#!/bin/bash

CONFIG_FILES=(
.tmux.conf
.zshrc
.pylintrc
.vimrc
.gitconfig
)

# backpack dir
if [ -d ~/old_rcfiles ]
then
	echo "backpack dir already exists!"
else
	echo "backpack dir doesn't exist, create '~/old_rcfiles' instead"
	mkdir ~/old_rcfiles
fi

# backpack the old rc files
# make soft link to myrc
for file in ${CONFIG_FILES[@]}
do
	if [ -f ~/${file} ]
	then
		echo "${file} already exist!"
		mv ~/${file} ~/old_rcfiles
	elif [ -h ~/${file} ]
	then
		echo "${file} is soft link, move to old_rcfiles"
		mv ~/${file} ~/old_rcfiles
	else
		echo "${file} doesn't exist!"
	fi
	ln -s `pwd`/${file} ~/${file}
	ls -l ~/${file} | awk '{print "added "$9$10$11}'
done

# make soft link to other files
echo "install diff-so-fancy"
sudo mkdir -p /usr/local/bin
sudo ln -s `pwd`/diff-so-fancy /usr/local/bin/diff-so-fancy
ls -l /usr/local/bin/diff-so-fancy | awk '{print "added "$9$10$11}'

echo "install vim colors"
mkdir -p ~/.vim/colors
cp `pwd`/molokai.vim ~/.vim/colors

echo "install autojump"
git clone git://github.com/wting/autojump.git
cd autojump
./install.py
cd ..
echo "autojump installed"
