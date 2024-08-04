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
    vim.g.vimtex_view_general_viewer = 'SumatraPDF.exe'
    vim.g.vimtex_view_general_options = '-forward-search @tex @line @pdf -reuse-instance'
  end,
}
