--------------------------------------------------------------------------------
-- プラグイン設定
--------------------------------------------------------------------------------

-- プラグイン読み込みの指示を出します。
require "plugins"

-- 各種プラグインの設定を読み込みます。
require "lualine_config"
require "indent_blankline_config"
require('mason').setup()
require "nvim-cmp_config"
require "mason_config"
-- require "lsp_lines_config"
require "telescope_config"
require "ugaterm_config"

--------------------------------------------------------------------------------
-- ファイル別設定
--------------------------------------------------------------------------------

-- Fortran は常に自由形式で書くようにします
vim.g.fortran_free_source = 1

vim.g.tex_fast = "bms"
vim.g.tex_conceal = ""

--------------------------------------------------------------------------------
-- LSP に関する設定
--------------------------------------------------------------------------------

-- LSP ハンドラーの設定
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- レファレンス ハイライトの設定 (カーソル下の変数のハイライト)
-- vim.cmd [[
-- set updatetime=500
-- highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
-- highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
-- highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
-- augroup lsp_document_highlight
--   autocmd!
--   autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
--   autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
-- augroup END
-- ]]

-- fortls の設定。必要なのかよくわかりません。
-- https://fortls.fortran-lang.org/options.html
require'lspconfig'.fortls.setup{
    cmd = {
        "fortls",
        "--lowercase_intrinsics",
        "--debug_log",
    },
    autostart = false
}

--------------------------------------------------------------------------------
-- キー マップ設定
--------------------------------------------------------------------------------

-- LSP キー マップ
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- 行頭に移動します。
vim.keymap.set("n", "<Space>h", "g^")
-- 行末に移動します。
vim.keymap.set("n", "<Space>l", "g$")

-- タブを移動します。
vim.keymap.set("n", "<C-n>", "gT")
vim.keymap.set("n", "<C-p>", "gt")

-- ウィンドウを移動します。
vim.keymap.set("n", "<F10>", "<C-w>w")
vim.keymap.set("n", "<Tab>", "<C-w>w ")

-- ウィンドウを閉じます。
vim.keymap.set("n", "<S-F10>", ":clo<CR>")

-- 現在開いているファイルのディレクトリに移動します。
vim.keymap.set("n", "<F7>", ":cd %:h<CR>")
-- 現在開いているファイルのディレクトリを Windows エクスプローラーで開きます。
vim.keymap.set("n", "<S-F7>", ":silent ! start %:h<CR>")

-- 検索結果のハイライトを表示します。
vim.keymap.set("n", "<F3>", ":set hlsearch<CR>")
-- 検索結果のハイライトを非表示にします。
vim.keymap.set("n", "<S-F3>", ":set nohlsearch<CR>")

-- gfortran で現在開いているファイルをコンパイルします。
vim.keymap.set("n", "<F4>", ":w<CR>:cd %:h<CR>:!gfortran % -o %:r<CR>")
-- "<現在開いているファイル名>.exe" を実行します。
vim.keymap.set("n", "<S-F4>", ":cd %:h<CR>:!start cmd /K %:r.exe&timeout -1&exit + {enter}<CR>")

--------------------------------------------------------------------------------
-- 操作設定
--------------------------------------------------------------------------------

-- マウス操作を有効にします。
vim.opt.mouse = "a"

--------------------------------------------------------------------------------
-- 補完設定
--------------------------------------------------------------------------------

-- 補完ウィンドウを対象が 1 件のみの場合でも表示します。
-- https://note.com/yasukotelin/n/na87dc604e042
vim.opt.completeopt=menuone

--------------------------------------------------------------------------------
-- スワップ ファイル、バックアップ ファイル設定
--------------------------------------------------------------------------------

-- スワップ ファイルを生成しないようにします。
vim.opt.swapfile = false
-- バックアップ ファイルを生成しないようにします。
vim.opt.backup = false

--------------------------------------------------------------------------------
-- 画面表示設定
--------------------------------------------------------------------------------

-- 行番号を表示します。
vim.opt.number = true

-- タブを使わないようにします。
vim.opt.expandtab = true
-- タブと改行を可視化します。
vim.opt.list = true
vim.opt.listchars = {tab = ">-", eol = "↴"}
-- タブ幅を決定します。
vim.opt.tabstop = 4
-- キーボードでtabを打つとスペース4つ分になるようにします。
vim.opt.softtabstop = 4
-- インデント幅を決定します。
vim.opt.shiftwidth = 4

-- カーソルを点滅しないようにします。
--vim.opt.guicursor = a:blinkon0
-- カーソルの位置表示
vim.opt.ruler = true
-- カーソル行にラインを表示します。
vim.opt.cursorline = true
-- 行間隔を設定します。
vim.opt.linespace = 1

-- 長い行を省略せずに表示します。
vim.opt.display = lastline

-- 補完リストの高さを設定します。
vim.opt.pumheight = 10

-- カラー スキームを設定します。
vim.cmd[[colorscheme iceberg]]
-- フォントを指定します。
vim.opt.guifont = "Ricty Diminished:h11"

-- スペル チェックにおいてアジア圏の語はスペルチェックの対象外にします。
vim.opt.spelllang = {"c", "j", "k"}

-- 編集中のファイルを表示します。
vim.opt.title = true

-- 括弧入力時の対応する括弧を表示します。
vim.opt.showmatch = true

-- 不可視文字を可視化します。
vim.opt.list = true

-- オートインデントを設定します。
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 一行あたりの文字数を制限しないようにします。
vim.opt.textwidth = 0

-- ウィンドウの端で折り返して表示しないようにします。
vim.opt.wrap = false

-- 横方向スクロールを一文字単位で行います。
vim.opt.sidescroll = 1

-- 折り返し時に単語単位で折り返さないようにします。
vim.opt.linebreak = false

-- 自動改行を禁止します。
vim.opt.formatoptions:append({m = true, M = true})

-- 改行時に自動的にコメントアウトがつくのを防ぎます。
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

-- floating window を半透明にします。
-- vim.opt.winblend = 10
