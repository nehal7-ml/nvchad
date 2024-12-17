-- load defaults i.e lua_lsp
local lspconfig = require "lspconfig"
vim.diagnostic.config {
  virtual_text = false,
  -- signs = false,
  -- underline = false,
}
local servers = {
  html = {},
  lua_ls = {},
  bashls = {},
  cssls = {},
  tailwindcss = {},
  vtsls = {},
  svelte = {},
  prismals = {},
  eslint = {},
  pyright = {},
  astro = {},
  emmet_ls = {},
  biome = {},
}

local nvlsp = require "nvchad.configs.lspconfig"

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end
