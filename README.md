# vim plugin usage and instructions

Vim plugin and configuration out of the box

对应gitee地址是:

## Install

1, Clone the code directly to the home/user directory

2, Copy the files under go-bin to $GOBIN, it is recommended to copy them to the bin of the go installation directory, mainly the packages required by the vim-go plugin

3, Execute the install.sh script, only for the Linux operating system of the debian series, other systems choose according to their own

4, Whether to delete the go-bin file and add, it depends on your choice

## instruction

.vimrc is mainly related to vim configuration

.vimrc.bundle is mainly plug-in configuration

If you want global configuration, you can copy .vimrc to /etc/vimrc

## How to use

Shortcut key introduction

F2: Show or hide the line number

F3: Automatic line feed switch

F4: The classes, variables and functions are displayed on the left, and you can quickly jump to the corresponding place by selecting

F6: Syntax switch

F8: Fuzzy search, shortcut key for Ack plug-in.

F9: Generate various tags to facilitate jumping between functions

Horizontal split screen: hold down the Ctrl key, then press the lowercase w, do not release the Ctrl key, and press s again

Vertical split screen: Hold down the Ctrl key, then press the lowercase w, do not release the Ctrl key, and press v again

Split screen switching: ctrl+h/j/k/l left/down/up/right split screen change

ctrl+]: After the tag is produced, you can jump to the place where the method is defined

*: Search shortcut key, move the cursor to the word to be searched, press * to search in this file

%: match brackets

:b number:   Switch between titles

![](/home/legend/WorkSpace/github/vim-legend/images/image-20210808182119757.png)

Command: b2, you can switch the window to 98_copy_file.job

At the same time, you can also use the split screen switching shortcut key to switch the control area to the title and select the corresponding title

:e filepath open file

If you have any questions or suggestions for improvement, please contact me 163 email