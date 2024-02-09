--
-- Copiei do Eusyar
--
local path = vim.fn.stdpath("data") .. "/sessions"
local current

local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

return {
  'natecraddock/sessions.nvim',
  config = function()
    local sessions = require("sessions")
   current = find_git_root():match(".*/(.+)")
    sessions.setup({
      events = { "BufEnter", "VimLeavePre" },
      session_filepath = path,
      absolute = true,
    })

    vim.keymap.set("n", "<leader>ol", function()
      vim.ui.input({
          default = current
        },
        function(input)
          current = input
          sessions.load(path .. '/' .. input, nil)
        end
      )
    end, { desc = "Load a session" })


    vim.keymap.set("n", "<leader>os", function()
      vim.ui.input({
          default = current
        },
        function(input)
          current = input
          sessions.save(path .. '/' .. input, nil)
        end
      )
    end, { desc = "Save a session" })
  end
}
