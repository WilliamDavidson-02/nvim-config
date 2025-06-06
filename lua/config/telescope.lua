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

vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep, {})
vim.keymap.set("n", "<leader>fw", function()
  require('telescope.builtin').live_grep({
    default_text = vim.fn.expand("<cword>"),
  })
end, { desc = "Live grep word under cursor" })

