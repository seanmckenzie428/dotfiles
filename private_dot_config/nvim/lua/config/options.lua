-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- lua/config/options.lua
local function sync_background_with_macos()
  local result = vim.fn.system({
    "osascript",
    "-e",
    'tell application "System Events" to tell appearance preferences to get dark mode',
  })

  local bg = result:match("true") and "dark" or "light"
  if vim.o.background ~= bg then
    vim.opt.background = bg
    vim.cmd.colorscheme("rose-pine")
  end
end

sync_background_with_macos()

vim.api.nvim_create_autocmd("FocusGained", {
  callback = sync_background_with_macos,
})
