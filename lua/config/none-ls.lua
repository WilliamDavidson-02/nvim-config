local null_ls = require("null-ls") -- the module is still called 'null-ls'
local formatting = null_ls.builtins.formatting

-- create an autocmd group
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    formatting.prettier.with({
      extra_filetypes = { "svelte", "astro" }, -- optional
      -- extra_args = { "--no-semi", "--single-quote" }, -- optional prettier config
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(format_client)
              return format_client.name == "null-ls"
            end,
          })
        end,
      })
    end
  end,
})

