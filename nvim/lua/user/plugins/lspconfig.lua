-- Setup Mason to automatically install LSP servers
require("mason").setup()

-- Null-ls Setup
require("user/plugins/lsp/null-ls")

-- Setup lsp-zero
local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")


require("mason-lspconfig").setup({
	automatic_installation = true, -- Automatically install LSP servers.
	ensure_installed = {
		"cssls",
		"dockerls",
		"html",
		"eslint",
		"emmet_ls",
		"jsonls",
		"lua_ls",
		"prismals",
		"pyright",
		"pylsp",
		-- You may need to install python3-venv to install pylsp
		"tsserver",
		"tailwindcss",
	},
})

require("user/plugins/lsp/html")
-- Use vpn if they don't install for some reason


-- Keymaps
vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

--commands
vim.cmd("autocmd BufWritePost * lua vim.lsp.buf.format()")

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true,
	float = {
		source = true,
	},
})

-- Sign configuration
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- setup lsp_zero
lsp_zero.setup()

-- setup ts-server for all sorts of languages
require("lspconfig").tsserver.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
})
