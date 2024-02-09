return {
  dir = 'E:/dev/projects/yvytive.nvim',
  name = 'yvytive',
  -- Optional dependency
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    local yvytiveDev = require('yvytive.dev')
    local yvytive = require('yvytive')
    yvytive.setup({
      PAT = "",
      baseURL = "",
      prefix = "[Talentos] - "
    })
    local wk = require('which-key')
    wk.register({
      a = {
        name = "yvytive",
        r = { yvytiveDev.reload, "Refresh" },
        b = { yvytive.abrirBoard, "Abrir board" }
      }
    }, { prefix = "<leader>" })
  end,
}
