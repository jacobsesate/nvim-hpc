-- [[ Clipboard Configuration ]]

-- For help on any setting, you can always type :h 'settingname' in command mode

-- Configures Neovim to sync with the system clipboard.
-- OSC 52 is used here because it allows copying/pasting over SSH/HPC connections 
-- without needing a complex X11 setup or a clipboard manager.
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- [[ Line Numbers & UI ]]
-- number: Shows the absolute line number of the current line.
-- relativenumber: Shows distance from the cursor; makes jumping with '5j' or '10k' easier.
-- Autocommands: Disables relative numbers in Insert mode to make typing less distracting.
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd('InsertEnter', { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd('InsertLeave', { command = [[set relativenumber]] })

-- [[ Indentation & Tabbing ]]
-- tabstop: Number of spaces a tab counts for.
-- expandtab: Converts tabs into spaces.
-- shiftwidth: Number of spaces used for auto-indentation.
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- [[ Text Wrapping & Display ]]
-- linebreak: Prevents lines from wrapping in the middle of a word.
-- breakindent: Keeps the indentation level of wrapped lines for better readability.
-- colorcolumn: Draws a vertical line at 80 characters as a guide for line length.
-- cursorline: Highlights the line where the cursor is currently located.
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true

-- [[ Behavior & Interaction ]]
-- mouse: Enables mouse support for all modes (clicking, scrolling, resizing).
-- showmode: Disabled because the status line (like Lualine) usually handles this.
-- undofile: Saves undo history to a file so it persists even after closing Neovim.
-- confirm: Prompts to save changes before exiting instead of failing.
-- title: Changes the terminal window title to reflect the open file.
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.confirm = true
vim.opt.title = true

-- [[ Search Settings ]]
-- ignorecase: Ignores case when searching.
-- smartcase: If you use a capital letter, it switches back to case-sensitive search.
-- inccommand: Shows a live preview of search and replace in a split window.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- [[ Timing & Windows ]]
-- updatetime: Faster completion and autocommand triggers (100ms).
-- timeoutlen: Time waited for a mapped sequence (like <leader> shortcuts) to complete.
-- splitright/splitbelow: New splits open to the right or below the current one.
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
