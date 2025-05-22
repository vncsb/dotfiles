local M = {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  build = function() require 'typst-preview'.update() end,
}

return M
