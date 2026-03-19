return {
{
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
        -- vim.keymap.set('n', '<leader>xx', builtin.quickfix, { desc = 'LSP?' })
        vim.keymap.set('n', '<leader>x', builtin.builtin, { desc = 'LSP?' })
        -- vim.keymap.set('n', '<leader>ca', builtin.lsp_code_actions, { desc = 'LSP?' })
        require("telescope").setup {
            defaults = {
              mappings = {
                i = {
                  ["<C-j>"] = require("telescope.actions").move_selection_next,
                  ["<C-k>"] = require("telescope.actions").move_selection_previous
                },
                n = {
                  ["<C-j>"] = require("telescope.actions").move_selection_next,
                  ["<C-k>"] = require("telescope.actions").move_selection_previous
                }
              },
          }
      }
    end
}
}

