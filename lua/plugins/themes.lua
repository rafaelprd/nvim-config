return {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    --config = function()
    --  vim.cmd.colorscheme 'onedark'
    --end,
  },

  {
    'neanias/everforest-nvim',
    priority = 1001,
    lazy = false,
    --config = function()
    --  vim.cmd.colorscheme 'everforest'
    --end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1002,
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },

  { 'rebelot/kanagawa.nvim' },

  {
    'zaldih/themery.nvim',
    config = function()
      require('themery').setup(
        {
          themes = { "onedark", "kanagawa", "everforest", "gruvbox" }, -- Your list of installed colorschemes
          themeConfigFile = "./lua/settings/theme.lua",
          livePreview = true,                                    -- Apply theme while browsing. Default to true.
        })
    end
  }
}
