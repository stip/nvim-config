return {
  'ThePrimeagen/git-worktree.nvim',
  config = function()
    require('telescope').load_extension 'git_worktree'
  end,
  vim.keymap.set('n', '<leader>wl', "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { silent = true }),
  vim.keymap.set('n', '<leader>wc', "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", { silent = true }),
}
