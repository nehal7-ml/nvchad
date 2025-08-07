-- load defaults i.e lua_lsp
local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

-- local border = { "ſ", "─", "ɿ", "│", "ɭ", "─", "ɭ", "│" }
local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }


vim.diagnostic.config {
  virtual_text = false,
  float = { border = border },
}

local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover {
    border = border,
  }
end

local function get_pkg_path(pkg, path, opts)
  pcall(require, "mason") -- make sure Mason is loaded. Will fail when generating docs
  local root = vim.env.MASON or (vim.fn.stdpath "data" .. "/mason")
  opts = opts or {}
  opts.warn = opts.warn == nil and true or opts.warn
  path = path or ""
  local ret = root .. "/packages/" .. pkg .. "/" .. path
  if opts.warn and not vim.loop.fs_stat(ret) and not require("lazy.core.config").headless() then
    warn(
      ("Mason package path not found for **%s**:\n- `%s`\nYou may need to force update the package."):format(pkg, path)
    )
  end
  return ret
end

local servers = {
  ast_grep = {},
  html = {},
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },
  bashls = {},
  cssls = {},
  tailwindcss = {},
  -- ts_ls = {
  --   init_options = {
  --     plugins = {
  --       {
  --         name = "typescript-svelte-plugin",
  --         location = "/node_modules/typescript-svelte-plugin",
  --         languages = { "javascript", "typescript", "svelte" },
  --       },
  --     },
  --   },
  -- },
  vtsls = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          maxInlayHintLength = 30,
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      tsserver = {
        globalPlugins = {
          name = "typescript-svelte-plugin",
          location = get_pkg_path("svelte-language-server", "/node_modules/typescript-svelte-plugin"),
          enableForWorkspaceTypeScriptVersions = true,
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
  },
  svelte = {},
  prismals = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          yapf = { enabled = true },
          pyflakes = { enabled = true },

          rope_autoimport = {
            enabled = true,
            completions = { enable = true },
            code_actions = { enable = true },
          },
          pycodestyle = {
            ignore = { "W391", "W503" },
            maxLineLength = 100,
          },
        },
      },
    },
  },
  -- pyright = {
  --   settings = {
  --     pyright = {
  --       -- Using Ruff's import organizer
  --     },
  --   },
  -- },
  phpactor = {},
  astro = {},
  emmet_ls = {},
  biome = {},
  jsonls = {},
}

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end

-- vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers
