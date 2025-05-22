local M = {
	"nvimtools/none-ls.nvim",
	event = "BufReadPre",
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
      formatting.isort,
			formatting.stylua,
			formatting.typstyle,
      formatting.gofumpt,
      formatting.goimports_reviser,
      formatting.golines,
			require("none-ls.diagnostics.ruff"), -- From none-ls-extras
		},
	})
end

return M
