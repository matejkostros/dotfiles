vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.fixeol = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable system clipboard
vim.opt.clipboard = "unnamedplus"

-- Show and color whitespace characters
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:█,nbsp:◇,extends:»,precedes:«'

-- Set whitespace color after colorscheme is loaded to prevent overrides
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#eba0ac' }) -- Catppuccin Maroon
  end,
})

-- Detect Jinja2 templates in kube files
vim.filetype.add({
  pattern = {
    ['.*/kube/environment/.*%.yml'] = 'yaml.jinja',
    ['.*/kube/templates/.*%.yml'] = 'yaml.jinja',
    ['.*/kube/templates/.*%.yaml'] = 'yaml.jinja',
  }
})

-- Enable treesitter for yaml.jinja filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.jinja",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf, 'yaml')
  end,
})

vim.opt.guicursor = "n-v-c:block,i:block"

-- Move by display lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.opt.linebreak = true