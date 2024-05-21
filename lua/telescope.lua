-- Telescope keybindings

function nnoremap(rhs, lhs, desc)
    local bufopts = { noremap=true, silent=true, desc=desc }
    vim.keymap.set("n", rhs, lhs, bufopts)
end

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>", "Find file")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>", "Grep")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>", "Find buffer")
nnoremap("<leader>fm", "<cmd>Telescope marks<cr>", "Find mark")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>", "Find references (LSP)")
nnoremap("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Find symbols (LSP)")
nnoremap("<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", "Find incoming calls (LSP)")
nnoremap("<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>", "Find outgoing calls (LSP)")
nnoremap("<leader>fi", "<cmd>Telescope lsp_implementations<cr>", "Find implementations (LSP)")
nnoremap("<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>", "Find errors (LSP)")
