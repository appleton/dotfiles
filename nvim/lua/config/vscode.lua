if not vim.g.vscode then
  return
end

local vscode = require('vscode')

-- navigation
vim.keymap.set('n', 'gp', function() vscode.action('editor.action.peekDefinition') end)
vim.keymap.set('n', 'gd', function() vscode.action('editor.action.goToDeclaration') end)
vim.keymap.set('n', 'gb', function() vscode.action('workbench.action.navigateBack') end)
vim.keymap.set('n', 'gf', function() vscode.action('workbench.action.navigateForward') end)
vim.keymap.set('n', 'gr', function() vscode.action('editor.action.referenceSearch.trigger') end)
vim.keymap.set('n', 'gi', function() vscode.action('editor.action.goToImplementation') end)
vim.keymap.set('n', 'gt', function() vscode.action('go.toggle.test.file') end)

vim.keymap.set('n', 'ge', function()
  vscode.action('editor.action.marker.nextInFiles')
  vscode.action('closeMarkersNavigation')
  vscode.action('editor.action.showHover')
end)

vim.keymap.set('n', 'gE', function()
  vscode.action('editor.action.marker.prevInFiles')
  vscode.action('closeMarkersNavigation')
  vscode.action('editor.action.showHover')
end)

-- testing
vim.keymap.set('n', 'tt', function() vscode.action('testing.runAtCursor') end)
vim.keymap.set('n', 'ttt', function() vscode.action('go.subtest.cursor') end)
vim.keymap.set('n', 'tf', function() vscode.action('testing.runCurrentFile') end)
vim.keymap.set('n', 'tp', function() vscode.action('go.test.package') end)
vim.keymap.set('n', 't.', function() vscode.action('testing.reRunLastRun') end)

vim.keymap.set('n', 'ss', function() vscode.action('workbench.action.debug.selectandstart') end)
vim.keymap.set('n', 's.', function() vscode.action('workbench.action.debug.restart') end)

-- misc
vim.keymap.set('n', '<esc>', function() vscode.action('workbench.action.closePanel') end)
