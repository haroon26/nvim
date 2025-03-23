return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
              ["<C-n>"] = false, -- Disable default move down
              ["<C-p>"] = false, -- Disable default move up
            }
          }
        }
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
      vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "List previously opened files" })
    end,
}

