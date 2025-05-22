local M = {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
	},
}

M.config = function()
	require("lspsaga").setup({
    symbol_in_winbar = {
      enable = false
    },
    lightbulb = {
      enable = false
    }
  })
end

return M
