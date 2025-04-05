-- Theme setup
require('onedark').setup({
  style = 'darker', 
  toggle_style_key = '<leader>ts',
  colors = {
    fg = '#c1c5cd',
    bg0 = '#0d0d0d',
  }
})
require('onedark').load()

-- Lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'copilot', 'fileformat', 'filetype'},
    lualine_y = {'progress', 'selectioncount'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- NeoTree setup
require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    width = 40,
    highlight = {
      enable = true,
      bg = "Normal",
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        "venv",
        "vim"
      },
      never_show = {
        ".DS_Store",
        "thumbs.db",
        ".git"
      },
    },
  },
})

