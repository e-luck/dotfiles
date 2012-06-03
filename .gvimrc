"ウィンドウを最大化して起動
"au GUIEnter * simalt ~x 
	
"カラースキーム
syntax enable
colorscheme solarized
set background=dark
let g:solarized_termcolors=256

"colorscheme desert
"colorscheme desertEX
"colorscheme anotherdark
"colorscheme camo
"colorscheme h2u_black

"ウィンドウの幅と高さ
set columns=180
set lines=80

"ウィンドウ拡大で横方向も
"defaults write org.vim.MacVim MMZoomBoth -boolean YES

"ウィンドウ半透明
set transparency=5

"現在のファイルをFirefoxで開く
noremap <Leader>W :silent !start firefox %<CR>

"ファイル保存ダイアログの初期ディレクトリを指定
":set browsedir=/

"ウィンドウズ環境においては、バックアップファイルを下記のディレクトリに
"if has('win32')
"	set backupdir=d:\vimBackup
"endif
"マック環境においては、バックアップファイルを下記のディレクトリに
"if has('mac')
"	set backupdir=$HOME/vimBackup
"endif
"バックアップ書類の拡張子を変更
"set backupext=.back
"スワップファイルをバックアップと同じディレクトリに
"let &directory = &backupdir

"IMEが日本語の際にはカーソルを赤色に
if has('multi_byte_ime') || has('xim') || has('mac') || has('gui_macvim')
  " IME ON時のカーソルの色を設定(設定例:赤)
  highlight CursorIM guibg=red guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
"  set noimdisable
  " set iminsert=0 imsearch=0
  " if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  "endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=grey80
" %u3000は全角space(　)の文字code
au BufNewFile,BufRead * match ZenkakuSpace /\%u3000/


#vim-textmanip
xmap <D-d> <Plug>(textmanip-duplicate-down)
nmap <D-d> <Plug>(textmanip-duplicate-down)
xmap <D-D> <Plug>(textmanip-duplicate-up)
nmap <D-D> <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
