return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      -- follow 'background', which nvim updates from the terminal's light/dark theme
      variant = "auto",
      dark_variant = "main",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
