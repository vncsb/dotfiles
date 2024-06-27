local M = {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  commit = '34732719de123f0d5e859b9e392c9b0e44247ee8',
  build = function() require 'typst-preview'.update() end,
}

return M
