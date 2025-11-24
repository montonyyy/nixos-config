      vim.o.relativenumber = true
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4

      vim.opt.autoindent = true
      vim.opt.smartindent = true

      vim.api.nvim_set_keymap('n', '<F5>', ':!go run %<CR>', { noremap = true, silent = true })

      vim.api.nvim_set_keymap('n', '<F6>', ':!gcc % -o %:r && ./%:r<CR>', { noremap = true, silent = true })

      local lspconfig = require("lspconfig")

      -- C/C++
      lspconfig.clangd.setup{}

      -- Go
      lspconfig.gopls.setup{}

      -- Java
      lspconfig.jdtls.setup{}
      
      -- Treesitter
      require('nvim-treesitter.configs').setup {
	highlight = {
	  enable = true,
	  additional_vim_regex_highlighting = false,
        },
      }

      require('nvim-autopairs').setup{}

      local cmp = require('cmp')

      cmp.setup({
        snippet = {
	  expand = function(args)
	    require('luasnip').lsp_expand(args.body)
	  end,
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'luasnip' },
	})
      })
