local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier", "eslint_d" },
    html = { "prettier", "eslint_d" },
    js = { "dprint", "eslint_d" },
    ts = { "dprint", "eslint_d" },
    jsx = { "dprint", "eslint_d" },
    tsx = { "dprint", "eslint_d" },
    json = { "prettier", "eslint_d" },
    yaml = { "prettier", "eslint_d" },
    markdown = { "prettier" },
    astro = { "prettier" },
    svelte = { "prettier" },
    vue = { "prettier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    php = { "php-cs-fixer" },
  },

  opts = {
    -- These options will be default config for formatters
    prettier = {},
  },
  formatters = {
    ["php-cs-fixer"] = {
      command = "php-cs-fixer",
      args = {
        "fix",
        "$FILENAME",
        "--config=/your/path/to/config/file/[filename].php",
        "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
      },
      stdin = false,
    },
  },
  format_after_save = {
    -- These options will be passed to conform.format()
    async = true,
    timeout_ms = 2500,
    lsp_fallback = true,
  },
}

return options
