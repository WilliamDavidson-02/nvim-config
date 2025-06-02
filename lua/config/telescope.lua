local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
	builtin.find_files({
		find_command = {
			"rg",
			"--files",
			"--hidden",
			"--glob", "!node_modules/**",
			"--glob", "!.git/**",
		},
	})
end, { desc = 'Telescope find files ignoring node_modules' })

