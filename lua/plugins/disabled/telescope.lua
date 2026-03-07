return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        {
            "<leader>f", function()
                if not pcall(require("telescope.builtin").git_files) then
                    require("telescope.builtin").find_files { hidden = true }
                end
            end
        }, 
        { 
            "<leader>b", require("telescope.builtin").buffers 
        }, 
        {
            "<leader>rg", function()
                require("telescope.builtin").live_grep(
                    require("telescope.themes").get_ivy {})
                end
        },
        { "<leader>xx", function() require("telescope.builtin").quickfix() end },
        { "<leader>xd", function() require("telescope.builtin").diagnostics() end },
        { "<leader>T",  function() require("telescope.builtin").builtin() end },
        {
            "<leader>ca",
            function() require("telescope.builtin").lsp_code_actions() end
        }, 
        {
            "<leader>r", function()
                require("telescope.builtin").lsp_references(
                    require("telescope.themes").get_ivy {
                        sorting_strategy = "ascending"
                    })
                end
        }
        },
    config = function()
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
