local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup {}
-- REQUIRED
--

--clear harpoon list

vim.keymap.set("n", "<leader>hra", function()
  harpoon:list():clear()
end, { desc = "Clear harpoon list" })
-- Add file to harpoon
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add file to harpoon" })

-- remove file from harpoon
vim.keymap.set("n", "<leader>rr", function()
  harpoon:list():remove()
end, { desc = "Remove file from harpoon" })

-- Qucik select files
-- Keybindings to select files (up to 8)
for i = 1, 8 do
  vim.keymap.set("n", "<A-" .. i .. ">", function()
    harpoon:list():select(i)
  end, { desc = "Harpoon: Select file " .. i })
end

-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-p>", function()
--   harpoon:list():prev()
-- end)
-- vim.keymap.set("n", "<C-I>", function()
--   harpoon:list():next()
-- end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  local make_finder = function()
    local paths = {}

    for _, item in ipairs(harpoon_files.items) do
      table.insert(paths, item.value)
    end

    return require("telescope.finders").new_table {
      results = paths,
    }
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
      attach_mappings = function(prompt_buffer_number, map)
        -- The keymap you need
        map("i", "<c-d>", function()
          local state = require "telescope.actions.state"
          local selected_entry = state.get_selected_entry()
          local current_picker = state.get_current_picker(prompt_buffer_number)

          -- This is the line you need to remove the entry
          harpoon:list():remove(selected_entry)
          current_picker:refresh(make_finder())
        end)

        return true
      end,
    })
    :find()
end

vim.keymap.set("n", "<leader>ce", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
