local M = {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = "VeryLazy",
}

function M.config()
	-- Most used functions
	vim.keymap.set("n", "<leader>nf", "<cmd>Telekasten find_notes<CR>")
	vim.keymap.set("n", "<leader>ng", "<cmd>Telekasten search_notes<CR>")
	vim.keymap.set("n", "<leader>nd", "<cmd>Telekasten goto_today<CR>")
	vim.keymap.set("n", "<leader>nz", "<cmd>Telekasten follow_link<CR>")
	vim.keymap.set("n", "<leader>nn", "<cmd>Telekasten new_note<CR>")
	vim.keymap.set("n", "<leader>nc", "<cmd>Telekasten show_calendar<CR>")
	vim.keymap.set("n", "<leader>nb", "<cmd>Telekasten show_backlinks<CR>")
	vim.keymap.set("n", "<leader>nI", "<cmd>Telekasten insert_img_link<CR>")
  vim.keymap.set("n", "<leader>np", "<cmd>Telekasten paste_img_and_link<CR>")

	-- Call insert link automatically when we start typing a link
	vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

	require("telekasten").setup({
		home = vim.fn.expand("~/notes"),
		image_subdir = "img",
	})
end

return M
