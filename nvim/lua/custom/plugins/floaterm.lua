return {
  'voldikss/vim-floaterm',
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.keymap.set('n', '<F12>', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>')
  end
}
