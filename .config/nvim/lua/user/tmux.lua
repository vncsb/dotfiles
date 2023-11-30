local M = {
	"aserowy/tmux.nvim",
	commit = "ea67d59721eb7e12144ce2963452e869bfd60526",
  event = "BufEnter"
}

function M.config()
	require("tmux").setup()
end

return M
