require("config.lazy")
require("config.treesitter")
require("config.vscode")
require("config.term")
require("config.substitute")

vim.cmd([[
  hi YankHighlight guibg=#f9eebe
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="YankHighlight", timeout=100 }

  set clipboard+=unnamedplus
]])

vim.wo.number = true
vim.wo.relativenumber = true
