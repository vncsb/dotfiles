local M = {
	"williamboman/mason.nvim",
	commit = "e2f7f9044ec30067bc11800a9e266664b88cda22",
	cmd = "Mason",
	event = "BufReadPre",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			commit = "25c11854aa25558ee6c03432edfa0df0217324be",
		},
	},
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

function M.config()
	require("mason").setup(settings)
	require("mason-lspconfig").setup({
		ensure_installed = require("utils").servers,
		automatic_installation = true,
	})
end

return M
