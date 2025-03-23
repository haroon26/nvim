return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "ruby_lsp", "rubocop", "lua_ls" }, -- Install ruby_lsp and rubocop via Mason
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig    = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local signs = {
        Error = '✘ ',
        Warn = '󰀪 ',
        Hint = '󰋽 ',
        Info = '󰌶 ',
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = {
          prefix = "■", -- Square or another symbol before the message
          spacing = 2,  -- Space between code and diagnostic
        },
        signs = true,      -- Show signs in the gutter
        underline = true,  -- Underline the offending code
        severity_sort = true, -- Show errors first
      })

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            }
          },
        },
      }

      lspconfig.ruby_lsp.setup {
        capabilities = capabilities,
        filetypes = { "ruby" }, -- Ensure it applies to Ruby files
        root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
      }

      lspconfig.rubocop.setup {
        capabilities = capabilities,
        filetypes = { "ruby" },
        root_dir = require("lspconfig.util").root_pattern(".rubocop.yml", "Gemfile", ".git"),
      }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<C-A-j>", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, {})

      -- Configure nvim-cmp for autocompletion
      local cmp = require("cmp")
      cmp.setup {
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion manually
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
          ["<Tab>"] = cmp.mapping.select_next_item(), -- Navigate suggestions
          ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Navigate suggestions
        },
        sources = {
          { name = "nvim_lsp" }, -- Use LSP (ruby_lsp) as the source for completions
        },
      }
    end,
  },
}

