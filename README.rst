===========
Vim plugins
===========

Pathogen
========

::

    mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -so ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim


Fugitive
========

::

    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-fugitive.git


Lawrencium
==========

::

    cd ~/.vim/bundle
    hg clone https://bitbucket.org/ludovicchabant/vim-lawrencium
