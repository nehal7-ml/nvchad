local M = {}
function M.stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

return M
