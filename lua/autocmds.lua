require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hbs",
  callback = function()
    vim.bo.filetype = "html"
  end,
})
