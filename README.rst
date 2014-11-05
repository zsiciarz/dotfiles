===========
Vim plugins
===========

Vundle
======

::

    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall


Notes
=====

Solarized color scheme
----------------------

If you are a gnome-terminal user, see this: https://github.com/sigurdga/gnome-terminal-colors-solarized

Airline
-------

No fancy symbols? See https://github.com/Lokaltog/powerline-fonts for patched
fonts.

vimproc
-------

This plugin requires compilation after installing::

    cd ~/.vim/bundle/vimproc.vim
    make
