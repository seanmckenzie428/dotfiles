return {
-- Add, change, and delete surrounding text.
  { 'tpope/vim-surround' },

  -- Useful commands like :Rename and :SudoWrite.
  { 'tpope/vim-eunuch' },

  -- Pairs of handy bracket mappings, like [b and ]b.
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },

  -- Indent autodetection with editorconfig support.
  { 'tpope/vim-sleuth' },

  -- Allow plugins to enable repeating of commands.
  { 'tpope/vim-repeat' },

  -- Navigate seamlessly between Vim windows and Tmux panes.
  { 'christoomey/vim-tmux-navigator' },

  -- Jump to the last location when opening a file.
  { 'farmergreg/vim-lastplace' },

  -- Enable * searching with visually selected text.
  { 'nelstrom/vim-visual-star-search' },

  -- Automatically create parent dirs when saving.
  { 'jessarcher/vim-heritage' },

  -- Text objects for HTML attributes.
  { 'whatyouhide/vim-textobj-xmlattr', dependencies = 'kana/vim-textobj-user'  },

  {
  'airblade/vim-rooter',
  init = function()
    -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
    vim.g.rooter_manual_only = 1
    vim.g.rooter_patterns = {'.git', 'composer.json'}
  end,
  config = function()
    vim.cmd('Rooter')
  end,
  },

-- Automatically add closing brackets, quotes, etc.
  { 'windwp/nvim-autopairs', config = true },

  -- Add smooth scrolling to avoid jarring jumps
  { 'karb94/neoscroll.nvim', config = true },

  -- Split arrays and methods onto multiple lines, or join them back up
  {
      'Wansmer/treesj',
      keys = { '<space>m', '<space>j', '<space>s' },
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      init = function()
        require('treesj').setup({--[[ your config ]]})
      end,
  },

  -- Automatically fix indentation when pasting code
  {
      'sickill/vim-pasta',
      init = function()
          vim.g.pasta_disabled_filetypes = { 'fugitive' }
      end
  }

}
