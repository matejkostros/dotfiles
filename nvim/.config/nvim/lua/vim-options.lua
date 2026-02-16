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

-- Yank commands
local function yank_relative_path()
  local file = vim.fn.expand("%:p")
  local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
  local path
  if vim.v.shell_error == 0 then
    path = file:gsub("^" .. vim.pesc(git_root) .. "/", "")
  else
    path = file
  end
  vim.fn.setreg("+", path)
  vim.notify("Yanked: " .. path)
end

local function yank_filename()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg("+", filename)
  vim.notify("Yanked: " .. filename)
end

local function yank_absolute_path()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Yanked: " .. path)
end

local function yank_branch()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")
  if vim.v.shell_error == 0 then
    vim.fn.setreg("+", branch)
    vim.notify("Yanked: " .. branch)
  else
    vim.notify("Not in a git repository")
  end
end

local function yank_commit_hash()
  local hash = vim.fn.system("git rev-parse --short HEAD 2>/dev/null"):gsub("\n", "")
  if vim.v.shell_error == 0 then
    vim.fn.setreg("+", hash)
    vim.notify("Yanked: " .. hash)
  else
    vim.notify("Not in a git repository")
  end
end

local function yank_git_remote()
  local remote = vim.fn.system("git config --get remote.origin.url 2>/dev/null"):gsub("\n", "")
  if vim.v.shell_error == 0 then
    vim.fn.setreg("+", remote)
    vim.notify("Yanked: " .. remote)
  else
    vim.notify("No git remote found")
  end
end

local function yank_line_number()
  local line = vim.fn.line(".")
  vim.fn.setreg("+", tostring(line))
  vim.notify("Yanked: " .. line)
end

local function yank_error_message()
  local diagnostics = vim.diagnostic.get(0, {})
  if #diagnostics > 0 then
    local error = diagnostics[1]
    vim.fn.setreg("+", error.message)
    vim.notify("Yanked: " .. error.message)
  else
    vim.notify("No diagnostics found")
  end
end

local function yank_hunk()
  -- Uses gitsigns if available, otherwise fallback message
  if package.loaded["gitsigns"] then
    local hunk = vim.fn.system("git diff -U0 HEAD -- " .. vim.fn.expand("%") .. " 2>/dev/null | grep -A 999 '^@@' | head -1"):gsub("\n", "")
    if hunk ~= "" then
      vim.fn.setreg("+", hunk)
      vim.notify("Yanked hunk info")
    else
      vim.notify("No git hunk found")
    end
  else
    vim.notify("Gitsigns not loaded")
  end
end

-- Create user commands for yank operations
vim.api.nvim_create_user_command('YankRelativePath', yank_relative_path, {})
vim.api.nvim_create_user_command('YankFilename', yank_filename, {})
vim.api.nvim_create_user_command('YankAbsolutePath', yank_absolute_path, {})
vim.api.nvim_create_user_command('YankBranch', yank_branch, {})
vim.api.nvim_create_user_command('YankCommitHash', yank_commit_hash, {})
vim.api.nvim_create_user_command('YankGitRemote', yank_git_remote, {})
vim.api.nvim_create_user_command('YankLineNumber', yank_line_number, {})
vim.api.nvim_create_user_command('YankErrorMessage', yank_error_message, {})
vim.api.nvim_create_user_command('YankHunk', yank_hunk, {})

-- Keymaps for yank operations
vim.keymap.set('n', '<leader>yr', ':YankRelativePath<CR>', { noremap = true })
vim.keymap.set('n', '<leader>yf', ':YankFilename<CR>', { noremap = true })
vim.keymap.set('n', '<leader>yp', ':YankAbsolutePath<CR>', { noremap = true })
vim.keymap.set('n', '<leader>yb', ':YankBranch<CR>', { noremap = true })
vim.keymap.set('n', '<leader>yc', ':YankCommitHash<CR>', { noremap = true })
vim.keymap.set('n', '<leader>yg', ':YankGitRemote<CR>', { noremap = true })
vim.keymap.set('n', '<leader>yl', ':YankLineNumber<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ye', ':YankErrorMessage<CR>', { noremap = true })
vim.keymap.set('n', '<leader>yh', ':YankHunk<CR>', { noremap = true })