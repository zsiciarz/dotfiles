===========
Vim plugins
===========

Vundle
======

::

    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Afterwards open vim and run ``:BundleInstall``. Done!


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
