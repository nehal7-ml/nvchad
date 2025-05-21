-- load defaults i.e lua_lsp
local lspconfig = require "lspconfig"
vim.diagnostic.config {
  virtual_text = false,
  -- signs = false,
  -- underline = false,
}
local servers = {
  ast_grep = {},
  html = {},
  lua_ls = {},
  bashls = {},
  cssls = {},
  tailwindcss = {},
  vtsls = {},
  svelte = {},
  prismals = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          yapf = { enabled = true },
          pyflakes = { enabled = true },

          rope_autoimport = {
            enabled = true,
            completions = { enable = true },
            code_actions = { enable = true },
          },
          pycodestyle = {
            ignore = { "W391" },
            maxLineLength = 100,
          },
        },
      },
    },
  },
  -- pyright = {
  --   settings = {
  --     pyright = {
  --       -- Using Ruff's import organizer
  --     },
  --   },
  -- },
  phpactor = {},
  astro = {},
  emmet_ls = {},
  biome = {},
  jsonls = {},
}

local nvlsp = require "nvchad.configs.lspconfig"

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end
