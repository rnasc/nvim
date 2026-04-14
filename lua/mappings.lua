require "nvchad.mappings"
require("nvchad.tabufline").next()

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n","<leader>gd", vim.lsp.buf.definition, {desc="LSP Go to definition"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- General – INSERT mode
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })

map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })


-- 🧠 General – NORMAL mode
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

map("n", "<leader>w", "<cmd>set wrap<CR>", { desc = "Wrap ON" })
map("n", "<leader>nw", "<cmd>set nowrap<CR>", { desc = "Wrap OFF" })


-- ⚠️ Expr mappings (important fix)
map("n", "j", function()
  return vim.v.count ~= 0 or vim.fn.mode():sub(1,1) == "n" and "j" or "gj"
end, { expr = true, desc = "Move down" })

map("n", "k", function()
  return vim.v.count ~= 0 or vim.fn.mode():sub(1,1) == "n" and "k" or "gk"
end, { expr = true, desc = "Move up" })

map("n", "<Down>", function()
  return vim.v.count ~= 0 and "j" or "gj"
end, { expr = true, desc = "Move down" })

map("n", "<Up>", function()
  return vim.v.count ~= 0 and "k" or "gk"
end, { expr = true, desc = "Move up" })


-- 🧠 Buffers / miscellaneous
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Mapping cheatsheet" })



-- 🧠 LSP + DAP
map("n", "<leader>fm", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "LSP formatting" })

map("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP Breakpoint" })

map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "DAP Continue" })

-- 🧠 Terminal
map("t", "<C-x>", [[<C-\><C-n>]], { desc = "Escape terminal mode" })

-- 🧠 Visual
map("v", "<Up>", "gk", { desc = "Move up" })
map("v", "<Down>", "gj", { desc = "Move down" })

map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-- 🧠 Visual block (x)
map("x", "j", "gj", { desc = "Move down" })
map("x", "k", "gk", { desc = "Move up" })

map("x", "p", function()
  vim.cmd('normal! "0p')
end, { desc = "Dont copy replaced text" })


-- 🔌 Plugin mappings
map("n", "<tab>", function()
  vim.cmd("bnext")
  -- require("nvchad.tabufline").tabuflineNext()
end, { desc = "Goto next buffer" })

map("n", "<S-tab>", function()
  vim.cmd("bprevious")
  -- require("nvchad.tabufline").tabuflinePrev()
end, { desc = "Goto prev buffer" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })


-- Comments
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })


-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus nvimtree" })


-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search in files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })


-- NvTerm
map("n", "<A-i>", function()
  require("nvterm.terminal").toggle("float")
end, { desc = "Toggle floating term" })


-- Gitsigns
map("n", "]c", function()
  if vim.wo.diff then return "]c" end
  require("gitsigns").next_hunk()
end, { expr = true, desc = "Next hunk" })

map("n", "[c", function()
  if vim.wo.diff then return "[c" end
  require("gitsigns").prev_hunk()
end, { expr = true, desc = "Prev hunk" })



