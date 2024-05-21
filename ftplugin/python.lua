-- Inspired by https://www.youtube.com/watch?v=4BnVeOUeZxc&t=347s

-- Copied from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
-- export on_attach & capabilities
local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  local map = vim.keymap.set

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  -- map("n", "<leader>ra", function()
  --   require "nvchad.lsp.renamer"()
  -- end, opts "NvRenamer")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")

  -- setup signature popup
  -- if conf.signature and client.server_capabilities.signatureHelpProvider then
  --   require("nvchad.lsp.signature").setup(client, bufnr)
  -- end

end


local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities()  -- alternatively...
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {"python"},
    root_dir = lspconfig.util.root_pattern( "setup.py", "pyproject.toml", "setup.cfg", "requirements.txt", "starter", "src", "sln", ".git" ),
})

-- Start the LSP and attach it to the current buffer Without this line, the LSP
-- doesn't attach to a Python buffer when a filename is given on the command
-- line (https://www.reddit.com/r/neovim/comments/175m02f/filetype_autocmd_doesnt_trigger/)
vim.cmd.LspStart()
