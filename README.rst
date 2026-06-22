Notes
=====

Treesitter

For Neovim >= 0.12, install the CLI:

.. code-block::
   $ sudo apt install tree-sitter-cli

Airline
-------

No fancy symbols? See https://github.com/powerline/fonts for patched fonts.

Python language server
----------------------

.. code-block::

    $ uv tool install python-lsp-server --with=pyflakes --with=pylsp-mypy --with=pyls-isort --with=python-lsp-black

Typescript and JSON language servers
------------------------------------

.. code-block::

   $ npm install -g typescript typescript-language-server eslint prettier vscode-langservers-extracted
