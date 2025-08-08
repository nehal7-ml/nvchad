local function disable_ts_for_long_lines(lang, bufnr)
  -- The character count threshold
  local line_length_threshold = 600

  -- Get all lines from the buffer
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- Iterate through the lines and check their length
  for _, line in ipairs(lines) do
    if #line > line_length_threshold then
      return true
    end
  end

  return false
end
return {

  install = {
    compilers = { "zig" },
  },
  highlight = {
    enable = true,
    disable = disable_ts_for_long_lines,
  },
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "python",
    "javascript",
    "typescript",
    "tsx",
    "svelte",
    "vue",
    "prisma",
    "json",
    "markdown",
    "yaml",
    "toml",
    "dockerfile",
    "bash",
    "diff",
    "gitignore",
    "query",
    "sql",
    "toml",
    "html",
    "glimmer",
    "xml",
    "astro",
    "nu",
  },
}
