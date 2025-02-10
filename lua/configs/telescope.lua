local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
-- https://github.com/MagicDuck/grug-far.nvim/pull/305
local is_windows = vim.fn.has "win64" == 1 or vim.fn.has "win32" == 1
local vimfnameescape = vim.fn.fnameescape
local winfnameescape = function(path)
  local escaped_path = vimfnameescape(path)
  if is_windows then
    local need_extra_esc = path:find "[%[%]`%$~]"
    local esc = need_extra_esc and "\\\\" or "\\"
    escaped_path = escaped_path:gsub("\\[%(%)%^&;]", esc .. "%1")
    if need_extra_esc then
      escaped_path = escaped_path:gsub("\\\\['` ]", "\\%1")
    end
  end
  return escaped_path
end

local select_default = function(prompt_bufnr)
  vim.fn.fnameescape = winfnameescape
  local result = actions.select_default(prompt_bufnr, "default")
  vim.fn.fnameescape = vimfnameescape
  return result
end

-- set telescope key maps

vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume Telescope" })

-- telescope setup
telescope.setup {
  defaults = {
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    extensions_list = { "themes", "terms" },
    extensions = {},
    cache_picker = {
      num_pickers = 5,
    },
    mappings = {
      i = {
        ["<cr>"] = select_default,
        ["<C-Down>"] = actions.cycle_history_next,
        ["<C-Up>"] = actions.cycle_history_prev,
      },

      n = {
        ["<cr>"] = select_default,
        ["q"] = actions.close,
      },
    },
  },
}
