local M = {
	"aserowy/tmux.nvim",
  event = "BufEnter"
}

function M.config()
	require("tmux").setup()
end

return M
