-- ========================================================================== --
-- 1. NATIVE EDITOR OPTIONS
-- ========================================================================== --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

