if vim.g.vscode then
  return
end

require('lualine').setup()
require('github-theme').setup({
  palettes = {
    github_light = {
      white = "#ffffff",
      black = "#24292f"
    }
  },

  groups = {
    github_light = {
      CursorLine = { bg = '#f6f8fa' },
      LineNr = { fg = "#babbbc" },
      CursorLineNr = { fg = "#24292f" },
    },
  },
})

vim.cmd('colorscheme github_light')

vim.wo.wrap = false
vim.opt.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.keymap.set('i', 'jk', '<Esc>')

vim.cmd([[
  augroup RestoreCursorShapeOnExit
    autocmd!
      autocmd VimLeave * set guicursor=a:ver1
  augroup END
]])
