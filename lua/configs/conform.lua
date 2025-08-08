local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    handlebars = { "hbs_with_partials", lsp_format = "fallback" },
    javascript = { "eslint_d", "prettierd" },
    typescript = { "eslint_d", "prettierd" },
    javascriptreact = { "eslint_d", "prettierd" },
    typescriptreact = { "eslint_d", "prettierd" },
    json = { "eslint_d", "prettierd" },
    yaml = { "eslint_d", "prettierd" },
    markdown = { "prettierd" },
    svelte = { "prettierd" },
    vue = { "prettierd" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    php = { "php-cs-fixer" },
  },
  format = {
    async = true,
    lsp_fallback = true,
  },
  formatters = {
    ["hbs_with_partials"] = {
      command = "prettier",
      args = {
        "--parser",
        "angular",
        "--stdin-filepath",
        "$FILENAME",
      },
    },
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
