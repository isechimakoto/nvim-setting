-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  use { 'kevinhwang91/nvim-bqf', ft = "qf" }
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = "float",
    })
  end }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        exclude_dirs = { "**/node_modules/*" },
      }
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', '<leader>gk', function()
            gs.prev_hunk { navigation_message = false }
          end)
          map('n', '<leader>gj', function()
            gs.next_hunk { navigation_message = false }
          end)
          map('n', '<leader>gl', function()
            gs.blame_line { full = true }
          end)
          map('n', '<leader>gp', gs.preview_hunk)
          map('n', '<leader>gr', gs.reset_hunk)
          map('n', '<leader>gR', gs.reset_buffer)
          map('n', '<leader>gs', gs.stage_hunk)
          map('n', '<leader>gu', gs.undo_stage_hunk)
          map('n', '<leader>gd', gs.diffthis)
        end
      })
    end
  }
  use { "windwp/nvim-ts-autotag" }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use('jose-elias-alvarez/null-ls.nvim')

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  })
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use('blindFS/vim-taskwarrior')
  use('vim-airline/vim-airline')
  use { "gennaro-tedesco/nvim-jqx", ft = { "json", "yaml" }, }
end)
