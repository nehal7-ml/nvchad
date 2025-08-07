local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier", "eslint_d" },
    html = { "prettierd", "eslint_d" },
    js = { "dprint", "eslint_d" },
    ts = { "dprint", "eslint_d" },
    jsx = { "dprint", "eslint_d" },
    tsx = { "dprint", "eslint_d" },
    json = { "prettierd", "eslint_d" },
    yaml = { "prettierd", "eslint_d" },
    markdown = { "prettierd" },
    svelte = { "prettierd" },
    vue = { "prettierd" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    php = { "php-cs-fixer" },
  },
  format = {
    lsp_fallback = true,
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
    lsp_format = "first",
  },
}

return options
