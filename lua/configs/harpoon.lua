local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup {}
-- REQUIRED

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

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-p>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-i>", function()
  harpoon:list():next()
end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

vim.keymap.set("n", "<leader>ce", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
