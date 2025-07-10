local M = {}


M.theme = require("vinyl.theme").get_theme(nil)


function M.setup(opts)

	M.theme = require("vinyl.theme").get_theme(opts["variant"])

	if opts["overrides"] then
		for k,v in pairs(opts["overrides"]) do
			M.theme[k] = v
		end
	end

end


function M.load()

	vim.cmd("highlight clear")
	vim.cmd("syntax reset")

	vim.g.colors_name = "vinyl"
	vim.opt.termguicolors = true

	for group,hl in pairs(M.theme) do
		vim.api.nvim_set_hl(0,group,hl)
	end

end


return M
