-- ========================================================================== --
-- 1. NATIVE EDITOR OPTIONS
-- ========================================================================== --
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.python3_host_prog = '/usr/bin/pynvim-python'

local opt = vim.opt
opt.number = true              -- Show absolute line numbers
opt.relativenumber = true      -- Show relative line numbers
opt.tabstop = 4                -- 4 spaces per tab character
opt.shiftwidth = 4             -- 4 spaces per indentation level
opt.expandtab = true           -- Convert tabs to spaces automatically
opt.smartindent = true         -- Smart auto-indenting for code
opt.wrap = false               -- Disable text wrapping
opt.ignorecase = true          -- Ignore case in search patterns
opt.smartcase = true           -- Override ignorecase if search has capitals
opt.cursorline = true          -- Highlight the current line screen line
opt.termguicolors = true       -- Enable 24-bit RGB colors
opt.scrolloff = 8              -- Keep 8 lines visible above/below cursor
opt.clipboard = "unnamedplus"  -- Use system clipboard for copy/paste
opt.undofile = true            -- Save undo history to disk across sessions
opt.signcolumn = "yes:2"  -- Reserve space for up to 2 signs side-by-side
vim.cmd([[set statuscolumn=%s%=%l\ \ ]])



-- ========================================================================== --
-- 2. CORE KEYMAPS
-- ========================================================================== --
local map = vim.keymap.set

-- Clear search highlights on pressing Escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Quick window navigation using Ctrl + hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Same window navigation, but from inside terminal-mode (e.g. the REPL)
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Escape terminal-mode without the <C-\><C-n> chord
map("t", "<Esc>", "<C-\\><C-n>")

-- Open a Python REPL in a vertical split (shell-backed, so it survives exits)
map("n", "<leader>rp", function()
  vim.cmd("vsplit | terminal")
  vim.cmd("startinsert")
  vim.api.nvim_chan_send(vim.b.terminal_job_id, "python3\n")
end, { desc = "Open Python REPL split" })

-- Run the current file in a vertical split (shell-backed, so up-arrow/history work)
map("n", "<leader>rr", function()
  local filepath = vim.fn.expand("%:p")  -- capture BEFORE switching buffers
  vim.cmd("write")
  vim.cmd("vsplit | terminal")
  vim.cmd("startinsert")
  vim.api.nvim_chan_send(vim.b.terminal_job_id, "python3 " .. filepath .. "\n")
end, { desc = "Run current file in shell REPL split" })

-- Better indenting behavior in visual mode (keeps selection active)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selected lines up and down easily
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- ========================================================================== --
-- 3. NATIVE LSP HOOKS (v0.12 Standards)
-- ========================================================================== --
-- Automatically format code on save using Neovim's built-in LSP system
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- ========================================================================== --
-- 4. TERMINAL THEME MATCHING (Kitty Sync)
-- ========================================================================== --
-- Strips Neovim's default background layers so it seamlessly inherits Kitty's theme
local groups = {
  "Normal",       -- Main editor background
  "NormalNC",     -- Non-current window backgrounds
  "LineNr",       -- Line numbers column
  "SignColumn",   -- Git/LSP sign columns
  "StatusLine",   -- Status line background
  "EndOfBuffer",  -- Tilde (~) lines at the end of files
}

for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end

-- ========================================================================== --
-- 5. PLUGINS (native vim.pack)
-- ========================================================================== --
vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

-- Auto-pairs
require("nvim-autopairs").setup({})

-- Completion popup
require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  completion = { documentation = { auto_show = true } },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- Mason: manages installed LSPs/linters/formatters
require("mason").setup()

-- Python LSP, wired to advertise blink.cmp's capabilities
vim.lsp.config.pyright = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}
vim.lsp.enable("pyright")

vim.lsp.config.ruff = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}
vim.lsp.enable("ruff")
