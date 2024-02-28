-- this config is heavily inspired from
-- https://github.com/aquilesg/nvchadconfig/blob/main/plugins.lua
local overrides = require("custom.configs.overrides")


---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },
  -- for automatic lsp server setup
  -- see https://zhuanlan.zhihu.com/p/614518048
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "Exafunction/codeium.nvim"
      },
    },
    opts = overrides.cmp,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    lazy = false,
    config = function()
      require "custom.user.hop"
    end,
  },
  {
    'tpope/vim-surround',
    lazy = false
  },
  {
    "Exafunction/codeium.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
      })
    end,
  },
  {
    "roxma/vim-tmux-clipboard",
    lazy=false
  },
  {
    'airblade/vim-gitgutter',
     lazy=false
  },
  -- {
  --   'majutsushi/tagbar',
  --    config = function()
  --     vim.g.tagbar_autofocus = 1
  --     vim.g.tagbar_autoclose = 1
  --     vim.keymap.set('n', '<F9>', ':TagbarToggle<CR>', {noremap=true, silent = true, nowait = true})
  --    end,
  --   lazy=false
  -- },
  {
    'ojroques/nvim-osc52',
    lazy=false,
    config = function()
      vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
      vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
      vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
    end
  },
  -- Diagnostic stuff
  {
    "folke/trouble.nvim",
    cmd = {
      "Trouble"
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = {
      "Lspsaga"
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({})
    end,
  },
  {
  "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })
      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
    lazy=false
},

}

return plugins
