local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPre",
}

M.opts = {
	indent = {
		char = "▏",
	},
	scope = {
		enabled = true,
	},
	exclude = {
		buftypes = { "terminal", "nofile" },
		filetypes = { "help", "packer", "NvimTree" },
	},
}

return M
