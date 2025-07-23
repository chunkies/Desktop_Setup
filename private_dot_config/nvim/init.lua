if vim.fn.has("nvim") == 1 and vim.fn.executable("nvr") == 1 then
	vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

require("core.keymaps")
require("core.diagnositcs")
require("core.options")
require("core.auto-commands")
require("config.lazy")
