require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
        -- fix several highlight groups linked to Identifier
        -- which in solarized is a pretty intense shade of blue
        -- TODO: do we have to be so blunt? this feels ugly
        custom_captures = {
            ['field'] = 'Normal',
            ['parameter'] = 'Normal',
            ['variable'] = 'Normal',
        }
    },
    playground = {
        enable = true
    }
}
