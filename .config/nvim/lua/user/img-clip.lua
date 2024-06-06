local M = {
	"HakonHarnes/img-clip.nvim",
	commit = "d7ddfd88d50f0b1acd5175448ad159057fe41ab6",
	event = "VeryLazy",
	keys = {
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}

function M.config()
	require("img-clip").setup({
		default = {
			dir_path = "images",
      relative_to_current_file = true,
		},
	})
end

return M
