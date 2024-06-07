local M = {
	"williamboman/mason.nvim",
	commit = "c43eeb5614a09dc17c03a7fb49de2e05de203924",
	cmd = "Mason",
	event = "BufReadPre",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			commit = "9ae570e206360e47d30b4c35a4550c165f4ea7b7",
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
