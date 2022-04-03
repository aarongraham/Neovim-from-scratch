vim.cmd([[
try
  colorscheme darcula-solid
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
