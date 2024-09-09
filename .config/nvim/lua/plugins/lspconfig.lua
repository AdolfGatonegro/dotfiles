return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup()
		end
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.typst_lsp.setup{
				capabilities = capabilities,
				exportPdf = "onSave"
			}

			lspconfig.lua_ls.setup{
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			}

			lspconfig.ltex.setup{
				capabilities = capabilities,
				filetypes = {
					"latex",
					--
					-- TODO: ltex gets horribly confused by typst, disable for now
					--
					-- "typst",
					-- "typ",
					"bib",
					"markdown",
					"plaintex",
					"tex"
				},
				settings = {
					ltex = {
						language = "en-GB",
						enabled = {
							"latex",
							--
							-- TODO: ltex gets horribly confused by typst, disable for now
							--
							-- "typst",
							-- "typ",
							"bib",
							"markdown",
							"plaintex",
							"tex"
						},
					}
				}
			}
		end
	}
}
