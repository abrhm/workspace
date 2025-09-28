return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
        	"LazyGitCurrentFile",
        	"LazyGitFilter",
        	"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	depedencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
	}
}
