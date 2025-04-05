-- LSP configuration
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure language servers
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

-- Treesitter configuration
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

-- Uncomment if you want treesitter-based folding
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- VimTeX configuration
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
vim.g.ale_fixers = {
  tex = {'latexindent'},
  -- python = {'black'}
}
vim.g.ale_hover_cursor = 1
vim.g.ale_hover_to_preview = 1

vim.g.vimtex_syntax_conceal = {
  greek = 1,
  math_bounds = 1,
  math_delimiters = 1,
  math_fracs = 1,
  math_symbols = 1,
}

-- Add Python-specific settings here
-- For example, DAP for Python debugging
local pythonPath = function()
  local cwd = vim.loop.cwd()
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    return cwd .. '/venv/bin/python'
  else
    return '/usr/bin/python'
  end
end


require('dap-python').setup(pythonPath())




-- Add C/C++ specific settings here
-- For example, additional clangd settings or build system integrations
