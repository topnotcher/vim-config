return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},

	'github/copilot.vim',
	'ishan9299/nvim-solarized-lua',
	-- 'benekastah/neomake',
	'airblade/vim-gitgutter',
	'dense-analysis/ale',
	'scrooloose/nerdtree',
	'othree/html5.vim',
	'gerw/vim-latex-suite',
	'mileszs/ack.vim',
	'udalov/kotlin-vim',
	-- TODO: do I need these are will ALE handle it?
	-- 'Shougo/deoplete.nvim',
	-- 'deoplete-plugins/deoplete-jedi',
	'leafOfTree/vim-vue-plugin',
	
	{
		'mattn/vim-gist',
		dependencies = { 'mattn/webapi-vim' },
	},

	'tpope/vim-sensible',
	'tpope/vim-surround',
	'tpope/vim-repeat',
	'tpope/vim-commentary',
	'tpope/vim-fugitive',
	'tpope/vim-markdown',
	'tpope/vim-unimpaired',
	'tpope/vim-endwise',

	'neovim/nvim-lspconfig',

	'ervandew/supertab',
	'direnv/direnv.vim',
	{
		'coder/claudecode.nvim',
		dependencies = { 'folke/snacks.nvim' },
		config = true,
		cmd = {
			"ClaudeCode",
			"ClaudeCodeFocus",
			"ClaudeCodeSelectModel",
			"ClaudeCodeAdd",
			"ClaudeCodeSend",
			"ClaudeCodeTreeAdd",
			"ClaudeCodeDiffAccept",
			"ClaudeCodeDiffDeny",
		},
		keys = {
			{ "<leader>a", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
}
