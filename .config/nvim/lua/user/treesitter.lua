local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "84bdd59c0365944e8914697e508d1c087977ee33",
	event = "BufReadPost",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
			commit = "9c74db656c3d0b1c4392fc89a016b1910539e7c0",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
	},
}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"http",
			"json",
      "yaml",
      "javascript",
      "typescript",
      "go",
      "typst",
      "xml",
      "csv",
      "php",
      "rust",
      "sql"
		}, -- put the language you want in this array
		-- ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },
	})
end

return M
