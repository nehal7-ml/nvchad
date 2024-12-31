local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    js = { "prettier" },
    ts = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    astro = { "prettier" },
    svelte = { "prettier" },
    vue = { "prettier" },
    python = { "isort", "ruff_format" },
  },
  opts = {
    -- These options will be default config for formatters
    prettier = {},
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
