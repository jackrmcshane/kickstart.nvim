-- Highlight, edit, and navigate code.
return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = {
					-- Avoid the sticky context from growing a lot.
					max_lines = 3,
					-- Match the context lines to the source code.
					multiline_threshold = 1,
					-- Disable it when the window is too small.
					min_window_height = 20,
				},
				keys = {
					{
						"[c",
						function()
							-- Jump to previous change when in diffview.
							if vim.wo.diff then
								return "[c"
							else
								vim.schedule(function()
									require("treesitter-context").go_to_context()
								end)
								return "<Ignore>"
							end
						end,
						desc = "Jump to upper context",
						expr = true,
					},
				},
			},
		},
		version = false,
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"diff",
				"fish",
				"gitcommit",
				"groovy",
				"html",
				"javascript",
				"json",
				"json5",
				"jsonc",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			indent = { enable = true },
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(_, buf)
					-- Don't disable for read-only buffers.
					if not vim.bo[buf].modifiable then
						return false
					end

					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
					-- Disable for files larger than 250 KB.
					return ok and stats and stats.size > (250 * 1024)
				end,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<cr>",
					node_incremental = "<cr>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["[m"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_next_end = {
						["[M"] = "@function.outer",
						["[C"] = "@class.outer",
					},
					goto_previous_start = {
						["]m"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_previous_end = {
						["]M"] = "@function.outer",
						["]C"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>>"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader><"] = "@parameter.inner",
					},
				},
			},
		},
		config = function(_, opts)
			local toggle_inc_selection_group =
				vim.api.nvim_create_augroup("mariasolos/toggle_inc_selection", { clear = true })
			vim.api.nvim_create_autocmd("CmdwinEnter", {
				desc = "Disable incremental selection when entering the cmdline window",
				group = toggle_inc_selection_group,
				command = "TSBufDisable incremental_selection",
			})
			vim.api.nvim_create_autocmd("CmdwinLeave", {
				desc = "Enable incremental selection when leaving the cmdline window",
				group = toggle_inc_selection_group,
				command = "TSBufEnable incremental_selection",
			})

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
