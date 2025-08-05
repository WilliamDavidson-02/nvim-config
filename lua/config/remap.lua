vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "<S-Enter>", "<Esc>O", { noremap = true })
vim.keymap.set("i", "<C-Enter>", "<Esc>o", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ec", function()
    local diag = vim.diagnostic.get()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- Filter diagnostics for the current line
    for _, d in ipairs(diag) do
        if d.lnum + 1 == current_line then
            vim.fn.setreg("+", d.message) -- Copy to system clipboard
            vim.notify("Copied diagnostic: " .. d.message)
            return
        end
    end

    vim.notify("No diagnostic message found on this line", vim.log.levels.WARN)
end, { desc = "Copy diagnostic message to clipboard" })
