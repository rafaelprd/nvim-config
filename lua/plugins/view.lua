return {
  -- Devicons
  'nvim-tree/nvim-web-devicons',
  'ryanoasis/vim-devicons',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        --theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = { { 'filename', path = 4 } }
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 4 } }
      },
    },
  },
  -- Nice, Noise, Notice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  -- {
  --   {
  --     'romgrk/barbar.nvim',
  --     dependencies = {
  --       'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
  --       'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  --     },
  --     init = function() vim.g.barbar_auto_setup = false end,
  --     opts = {
  --       -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
  --       -- animation = true,
  --       -- insert_at_start = true,
  --       -- …etc.
  --     },
  --     version = '^1.0.0', -- optional: only update when a new 1.x version is released
  --     config = function()
  --       require("barbar").setup()
  --     end
  --   },
  -- },
  -- Tabs
  {
    'kdheepak/tabline.nvim',
    config = function()
      require 'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          section_separators = { '', '' },
          component_separators = { '', '' },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false,    -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true,        -- this shows devicons in buffer section
          show_bufnr = false,          -- this appends [bufnr] to buffer section,
          show_filename_only = false,  -- shows base filename only instead of relative path in filename
          modified_icon = "+ ",        -- change the default modified icon
          modified_italic = false,     -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false,      -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd [[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
    end,
    requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
  },
{
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim"
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require('windows').setup()
  end
}
}
