local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)
vim.g.instant_username = "ArkashJain"
require('lazy').setup({
   -- "nathom/filetype.nvim",      -- Better filetype detection
   "nvim-lua/plenary.nvim",        -- Necessary dependency
   'kyazdani42/nvim-web-devicons', -- Cool icons
   'farmergreg/vim-lastplace',     -- Remember last cursor place

   -- Screenshare
   'jbyuki/instant.nvim',
   -- Theme
   {
      "catppuccin/nvim",
      lazy = false,
      priority = 1000,
      name = "catppuccin",
      config = function() require('plugins.theme') end
   },

   -- Comment lines with "gc"
   {
      'numToStr/Comment.nvim',
      config = function()
         require("plugins.comment")
      end,
      event = "BufEnter"
   },

   -- Illuminate words like the one you are hovering
   {
      'RRethy/vim-illuminate',
      config = function() require('plugins.illuminate') end,
      event = "BufEnter"
   },

   -- Disable some features for big files
   {
      "LunarVim/bigfile.nvim",
      event = { "FileReadPre", "BufReadPre", "BufEnter" }
   },

   -- Highlight color codes with their code #ff00ff
   {
      'norcalli/nvim-colorizer.lua',
      config = function() require('plugins.colorizer') end,
      event = "VimEnter"
   },


   -- Add lualine status bar
   {
      'hoob3rt/lualine.nvim',
      config = function() require('plugins.lualine') end,
      event = "VimEnter"
   },
   --
   -- Copilot
   {
      "github/copilot.vim",
      event = "InsertEnter",
      config = function()
         require("plugins.copilot")
      end,
   },

   -- Show colors in the editor
   {
      'folke/lsp-colors.nvim',
      config = function() require('plugins.lsp-colors') end,
      event = "BufEnter"
   },

   -- Markdown previewer
   {
      'iamcco/markdown-preview.nvim',
      lazy = false,
      build = function() vim.fn["mkdp#util#install"]() end
   },

   -- Highlights for
   -- TODO: test
   -- FIX: test
   -- HACK: test
   -- WARN: test
   {
      'folke/todo-comments.nvim',
      config = function() require('todo-comments').setup() end,
      event = "BufEnter"
   },

   -- Code snipet images
   {
      'narutoxy/silicon.lua',
      config = function() require('plugins.silicon') end,
   },

   -- File tree
   {
      'nvim-neo-tree/neo-tree.nvim',
      branch = "v2.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "kyazdani42/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
      },
      lazy = false,
      config = function() require('plugins.neo-tree') end,
   },

   -- Fuzzy finder for files
   {
      'junegunn/fzf.vim',
      config = function() require('plugins.fzf') end,
      cmd = {
         "Files",
         "GFiles",
         "Rg",
      },
      dependencies = {
         'junegunn/fzf'
      }
   },



   {
      'nvim-telescope/telescope.nvim',
      config = function() require('plugins.telescope') end,
      cmd = "Telescope",
      dependencies = { "telescope-fzf-native.nvim" },
   },
   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },


   -- Errors and diagnostics
   {
      "folke/trouble.nvim",
      config = function() require('plugins.trouble') end,
      cmd = "Trouble"
   },

   -- Navigate between functions, classes, etc.
   {
      'stevearc/aerial.nvim',
      config = function() require('plugins.aerial') end
   },
   {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
         require("plugins.null-ls")
      end,
      dependencies = {
         "neovim/nvim-lspconfig",
      },
      event = "BufEnter"
   },

   -- Syntax plugin
   {
      'nvim-treesitter/nvim-treesitter',
      config = function() require('plugins.treesitter') end,
      event = "BufEnter"
   },
   "nvim-treesitter/nvim-treesitter-context",
   'christoomey/vim-tmux-navigator',

   -- Git blame and gutters
   {
      "lewis6991/gitsigns.nvim",
      event = "BufEnter",
      config = function() require('plugins.gitsigns') end
   },
   "rhysd/conflict-marker.vim",

   -- Git diffs
   'sindrets/diffview.nvim',
   'tpope/vim-sleuth', -- Automatically adjust tab size


   -- Svelte support
   {
      'evanleck/vim-svelte',
      ft = "svelte"
   },

   -- Add support for typescript
   {
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      ft = { "typescript", "typescriptreact", "typescript.tsx" },
      config = function() require('plugins.ts-utils') end
   },

   -- Autmomatically complete quotes or parens
   {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
   },


   -- LSP + Autocomplete
   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      config = function() require('plugins.lsp') end,
      dependencies = {
         -- LSP Support
         { 'neovim/nvim-lspconfig' },             -- Required
         { 'williamboman/mason.nvim' },           -- Optional
         { 'williamboman/mason-lspconfig.nvim' }, -- Optional
         -- Autocompletion
         { 'hrsh7th/nvim-cmp' },                  -- Required
         { 'hrsh7th/cmp-nvim-lsp' },              -- Required
         { 'hrsh7th/cmp-buffer' },                -- Optional
         { 'hrsh7th/cmp-path' },                  -- Optional
         { 'saadparwaiz1/cmp_luasnip' },          -- Optional
         { 'hrsh7th/cmp-nvim-lua' },              -- Optional

         -- Snippets
         { 'L3MON4D3/LuaSnip' },             -- Required
         { 'rafamadriz/friendly-snippets' }, -- Optional

         { 'simrat39/rust-tools.nvim' }
      }
   },

})
