{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      vscode-nvim
      vim-go # Go language support
      nvim-lspconfig
      nvim-dap
      cmp-nvim-lsp
      nvim-cmp
      luasnip
      cmp_luasnip
      go-nvim # Extra goodies for Go
      nvim-treesitter
      plenary-nvim
      nvim-autopairs
      gitsigns-nvim
      nvim-dap-virtual-text
      nvim-dap-ui
      nvim-comment
      snacks-nvim
    ];

    extraConfigLua = ''
      require('vscode').setup({
        style = 'dark',  -- Options: dark, light
        transparent = false,
        italic_comments = true,
      })

      -- LSP Config for Go
      local lspconfig = require('lspconfig')
      lspconfig.gopls.setup({
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
      })

      -- Autocomplete
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })

      -- Autopairs setup
      require('nvim-autopairs').setup({})

      -- Gitsigns
      require('gitsigns').setup({})

      -- Comment.nvim
      require('nvim_comment').setup({})

      -- snacks.nvim (minimal example)
      require('snacks').setup({})
    '';

    opts = {
      expandtab = true;
      shiftwidth = 2;
      smartindent = true;
      tabstop = 2;
      number = true;
      clipboard = "unnamedplus";
    };

    # Keymaps
    globals = {
      mapleader = " ";
    };

    plugins = {

      # UI
      web-devicons.enable = true;
      lualine.enable = true;
      bufferline.enable = true;
      treesitter.enable = true;
      which-key = {
        enable = true;
      };
      noice = {
        # WARNING: This is considered experimental feature, but provides nice UX
        enable = true;
        settings.presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          #inc_rename = false;
          #lsp_doc_border = false;
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            options.desc = "file finder";
            action = "find_files";
          };
          "<leader>fg" = {
            options.desc = "find via grep";
            action = "live_grep";
          };
        };
        extensions = {
          file-browser.enable = true;
        };
      };

      # Dev
      lsp = {
        enable = true;
        servers = {
          gopls.enable = true;
          hls = {
            enable = true;
            installGhc = false; # Managed by Nix devShell
          };
          marksman.enable = true;
          nil_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };
    };
  };
}
