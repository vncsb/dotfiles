local M = {
	"nvimtools/none-ls.nvim",
	event = "BufReadPre",
	commit = "cc0a3c45047e3daf85d07c1571d65476cfce6480",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
	},
}

function M.config()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettier.with({
				extra_filetypes = { "toml" },
				extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			}),
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			formatting.typstyle,
			require("none-ls.diagnostics.ruff"), -- From none-ls-extras
		},
	})
end

return M
