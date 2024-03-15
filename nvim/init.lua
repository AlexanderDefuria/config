vim.opt.tabstop = 4       -- Set the number of space characters inserted for a tab
vim.opt.shiftwidth = 4    -- Set the number of space characters used for each step of (auto)indent
vim.opt.expandtab = true  -- Converts tabs to spaces
vim.opt.number = true     -- Print the line number in front of each line
vim.opt.relativenumber = true

-- Auto-install vim-plug if it's not already installed
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', plug_path, '--create-dirs', 
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
end

-- Plugins
vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'loctvl842/monokai-pro.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neomake/neomake'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/syntastic'
  Plug 'neovim/nvim-lspconfig'
  Plug 'lambdalisue/vim-pyenv'
  Plug 'davidhalter/jedi-vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'airblade/vim-gitgutter'
  Plug 'pocco81/auto-save.nvim'
  
  call plug#end()
]]
-- Plug 'davidhalter/jedi-vim'
-- Theme
require("monokai-pro").setup({
})
-- lua
vim.cmd([[colorscheme monokai-pro]])

-- Python
vim.g.python3_host_prog = '/usr/bin/python3.12'
require'lspconfig'.pyright.setup{}
require'nvim-treesitter.configs'.setup{highlight={enable=true}} 
