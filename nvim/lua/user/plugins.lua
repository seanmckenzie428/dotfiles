local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    { import = 'user.plugins.jessarcher' },

    {
      "seanmckenzie428/onedark.nvim",
      priority = 1000, -- make sure this gets loaded first since it's the default colorscheme
      init = function()
        vim.cmd("colorscheme onedark")
--        vim.api.nvim_set_h1(0, 'FloatBorder', {
--          fg = vim.api.nvim_get_h1_by_name('NormalFloat', true).background,
--          bg = vim.api.nvim_get_h1_by_name('NormalFloat', true).background
--        })
      end
    },

})
