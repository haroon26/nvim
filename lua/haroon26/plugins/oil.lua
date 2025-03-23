return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("oil").setup({
      delete_to_trash = true,
      view_options = {
        show_hidden = true
      },
      keymaps = {
        ["<BS>"] = { "actions.parent", mode = "n" },
        ["-"] = false
      },
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "_", "<CMD>Oil --float<CR>", { desc = "Open floating parent directory" })
  end,
}

