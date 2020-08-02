Notes
=====

Solarized color scheme
----------------------

If you are a gnome-terminal user, see this: https://github.com/Anthony25/gnome-terminal-colors-solarized

Airline
-------

No fancy symbols? See https://github.com/powerline/fonts for patched fonts.

Flake8 support
--------------

First, install pyls-all by running ``:LspInstallServer`` when editing a Python file.
Until https://github.com/palantir/python-language-server/issues/281 is resolved,
run the following command to install flake8 plugin for pyls::

    ~/.local/share/vim-lsp-settings/servers/pyls-all/venv/bin/pip install https://github.com/emanspeaks/pyls-flake8/archive/master.zip

(Note: this disables pycodestyle, mccabe and pyflakes plugins.)

Rust support
------------

Install RLS with the following command::

    rustup component add rls rust-analysis rust-src
