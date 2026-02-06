return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "ruby",
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "json",
          "lua",
          "yaml",
          "jinja",
          "python",
          "go",
          "terraform",
          "hcl",
          "dockerfile",
          "markdown",
          "toml",
          "vim",
          "vimdoc",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,  -- use vim regex as fallback
          disable = function(lang, buf)
            if lang == "yaml" then
              return true  -- disable treesitter yaml, use vim regex instead
            end
          end,
        },
        indent = { enable = false },
      })
      
      -- Configure jinja parsing
      vim.treesitter.language.register('jinja', 'jinja2')
      vim.treesitter.language.register('jinja', 'jinja')
    end
  }
}
