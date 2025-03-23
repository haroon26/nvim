return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "-" },
        topdelete    = { text = "‾" },
        changedelete = { text = "^" },
        untracked    = { text = "?" },
      },
      signs_staged = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "-" },
        topdelete    = { text = "‾" },
        changedelete = { text = "^" },
        untracked    = { text = "?" },
      },
    })

    gitsigns = require("gitsigns")
    vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
    vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
    vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
    vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline)
    vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer)
    vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer)

    vim.keymap.set("v", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)

    vim.keymap.set("v", "<leader>hr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
  end,
}

