vim.diagnostic.config({
  virtual_text = false, -- show inline messages (you can set to false if you want)
  signs = true,         -- show signs in gutter (where you see E, W)
  underline = true,     -- underline problem code
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always", -- show source name in floating window
    header = "",
    prefix = "",
  },
})


local signs = {
  Error = "❌",
  Warn  = "⚠️",
  Hint  = "💡",
  Info  = "ℹ️",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
