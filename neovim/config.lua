local natural_cmp = require "recipes"
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { name = "autopep8", filetypes = { "*.py" } },
  { name = "prettier", filetypes = { "*.js" } },
}

lvim.plugins = {
  { "xiyaowong/virtcolumn.nvim" },
  { "projekt0n/github-nvim-theme" },
}

lvim.colorscheme = "github_dark_high_contrast"
-- Add ruler at column 80 with virtcolumn.nvim plugin
vim.opt.colorcolumn = "80"

-- Set tabs size for different files
lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = { "*.c", "*.cpp", "*.py" },
      command = "setlocal tabstop=4 shiftwidth=4",
    }
  },
}

-- Use natural sort in nvim-tree
lvim.builtin.nvimtree.setup.sort_by = function(nodes)
  table.sort(nodes, natural_cmp)
end
