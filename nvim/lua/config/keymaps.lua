-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local map = LazyVim.safe_keymap_set

map(
  "n",
  "<leader>uH",
  "<Cmd>:Hardtime toggle<CR>",
  { desc = "Toggle Hardtime" }
)

map("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

vim.keymap.set(
  "n",
  "<C-d>",
  "<C-d>zz",
  { desc = "Center cursor after moving down half-page" }
)
vim.keymap.set(
  "n",
  "<C-u>",
  "<C-u>zz",
  { desc = "Center cursor after moving up half-page" }
)
vim.keymap.set(
  "n",
  "J",
  "mzJ`z",
  { desc = "Keep cursor in place when using `J`" }
)
vim.keymap.set(
  "n",
  "n",
  "nzzzv",
  { desc = "Center cursor when moving between search terms" }
)
vim.keymap.set(
  "n",
  "N",
  "Nzzzv",
  { desc = "Center cursor when moving between search terms" }
)
