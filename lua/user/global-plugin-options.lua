local g = vim.g

-- Ultest --
g.ultest_use_pty = 1
g["test#preserve_screen"] = false
g["test#javascript#jest#options"] = "--reporters jest-vim-reporter"

g["test#elixir#exunit#options"] = "--color"
g["test#elixir#patterns"] = {
	test = '\v^s*test (".+") do',
}

g.dispatch_compilers = { elixir = "exunit" }

-- vim-search-pulse --
g.vim_search_pulse_mode = "pattern"
