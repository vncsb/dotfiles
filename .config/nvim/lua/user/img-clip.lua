local M = {
	"HakonHarnes/img-clip.nvim",
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
