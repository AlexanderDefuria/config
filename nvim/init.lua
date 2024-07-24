vim.opt.tabstop = 4       -- Set the number of space characters inserted for a tab
vim.opt.shiftwidth = 4    -- Set the number of space characters used for each step of (auto)indent
vim.opt.expandtab = true  -- Converts tabs to spaces
vim.opt.number = true     -- Print the line number in front of each line
vim.opt.relativenumber = true
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true, silent = true })
vim.g.python3_host_prog = '/usr/bin/python3'

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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/syntastic'
  Plug 'neovim/nvim-lspconfig'
  Plug 'sheerun/vim-polyglot'
  Plug 'airblade/vim-gitgutter'
  Plug 'pocco81/auto-save.nvim'
  Plug 'davidhalter/jedi-vim'
  Plug 'navarasu/onedark.nvim'
  Plug 'morhetz/gruvbox'

  Plug 'tpope/vim-sensible'
  Plug 'lervag/vimtex'
  Plug 'dense-analysis/ale'
  Plug 'lervag/wiki'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  call plug#end()
]]

require('onedark').setup({
  style = 'darker', 
  toggle_style_key = '<leader>ts'
})
require('onedark').load()

require'lspconfig'.pyright.setup{}

-- vimtex settings
vim.g.vimtex_view_method = 'skim' -- Change to your preferred PDF viewer
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.ale_fix_on_save = 1
vim.g.ale_linters = {tex = {'chktex', 'lacheck'}}
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 0
vim.g.vimtex_view_skim_no_select = 0

vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>", {silent=true})


-- Optional: CoC settings for auto-completion
vim.g.coc_global_extensions = {'coc-snippets', 'coc-pairs', 'coc-texlab'}


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

-- NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- NerdCommenter
vim.api.nvim_set_keymap('n', '<C-/>', '<plug>NERDCommenterInvert', { noremap = true, silent = true })
