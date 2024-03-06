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
      prefix = ""
    })
    local wk = require('which-key')
    wk.register({
      a = {
        name = "yvytive",
        r = { yvytiveDev.reload, "Refresh" },
        b = {
          function()
            yvytive.abrirBoard("AZURE_BACKLOGS")
          end,
          "Azure backlogs"
        },
        p = {
          function()
            yvytive.abrirBoard("AZURE_GIT_PR")
          end,
          "Azure git pull requests"
        },
        ['/'] = {
          function()
            yvytive.abrirBoard("AZURE_BACKLOGS_FIND")
          end,
          "Search for Azure workitens"
        }

      }
    }, { prefix = "<leader>" })
  end,
}
