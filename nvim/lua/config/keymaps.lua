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

local launcher = vim.fn.expand("~/harness/omp/launch.sh")

-- run the launcher; surface failures instead of failing silently
local function launch_omp(extra, input)
  local cmd = ("%s --file %s %s 2>&1"):format(
    vim.fn.shellescape(launcher),
    vim.fn.shellescape(vim.fn.expand("%:p")),
    extra or ""
  )
  local out = input and vim.fn.system(cmd, input) or vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    vim.notify(out, vim.log.levels.ERROR)
  end
end

-- normal: pane opens, constraint draft typed in — append a task, press Enter
vim.keymap.set("n", "<leader>a", function()
  launch_omp()
end, { silent = true, desc = "omp: launch agent pane" })

-- visual: selection becomes the task; the agent starts immediately
vim.keymap.set("x", "<leader>a", function()
  local a, b = vim.fn.line("v"), vim.fn.line(".")
  if a > b then
    a, b = b, a
  end
  launch_omp(("--lines %d-%d"):format(a, b), vim.fn.getline(a, b))
end, { silent = true, desc = "omp: launch agent with selection" })

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
