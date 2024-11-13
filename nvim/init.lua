vim.opt.tabstop = 4       -- Set the number of space characters inserted for a tab
vim.opt.shiftwidth = 4    -- Set the number of space characters used for each step of (auto)indent
vim.opt.expandtab = true  -- Converts tabs to spaces
vim.opt.number = true     -- Print the line number in front of each line
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus' -- Use the system clipboard
vim.g.python3_host_prog = '/usr/bin/python3'

-- Set pumheight to 10 lines
vim.o.pumheight = 25

-- Auto-install vim-plug if it's not already installed
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', plug_path, '--create-dirs', 
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
end

-- Plugins
-- Plug 'vim-airline/vim-airline'
vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'micangl/cmp-vimtex'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'zbirenbaum/copilot-cmp'

  Plug 'L3MON4D3/LuaSnip'
  Plug 'onsails/lspkind.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'zbirenbaum/copilot.lua'  
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-sensible'
  Plug 'lervag/vimtex'
  Plug 'dense-analysis/ale'
  Plug 'lervag/wiki'
  Plug 'AndreM222/copilot-lualine'

  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'navarasu/onedark.nvim'
  Plug 'morhetz/gruvbox' 
  Plug 'vim-airline/vim-airline-themes'
  
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'pocco81/auto-save.nvim'
  Plug 'airblade/vim-gitgutter'

  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-telescope/telescope.nvim'  
  Plug 'nvim-lua/plenary.nvim'
  Plug 'stevearc/conform.nvim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
 
  call plug#end()
]]

-- Plug 'davidhalter/jedi-vim'

require('onedark').setup({
  style = 'darker', 
  toggle_style_key = '<leader>ts',
  colors = {
    fg = '#c1c5cd',
    bg0 = '#0d0d0d',
  }
})
require('onedark').load()

-- vimtex settings
vim.g.vimtex_view_method = 'skim' 
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  aux_dir = 'build'

}
vim.g.ale_fix_on_save = 1
vim.g.ale_linters = {
  tex = {'chktex', 'lacheck'},
  python = {'black'}
}
vim.g.vimtex_view_method = 'skim'
-- vim.g.vimtex_view_skim_sync = 1
-- vim.g.vimtex_view_skim_activate = 0
-- vim.g.vimtex_view_skim_no_select = 0

vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-F>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-/>', '<plug>NERDCommenterInvert', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true, noremap = true, silent = true})
--vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"', {expr = true, noremap = true, silent = true})
--vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', "<leader>nt", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>nt", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>ff", ":Format<CR>", { noremap = true, silent = true })


-- Optional: CoC settings for auto-completion
vim.g.coc_global_extensions = {
  'coc-snippets',
  'coc-pairs',
  'coc-texlab',
  'coc-json',
  'coc-css',
  'coc-clangd',
  'coc-pyright',
}
-- Disable coc for certain filetypes
--vim.cmd [[
  --autocmd FileType python let b:coc_suggest_disable = 1
--]]


-- Optional: Additional settings for better experience
vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false


--Tree sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python",
    "c",
    "cpp",
    "lua",
    "latex",
    "java",
    "markdown",
    "toml",
    "bash",
    "json",
    "yaml",
    "html",
    "css",
    "javascript",
    "typescript",
    "rust",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

-- NeoTree
require("neo-tree").setup({
  close_if_last_window = true, -- Close NeoTree if it's the last window
  window = {
    width = 40, -- Set the width of the NeoTree window
    -- Match the background color of the NeoTree window to the background color of the terminal
    highlight = {
      enable = true,
      bg = "Normal",
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
    }, -- Highlight the current file in the tree
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

-- Conform
require('conform').setup({
  formatters_by_ft = {
    python = {'black'},
    c = {'clang-format'},
    cpp = {'clang-format'},
  }
})

-- Configure the Format command
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })


-- Copilot (but better)
require('copilot').setup({
  suggestion = { enable = false },
  panel = { enable = false },
})
require('copilot_cmp').setup()

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require("lspkind")
lspkind.init({
  symbol_map = {
    Copilot = "",
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<S-Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
--    ["<Tab>"] = vim.schedule_wrap(function(fallback)
--      if cmp.visible() and has_words_before() then
--        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--      else
--        fallback()
--      end
--    end),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() and not has_words_before() then
        fallback()
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    --['<S-Tab>'] = cmp.mapping(function(fallback)
      --if cmp.visible() then
        --cmp.select_prev_item()
      --elseif luasnip.jumpable(-1) then
        --luasnip.jump(-1)
      --else
        --fallback()
      --end
    --end, { 'i', 's' }),
  },
  sources = {
    { name = "copilot"},
    { name = 'vimtex', },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'ultisnips' }, -- For ultisnips user.
    { name = 'path' }, -- for path completion
    { name = 'buffer', keyword_length = 4 }, -- for buffer word completion
    { name = 'cmdline' }, -- for command line completion
    { name = 'yank' }, -- for yank completion
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     -- can also be a function to dynamically calculate max width such as 
                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}

-- LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = 'clippy'
      }
    }
  }
}
lspconfig.pyright.setup{
  capabilities = capabilities
}
lspconfig.clangd.setup{
  capabilities = capabilities
}


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
  -- +-------------------------------------------------+
  -- | A | B | C                             X | Y | Z |
  -- +-------------------------------------------------+
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

require('cmp_vimtex').setup({
    -- Eventual options can be specified here.
    -- Check out the tutorial for further details.
})
