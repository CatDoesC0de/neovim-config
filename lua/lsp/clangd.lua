-- Create an autocmd group (so you can clear/reload it cleanly)
local lsp_map_group = vim.api.nvim_create_augroup("UserLspMaps", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_map_group,
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- optionally, you could check client.server_capabilities to only map capabilities that exist
    
    -- set omnifunc (so <c-x><c-o> works)
    vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
    vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", { buf = bufnr })
    
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.lsp.enable("clangd")
