local M = {
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").handler,
	},
}

return M
