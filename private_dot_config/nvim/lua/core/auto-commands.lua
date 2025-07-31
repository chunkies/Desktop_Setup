vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "BufLeave", "InsertEnter" }, {
	callback = function()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local config = vim.api.nvim_win_get_config(win)
			if config.zindex and config.external then
				vim.api.nvim_win_close(win, true)
			end
		end
	end,
})
-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})

-- Stop all active LSP clients to avoid "Job still running"
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		for _, client in pairs(vim.lsp.get_active_clients()) do
			client.stop()
		end
	end,
})
