-- nvim-tree config and keybindings

require("nvim-tree").setup({
  disable_netrw = true,
  view = {
    adaptive_size = true,
    float = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

function nnoremap(rhs, lhs, desc)
    local bufopts = { noremap=true, silent=true, desc=desc }
    vim.keymap.set("n", rhs, lhs, bufopts)
end

nnoremap("<leader>nn", "<cmd>NvimTreeToggle<cr>", "Open file browser")
nnoremap("<leader>nf", "<cmd>NvimTreeFindFile<cr>", "Find in file browser")
