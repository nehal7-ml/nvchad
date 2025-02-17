local cmp = require "cmp"
local cmpOptions = require "nvchad.configs.cmp"

-- insert sources here
table.insert(cmpOptions.sources, { name = "supermaven" })
table.insert(cmpOptions.completion, { autocomplete = false })
-- table.insert(cmpOptions.mapping, {
--   presets = {
--     ["<C-Space>"] = cmp.mapping.complete(),
--   },
-- })

return cmpOptions
