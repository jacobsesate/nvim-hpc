vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd('InsertEnter', { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd('InsertLeave', { command = [[set relativenumber]] })
vim.opt.linebreak = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = ' ', trail = '·' }
vim.opt.inccommand = 'split'
vim.opt.colorcolumn = '80'
vim.opt.confirm = true
vim.opt.title = true

vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#3b3b3b" })

-- Maybe Change
vim.opt.cursorline = false
-- vim.opt.scrolloff = 10
--
--
