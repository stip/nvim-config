return {
  lazy = false,
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
  },
  config = function()
    require('octo').setup {
      suppress_missing_scope = {
        projects_v2 = true,
      },
      enable_builtin = true,
    }
    vim.cmd [[hi OctoEditable guibg=none]]
  end,
}
