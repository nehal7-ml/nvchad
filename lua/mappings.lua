require "nvchad.mappings"

-- add yours here
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<F5>", ":bufdo e <CR>", { desc = "Edit all buffers" })
map("n", "<leader>bd", ":bufdo bd <CR>", { desc = "Delete all buffers" })
--- unMap Tab used by tabufline
vim.cmd ":unmap <Tab>"

-- map("n", "<leader>ca", "vim.lsp.buf.code_action()", { desc = "code action" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
