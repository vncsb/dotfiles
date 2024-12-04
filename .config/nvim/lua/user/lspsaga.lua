local M = {
	"nvimdev/lspsaga.nvim",
	commit = "f0b5d2ce3912a9d84fae8083cb9cab90def39f3e",
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
