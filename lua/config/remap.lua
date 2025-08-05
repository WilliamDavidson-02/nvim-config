local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", "\"_dp")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

keymap.set("i", "<S-Enter>", "<Esc>O", { noremap = true })
keymap.set("i", "<C-Enter>", "<Esc>o", { noremap = true, silent = true })

keymap.set("n", "<leader>e", vim.diagnostic.open_float)
keymap.set("n", "<leader>ec", function()
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

-- Split window
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-k>", "<C-w>>", { noremap = true })
keymap.set("n", "<C-j>", "<C-w><", {noremap = true})
