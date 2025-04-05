   --Basic Neovim settings
vim.opt.shiftwidth = 4    -- Set the number of space characters used for each step of (auto)indent
vim.opt.expandtab = true  -- Converts tabs to spaces
vim.opt.number = true     -- Print the line number in front of each line
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus' -- Use the system clipboard
vim.g.python3_host_prog = '/usr/bin/python3'
vim.opt.guifont = 'FiraMono Nerd Font Mono:h14:#e-subpixelantialias'
vim.o.pumheight = 25

-- Optional: Additional settings for better experience
vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false

-- Auto-install vim-plug if it's not already installed
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', plug_path, '--create-dirs', 
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
end

-- Plugins
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

  Plug 'mfussenegger/nvim-dap'
  Plug 'mfussenegger/nvim-dap-python'
  Plug 'nvim-neotest/nvim-nio'
  Plug 'rcarriga/nvim-dap-ui'
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
  Plug 'preservim/nerdcommenter'
  Plug 'pocco81/auto-save.nvim'
  Plug 'airblade/vim-gitgutter'

  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-telescope/telescope.nvim'  
  Plug 'nvim-lua/plenary.nvim'
  Plug 'stevearc/conform.nvim'

  call plug#end()
]]

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>nt", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>ff", ":Format<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-_>', '<plug>NERDCommenterInvert', { noremap = true, silent = true })

