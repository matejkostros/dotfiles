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

-- Text transformation commands
local function trim_leading(text)
  return text:gsub("^%s+", "")
end

local function trim_trailing(text)
  return text:gsub("%s+$", "")
end

local function trim_all(text)
  return text:gsub("^%s+", ""):gsub("%s+$", "")
end

local function collapse_spaces(text)
  return text:gsub("%s+", " ")
end

local function to_uppercase(text)
  return text:upper()
end

local function to_lowercase(text)
  return text:lower()
end

local function toggle_quotes(text)
  if text:find('^"') then
    return text:gsub('"', "'")
  else
    return text:gsub("'", '"')
  end
end

local function base64_encode(text)
  local result = vim.fn.system({"base64"}, text)
  return result:gsub("\n", "")
end

local function base64_decode(text)
  local result = vim.fn.system({"base64", "-d"}, text)
  return result:gsub("\n", "")
end

-- Helper function to apply operation to range
local function apply_operation(func)
  return function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    if vim.fn.visualmode() ~= "" then
      local lines = vim.fn.getline(start_line, end_line)
      if type(lines) == "string" then lines = {lines} end

      for i, line in ipairs(lines) do
        lines[i] = func(line)
      end

      vim.fn.setline(start_line, lines)
    else
      local line = vim.fn.getline(".")
      local new_line = func(line)
      vim.fn.setline(".", new_line)
    end
  end
end

-- Create user commands
vim.api.nvim_create_user_command('TrimLeading', apply_operation(trim_leading), {})
vim.api.nvim_create_user_command('TrimTrailing', apply_operation(trim_trailing), {})
vim.api.nvim_create_user_command('TrimAll', apply_operation(trim_all), {})
vim.api.nvim_create_user_command('CollapseSpaces', apply_operation(collapse_spaces), {})
vim.api.nvim_create_user_command('ToUpperCase', apply_operation(to_uppercase), {})
vim.api.nvim_create_user_command('ToLowerCase', apply_operation(to_lowercase), {})
vim.api.nvim_create_user_command('ToggleQuotes', apply_operation(toggle_quotes), {})
vim.api.nvim_create_user_command('Base64Encode', apply_operation(base64_encode), {})
vim.api.nvim_create_user_command('Base64Decode', apply_operation(base64_decode), {})

-- Keymaps for normal and visual mode
vim.keymap.set('n', '<leader>tl', ':TrimLeading<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tt', ':TrimTrailing<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ta', ':TrimAll<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cs', ':CollapseSpaces<CR>', { noremap = true })
vim.keymap.set('n', '<leader>uc', ':ToUpperCase<CR>', { noremap = true })
vim.keymap.set('n', '<leader>lc', ':ToLowerCase<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tq', ':ToggleQuotes<CR>', { noremap = true })
vim.keymap.set('n', '<leader>b64e', ':Base64Encode<CR>', { noremap = true })
vim.keymap.set('n', '<leader>b64d', ':Base64Decode<CR>', { noremap = true })

vim.keymap.set('v', '<leader>tl', ':TrimLeading<CR>', { noremap = true })
vim.keymap.set('v', '<leader>tt', ':TrimTrailing<CR>', { noremap = true })
vim.keymap.set('v', '<leader>ta', ':TrimAll<CR>', { noremap = true })
vim.keymap.set('v', '<leader>cs', ':CollapseSpaces<CR>', { noremap = true })
vim.keymap.set('v', '<leader>uc', ':ToUpperCase<CR>', { noremap = true })
vim.keymap.set('v', '<leader>lc', ':ToLowerCase<CR>', { noremap = true })
vim.keymap.set('v', '<leader>tq', ':ToggleQuotes<CR>', { noremap = true })
vim.keymap.set('v', '<leader>b64e', ':Base64Encode<CR>', { noremap = true })
vim.keymap.set('v', '<leader>b64d', ':Base64Decode<CR>', { noremap = true })