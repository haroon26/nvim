require("haroon26.settings")
require("haroon26.maps")
require("haroon26.lazy")

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

