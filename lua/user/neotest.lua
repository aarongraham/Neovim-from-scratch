local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		-- require("neotest-plenary"),
		-- require("neotest-vim-test")({
		-- 	ignore_file_types = { "python", "vim", "lua", "js" },
		-- }),
		require("neotest-jest")({
			jestCommand = "npm test --",
		}),
	},
})
