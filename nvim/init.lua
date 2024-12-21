require("config.lazy")
require("config.treesitter")
require("config.vscode")
require("config.term")

vim.cmd([[
  hi YankHighlight guibg=#004FAA
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="YankHighlight", timeout=100 }

  set clipboard+=unnamedplus
]])
