require("ugaterm").setup({
  ---@type string The terminal buffer name prefix.
  prefix = "terminal://",
  ---@type string The filetype for a terminal buffer.
  filetype = "ugaterm",
  ---@type string|function The command/function to open a teminal window.
  open_cmd = "botright 15sp",
  -- Example of opening in a floating window.
  --
  -- open_cmd = function()
  --   local height = vim.api.nvim_get_option("lines")
  --   local width = vim.api.nvim_get_option("columns")
  --   vim.api.nvim_open_win(0, true, {
  --     relative = "editor",
  --     row = math.floor(height * 0.1),
  --     col = math.floor(width * 0.1),
  --     height = math.floor(height * 0.8),
  --     width = math.floor(width * 0.8),
  --   })
  -- end,
})