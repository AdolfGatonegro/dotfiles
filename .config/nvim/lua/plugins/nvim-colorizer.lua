return {
	'NvChad/nvim-colorizer.lua',

	config = function ()
		require('colorizer').setup({
			filetypes = {
				"!markdown",
				"!md",
				"!text",
				"!typst",
			}
		})
	end,
}

