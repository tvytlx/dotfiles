#!/bin/bash

CONFIG_FILES=(
.tmux.conf
.zshrc
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
