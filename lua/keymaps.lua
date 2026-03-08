-- [[ Basic Keymaps ]]
-- Configuration for general editor behavior

-- NOTE: <leader> is set first thing in init.lua 
-- when reading these keybinds, <leader>=' '

-- Clear search highlights: Pressing Escape stops the highlighting of 
-- the last word you searched for using '/' or '?'.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Movement Training: These maps disable the arrow keys in Normal mode 
-- to force the user to learn the standard h, j, k, l navigation keys.
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Split Navigation: Allows switching between tiled windows using Control + h/j/k/l.
-- This replaces the default 'Control-w' prefix with a single chord.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Mode Switching: Use 'jk' or 'kj' in quick succession while typing (Insert mode) 
-- to return to Normal mode without reaching for the Escape key.
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'change to normal mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'change to normal mode' })

-- Clipboard Management: These maps use the "void register" (_). 
-- This allows you to delete or paste over text without overwriting 
-- whatever you currently have copied in your main clipboard.
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Search Centering: After searching for a term, pressing 'n' (next) or 'N' (prev) 
-- will jump to the result and keep that line centered in the middle of the screen.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Search and Replace: Triggers a global search and replace command for the 
-- specific word currently under your cursor.
vim.keymap.set('n', '<leader>w', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- [[ Basic Autocommands ]]
-- Actions triggered automatically by specific editor events

-- Yank Highlight: Briefly flashes a highlight over text when you copy (yank) it, 
-- providing visual confirmation of the action.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Line Wrapping Toggle: A function to turn line wrapping on and off. 
-- When ON, it uses 'linebreak' to ensure words aren't split in the middle.
function ToggleWrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    print 'Wrap: OFF'
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    print 'Wrap: ON'
  end
end

-- Toggle Mapping: Assigns the ToggleWrap function to <leader> + z.
vim.api.nvim_set_keymap('n', '<leader>z', ':lua ToggleWrap()<CR>', { noremap = true, silent = true })
