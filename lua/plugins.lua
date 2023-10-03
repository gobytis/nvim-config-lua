-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  
  ------------------------------------------------------------------------------
  -- LSP 関係のプラグイン
  ------------------------------------------------------------------------------
  
  -- LSP を設定するプラグイン
  use 'neovim/nvim-lspconfig'
  
  -- LSP サーバー管理プラグイン
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  ------------------------------------------------------------------------------
  -- 補完 関係のプラグイン
  ------------------------------------------------------------------------------

  -- 補完エンジン プラグイン
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"

  ------------------------------------------------------------------------------
  -- ファジー ファインダー関係のプラグイン
  ------------------------------------------------------------------------------

  use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      }

  -- ファイラー プラグイン
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  ------------------------------------------------------------------------------
  -- ターミナル関係のプラグイン
  ------------------------------------------------------------------------------

  -- ターミナルを使いやすくするためのプラグイン
  -- https://zenn.dev/uga_rosa/articles/76fc0848b4233d
  use "uga-rosa/ugaterm.nvim"

  ------------------------------------------------------------------------------
  -- 編集関係のプラグイン
  ------------------------------------------------------------------------------
  
  -- 編集モードと挿入モードで IME を切り替えるプラグイン
  use "pepo-le/win-ime-con.nvim"

  -- 対になる括弧などを自動で閉じるプラグイン
  use {
    "windwp/nvim-autopairs",
     config = function() require("nvim-autopairs").setup {} end
  }

  ------------------------------------------------------------------------------
  -- 画面表示に関するプラグイン
  ------------------------------------------------------------------------------

  -- ステータス ラインをカスタマイズするプラグイン
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- カラー スキーム iceberg
  use "cocopon/iceberg.vim"

  -- インデントのわかりやすい可視化プラグイン
  use "lukas-reineke/indent-blankline.nvim"
  
  -- LSP の diagnostics の見た目を整えるプラグイン
  -- use({
  -- "ErichDonGubler/lsp_lines.nvim",
  -- config = function()
  --   require("lsp_lines").setup()
  -- end,
  -- })
end)
