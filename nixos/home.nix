{ config, pkgs, ... }:

{

  programs.home-manager.enable = true;

  home.username = "montony";
  home.homeDirectory = "/home/montony";
  home.stateVersion = "25.05";

  # nixpkgs.config.allowUnfree = true;

  # Packages
  home.packages = with pkgs; [
    go
    firefox-wayland
    yazi
    nautilus
    telegram-desktop
    libreoffice
    starship
    logseq
  ];

  # Shell
  programs.fish = {
    enable = true;
    
    shellInit = ''
       starship init fish | source
    '';

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };

  programs.starship.enable = true;
  
  # Terminal
  programs.foot.enable = true;

  # Editor
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      nvim-autopairs
    ];

    extraPackages = with pkgs; [
      # C/C++
      clang-tools

      # Go
      gopls
      delve

      # Java
      jdt-language-server
    ];

#    extraLuaConfig = ''
#      
#      vim.o.relativenumber = true
#
#      vim.api.nvim_set_keymap('n', '<F5>', ':!go run %<CR>', { noremap = true, silent = true })
#
#      local lspconfig = require("lspconfig")
#
#      -- C/C++
#      lspconfig.clangd.setup{}
#
#      -- Go
#      lspconfig.gopls.setup{}
#
#      -- Java
#      lspconfig.jdtls.setup{}
#      
#      -- Treesitter
#      require('nvim-treesitter.configs').setup {
#	highlight = {
#	  enable = true,
#	  additional_vim_regex_highlighting = false,
#        },
#      }
#
#      require('nvim-autopairs').setup{}
#
#      local cmp = require('cmp')
#
#      cmp.setup({
#        snippet = {
#	  expand = function(args)
#	    require('luasnip').lsp_expand(args.body)
#	  end,
#	},
#	mapping = cmp.mapping.preset.insert({
#	  ['<C-Space>'] = cmp.mapping.complete(),
#	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
#	}),
#	sources = cmp.config.sources({
#	  { name = 'nvim_lsp' },
#	  { name = 'luasnip' },
#	})
#      })
#    '';
    };

  # File Manager
  programs.yazi.enable = true;

  # Wayland
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  programs.waybar.enable = true;

  # Theme
  # stylix.enable = true;
  # stylix.theme = "nord";

}

