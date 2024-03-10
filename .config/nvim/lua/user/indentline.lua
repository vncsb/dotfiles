local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	commit = "12e92044d313c54c438bd786d11684c88f6f78cd",
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
