local M = {
	"xiyaowong/transparent.nvim",
	lazy = false,
}

function M.config()
	require("transparent").setup({
		extra_groups = {
			"DiagnosticSignError",
			"DiagnosticSignWarn",
			"DiagnosticSignHint",
			"DiagnosticSignInfo",
		},
	})
end

return M
