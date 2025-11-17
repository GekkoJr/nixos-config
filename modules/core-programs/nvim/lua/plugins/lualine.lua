-- setup statusbar 
require('lualine').setup({
    options = {
    icons_enabled = true,
    theme = "tomorrow_night",

    },
    -- the bar contains six sections
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'lsp_status'}, 
    lualine_y = {'filetype'},
    lualine_z = {'location'},
        
    },
})