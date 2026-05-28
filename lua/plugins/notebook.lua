return {
  -- IMAGE RENDERING
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      balanced_margin = false,
      editor_only_render_when_focused = false,
      window_overlap_clear_enabled = true,
      integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown" }, 
          },
      },
          max_height_window_percentage = math.huge,
          max_width_window_percentage = math.huge,
        },
      },

  -- CODE RUNNER
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_auto_open_output = true
      vim.g.molten_output_win_border = "rounded"
      vim.g.molten_output_win_max_height = math.huge
      vim.g.molten_output_win_max_width = math.huge
      vim.g.molten_output_win_cover_iterline = false
      vim.g.molten_layout = "split" 
      vim.g.molten_virt_text_output = false
    end,
    config = function()
      vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize Kernel" })
      vim.keymap.set("n", "<leader>ms", ":MoltenShowOutput<CR>", { desc = "Show output" })
      vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>")

      vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Hide output" })
      vim.keymap.set("n", "<leader>mc", ":MoltenDelete<CR>", { desc = "Delete output" })
      vim.keymap.set("n", "<leader>re", ":MoltenEvaluateOperator<CR>", { desc = "Run operator" })
      vim.keymap.set("v", "<leader>re", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Run visual" })
    end,
  },

  -- INTERFACE
  {
    "goerz/jupytext.vim",
    init = function()
        -- Force the filetype to markdown so Quarto/Molten "see" it correctly
        vim.g.jupytext_filetype_map = { ipynb = "markdown" }
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    opts = {
      anti_conceal = {
        enabled = false, -- This ensures the LaTeX stays rendered even when your cursor is on the line
      },
      latex = {
        enabled = true,
        converter = '/home/jsesate/miniconda3/bin/latex2text', },
      highlight = 'RenderMarkdownMath',
            top_pad = 0,
            bottom_pad = 0,
      file_types = { 'markdown', 'quarto', 'ipynb' },
    },
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = { "jmbuhr/otter.nvim", "nvim-treesitter/nvim-treesitter" },
    config = function()
      local runner = require("quarto.runner")
      vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell" })
      vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above" })
      vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells" })

      require("quarto").setup({
        lspFeatures = {
          enabled = true,
          languages = { "r", "python", "julia", "bash" },
          chunks = "curly",
        },
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
        ft_drivers = {
          python = "quarto",
          ipynb = "quarto",
        },
      })
    end,
  },
}
