local M = {
	"nvimdev/lspsaga.nvim",
	commit = "2198c07124bef27ef81335be511c8abfd75db933",
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
