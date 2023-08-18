-- Space is my leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")

-- Disable annoying command line typo.
vim.keymap.set("n", "q:", ":q")

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("i", ";;", "<Esc>A;")
vim.keymap.set("i", ",,", "<Esc>A,")

-- Quickly clear search highlighting.
vim.keymap.set("n", "<Leader>k", ":nohlsearch<CR>")

-- autosave on buffer change
vim.cmd("autocmd BufHidden * :wa")

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set("n", "<Leader>x", ":!xdg-open %<CR><CR>")

-- save file
vim.keymap.set("n", "<Leader>s", ":w<CR>")

-- Move lines up and down.
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Plugin keybindings
vim.keymap.set("n", "<Leader>q", ":Bdelete<CR>")

-- Git keybindings
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "gs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "gS", ":Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>")

-- Git diff
vim.keymap.set("n", "<Leader>af", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<Leader>ah", ":DiffviewFileHistory<CR>")
vim.keymap.set("n", "<Leader>ax", ":DiffviewClose<CR>")

-- Set up the key mappings
vim.keymap.set("n", "<C-up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-left>", ":vertical resize -2<CR>")
