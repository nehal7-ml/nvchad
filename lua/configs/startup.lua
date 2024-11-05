local startup = require "startup"

startup.setup {
  theme = "evil", -- dark or light

  options = {
    mapping_keys = true, -- display mapping (e.g. <leader>ff)

    -- if < 1 fraction of screen width
    -- if > 1 numbers of column
    cursor_column = 0.5,
    empty_lines_between_mappings = true, -- add an empty line between mapping/commands
    disable_statuslines = true, -- disable status-, buffer- and tablines
    paddings = { 1, 2 }, -- amount of empty lines before each section (must be equal to amount of sections)
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2", -- the color of folded sections
    -- this can also be changed with the `StartupFoldedSection` highlight group
  },
}
