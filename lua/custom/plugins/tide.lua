return {
  'jackMort/tide.nvim',
  config = function()
    require('tide').setup {}
  end,
  requires = {
    'MunifTanjim/nui.nvim',
    'nvim-tree/vim-dev-icons',
  },
}
