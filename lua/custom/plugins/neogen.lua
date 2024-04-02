return {
  'danymat/neogen',
  lazy = false,
  config = function()
    require('neogen').setup {}
    vim.keymap.set('n', '<leader>df', ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
  end,
  opts = { snippet_engine = 'luasnip' },
}
