-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		-- Colorscheme
		{ "olimorris/onedarkpro.nvim", priority = 1000 },

		-- Fuzzy finder
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

		-- Git
		{ "lewis6991/gitsigns.nvim", opts = {} },

		-- File explorer
		{ "nvim-tree/nvim-tree.lua", opts = {} },
		{ "nvim-tree/nvim-web-devicons", opts = {} }, -- simplified

		-- Statusline (theme matched to onedark)
		{
			"nvim-lualine/lualine.nvim",
			opts = { options = { theme = "onedark" } }, -- fixed: was gruvbox
		},

		-- Open current line/selection in GitHub
		{ "linrongbin16/gitlinker.nvim", config = true },

		-- Quality of life
		{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
		{ "numToStr/Comment.nvim", opts = {} },

    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opt = {}
    },
    {
      "coder/claudecode.nvim",
      dependencies = { "folke/snacks.nvim" },
      opts = {
        terminal_cmd = "~/.claude/local/claude",
      },
      config = true,
    }
	},

	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
	rocks = { enabled = false },
})

-- Colorscheme
vim.cmd("colorscheme onedark")

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Files
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.encoding = "utf-8"

-- Keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>") -- grep word under cursor
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>") -- file explorer toggle
vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<cr>")
vim.keymap.set("i", "jj", "<esc>")

-- Window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- Indentation stay in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- File management
vim.keymap.set("n", "<leader>w", ":up!<cr>")
vim.keymap.set("n", "<leader>v", ":vsplit $VIMRC<cr>")

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>")
vim.keymap.set("n", "<leader>to", ":tabonly<cr>")
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>")

-- 0 jumps to first non-blank
vim.keymap.set("n", "0", "^")

-- Git link (copy URL / open in browser)
vim.keymap.set({ "n", "v" }, "<leader>gy", "<cmd>GitLink<cr>")
vim.keymap.set({ "n", "v" }, "<leader>gY", "<cmd>GitLink!<cr>")

-- Project-wide search & replace (Telescope -> quickfix -> cfdo)
-- Flow: 1) <leader>fg (grep) or <leader>fw (word under cursor) to find.
--       2) In Telescope, <C-q> sends results to the quickfix list
--          (<M-q> sends only the <Tab>-selected entries).
--       3) <leader>cr to replace across every file in the quickfix list.
-- The replace pattern is a normal Vim regex (independent of the rg search).
vim.keymap.set("n", "<leader>cr", function()
	local find = vim.fn.input("Replace in quickfix files > ")
	if find == "" then return end
	local repl = vim.fn.input("With > ")
	find = vim.fn.escape(find, "/")
	repl = vim.fn.escape(repl, "/")
	-- %s over each file; e = ignore "no match", update = save only if changed
	vim.cmd(("cfdo %%s/%s/%s/ge | update"):format(find, repl))
end, { desc = "Replace across quickfix files" })

-- Reload config
vim.keymap.set("n", "<leader>rl", "<cmd>source $MYVIMRC<cr>")

-- Mason UI
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Open Mason" })
