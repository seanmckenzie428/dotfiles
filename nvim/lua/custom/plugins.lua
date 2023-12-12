local plugins = {

  --------------------------------------------------
  -- SYNTAX HIGHLIGHTING
  --------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        --defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "jsdoc",
        "php",
        "phpdoc",
        "sql",
        "svelte",
        "vue",
        "xml",
        "yaml",

        -- game dev
        "c_sharp",

        -- other
        "bash",
        "swift",
        "markdown",
        "todotxt",
      },
    },
  },

  --------------------------------------------------
  -- LSP Configuration
  --------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "intelliphense",
      },
    },
  },

  --------------------------------------------------
  -- FORMATTING & LINTING
  --------------------------------------------------
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
