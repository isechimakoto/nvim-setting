local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.load_extension('projects')
telescope.load_extension('harpoon')
telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    live_grep = {
      only_sort_text = true,
      theme = "dropdown",
    },
    grep_string = {
      only_sort_text = true,
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        }
      },
    },
    git_files = {
      theme = "dropdown",
      hidden = true,
      show_untracked = true,
    },
    lsp_refereneces = {
      theme = "dropdown",
    },
    lsp_definitions = {
      theme = "dropdown",
    },
    lsp_declarations = {
      theme = "dropdown",
    },
    lsp_implementations = {
      theme = "dropdown",
    },
    lsp_document_symbols = {
      theme = "dropdown",
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
      winblend = 10,
      previewer = false,
    }
  },
  extentions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>st', builtin.live_grep)
vim.keymap.set('n', '<leader>bf', builtin.buffers)
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lS', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>gf', builtin.git_status, {})
vim.keymap.set('n', '<leader>P', function()
  vim.cmd('Telescope projects')
end)
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
