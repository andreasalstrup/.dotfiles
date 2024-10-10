function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "Style", {italic = false})
	--vim.api.nvim_set_hl(0, "Comment", {italic = true})
	--vim.api.nvim_set_hl(0, "Keyword", {italic = false})
	--vim.api.nvim_set_hl(0, "Function", {italic = false})
	--vim.api.nvim_set_hl(0, "Type", {italic = false})
	--vim.api.nvim_set_hl(0, "Identifier", {italic = false})
end

ColorMyPencils()
