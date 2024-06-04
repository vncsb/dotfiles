local M = {
  "nvim-neorg/neorg",
  event = "VeryLazy",
  commit = "b451a10011664af91b2b890b6dae61b5f02b91e3",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      commit = "1db9093915eb16ba2473cfb8d343ace5ee04130a",
      priority = 1000,
      config = true,
    },
  },
}

function M.config()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            general = "~/notes/general",
            reports = "~/notes/reports"
          },
          default_workspace = "general",
        },
      },
    },
  })
end

return M
