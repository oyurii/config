vim.diagnostic.config({
  underline = true,
  virtual_text = {
    spacing = 5,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  update_in_insert = true,
})
