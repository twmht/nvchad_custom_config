local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.pyright.setup {
--   settings = {
--     pyright = {
--       autoImportCompletion = true,
--       verboseOutput = true,
--       reportUnusedImport = "information",
--       reportUnusedVariable = "information",
--       reportDuplicateImport = "error",
--     },
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         diagnosticMode = "openFilesOnly",
--         useLibraryCodeForTypes = true,
--         typeCheckingMode = "off",
--       },
--     },
--   },
-- }

-- 
-- lspconfig.pyright.setup { blabla}
