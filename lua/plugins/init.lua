return {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = require "configs.neoTree",
  },

  -- neo scrolling
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    opts = require "configs.neoscroll",
    enabled = false,
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

  {
    "folke/trouble.nvim",
    opts = (require "configs.trouble").opts,
    cmd = (require "configs.trouble").cmd,
    keys = (require "configs.trouble").keys,
  },
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require "configs.harpoon"
    end,
  },

  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require "configs.supermaven"
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
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require "configs.diffview"
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    lazy = false,
    config = function()
      require "configs.colorPicker"
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
