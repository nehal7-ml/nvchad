-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local M = {}

local CM = {}

CM.base_30 = {
  cyan = "#aad2ff",
  nord_blue = "#80a8fd",
  blue = "#7aa2f7",
  purple = "#bb9af7",
  dark_purple = "#9d7cd8",
}

M.base46 = {
  theme = "nightowl",
  changed_themes = {
    nightowl = {
      base_30 = {
        purple = "#bb9af7",
        dark_purple = "#9d7cd8",
      },
      polish_hl = {
        treesitter = {
          ["@keyword"] = { fg = CM.base_30.purple },
          ["@variable.parameter"] = { fg = "#569CD6" },
          ["@variable"] = { fg = "#dee1e6" },
          ["@variable.member.key"] = { fg = CM.base_30.cyan },
          ["@keyword.return"] = { fg = CM.base_30.purple },
          ["@keyword.function"] = { fg = CM.base_30.nord_blue },
          ["@constant"] = { fg = CM.base_30.blue },
          ["@keyword.import"] = { fg = CM.base_30.purple },
        },
      },
    },
  },
}
--
-- M.hl_override = {
--   ["@keyword"] = { fg = M.base_30.blue },
-- }
M.hl_override = {
  Comment = { italic = true },
  ["@comment"] = { italic = true },
}

M.ui = {
  tabufline = {
    enabled = true,
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  },
}
return M
