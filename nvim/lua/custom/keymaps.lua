local setmap = vim.keymap.set

--------------------------------------------------
-- BASIC MAPS
--------------------------------------------------

setmap("n", "q:", "")

-- Move to window using the <ctrl> hjkl keys
setmap("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
setmap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
setmap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
setmap("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
setmap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
setmap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
setmap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
setmap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
setmap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
setmap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
setmap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
setmap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
setmap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
setmap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
setmap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
setmap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search with <esc>
setmap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Add undo break-points
setmap("i", ",", ",<c-g>u")
setmap("i", ".", ".<c-g>u")
setmap("i", ";", ";<c-g>u")

-- save file
setmap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
setmap("v", "<", "<gv")
setmap("v", ">", ">gv")

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
setmap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
setmap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
setmap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
setmap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
setmap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
setmap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
setmap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- lazygit
setmap("n", "<leader>gg", ":FloatermNew lazygit<CR>", { desc = "Git UI" })

-- quit
setmap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- windows
setmap("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
setmap("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
setmap("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
setmap("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
setmap("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
setmap("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

--------------------------------------------------
-- PLUGIN SPECIFIC
--------------------------------------------------
vim.keymap.set('n', '<leader>e', ":Neotree toggle<CR>")
