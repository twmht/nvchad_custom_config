local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "pyright",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

local cmp_ok, cmp = pcall(require, "cmp")

if cmp_ok then
  M.cmp = {
    sources = {
      { name = "codeium",  group_index = 2, priority = 75 },
      { name = "nvim_lsp", group_index = 2, priority = 100 },
      { name = "buffer",   group_index = 2, priority = 50 },
      { name = "path",     group_index = 2, priority = 50 },
      { name = "nvim_lua", group_index = 2, priority = 50 },
      { name = "luasnip",  group_index = 2, priority = 50 },
      { name = "git",      group_index = 2, priority = 50 }
    },
    -- mapping = {
    --   ["<C-y>"] = cmp.mapping.confirm {
    --     behavior = cmp.ConfirmBehavior.Insert,
    --     select = true,
    --   },
    --   ["<CR>"] = cmp.config.disable,
    -- },
    -- https://github.com/hrsh7th/nvim-cmp/discussions/1829
    preselect = cmp.PreselectMode.Item,
    completion = { completeopt = "menu,menuone" },
  }

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
  })
end

return M
