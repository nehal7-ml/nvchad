return {
  -- --fugitive
  {
    "tpope/vim-fugitive",
    lazy = false,
    cmd = "Git",
    config = function()
      require "configs.fugitive"
    end,
  },
  -- auto session plugin
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = require "configs.autoSessions",
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = require "configs.cmp",
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "configs.telescope"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- lsp_lines
  -- {
  --   "Maan2003/lsp_lines.nvim",
  --   event = "LspAttach",
  --   config = function()
  --     require "configs.lspLines"
  --   end,
  -- },
  -- {
  --   "nvimdev/lspsaga.nvim",
  --   event = "LspAttach",
  --   config = function()
  --     require "configs.lspsagaConfig"
  --   end,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter", -- optional
  --     "nvim-tree/nvim-web-devicons", -- optional
  --   },
  -- },
  --
  -- AI auto complete
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require "configs.supermaven"
    end,
  },
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require "colorPickernfigs.colorPicker"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require "configs.diffview"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
}
