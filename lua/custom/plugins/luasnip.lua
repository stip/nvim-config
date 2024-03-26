local M = {
  'L3MOND4D3/LuaSnip',
  keys = {
    vim.keymap.set('n', '<leader>es', '<cmd>lua require("luasnip.loaders").edit_snippet_files()<CR>'),
  },
}

function M.config()
  local luasnip = require 'luasnip'
  luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
  }

  vim.keymap.set({ 'i', 's' }, '<C-k>', function()
    if luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ 'i', 's' }, '<C-j>', function()
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set({ 'i' }, '<C-l>', function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end, { silent = true })

  vim.keymap.set('n', '<leader><leader>s', '<cmd> source ~/AppData/Local/nvim/lua/custom/plugins/luasnip.lua')
  require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/custom/lua_snippets' }
end

return M
