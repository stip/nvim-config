return {
  'lervag/vimtex',
  init = function()
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_compile_latexmk = {
      executable = 'latexmk',
      OPTIONS = {
        '-shell-escape',
        '-xelatex',
        '-fine-line-error',
        'synctex=1',
        '-interactions=nonstopmode',
      },
    }
  end,
}
