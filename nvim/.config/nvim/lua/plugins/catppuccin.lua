return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        custom_highlights = function(colors)
          return {
            LineNr = { fg = colors.lavender },
            LineNrAbove = { fg = colors.overlay1 },
            LineNrBelow = { fg = colors.overlay1 },
          }
        end,
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
