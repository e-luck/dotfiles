"neobundle.vimでプラグイン管理する
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim.git

  call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neomru.vim.git'
NeoBundle 'git://github.com/vim-scripts/FuzzyFinder'
NeoBundle 'git://github.com/vim-scripts/L9'
NeoBundle 'git://github.com/vim-scripts/The-NERD-tree'
NeoBundle 'git://github.com/vim-scripts/matchit.zip'
NeoBundle 'git://github.com/tpope/vim-surround'
NeoBundle 'git://github.com/sjl/gundo.vim'
NeoBundle 'git://github.com/othree/html5.vim'
NeoBundle 'git://github.com/vim-scripts/YankRing.vim'
NeoBundle 'git://github.com/vim-scripts/vcscommand.vim'
NeoBundle 'git://github.com/scrooloose/nerdcommenter'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion'
NeoBundle 'git://github.com/vim-scripts/Gist.vim'
NeoBundle 'git://github.com/tpope/vim-fugitive'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/t9md/vim-textmanip.git'
NeoBundle 'git://github.com/terryma/vim-multiple-cursors.git'
NeoBundle 'git://github.com/gcmt/wildfire.vim.git'

filetype plugin on
filetype indent on
"neobundle.vim用の指定ここまで

"ツールバーを非表示に
set guioptions-=T
set guioptions-=m

"行番号を表示
set number

"タブ幅
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0

"インデント
set autoindent
set smartindent

"長い行は折り返す
set wrap

" 拡張子がtxtの時に、入力中に自動的に改行されるのを防ぐ
autocmd BufNewFile,BufRead *.txt setlocal textwidth=0

"編集中のファイルを保存しなくても画面切り替えできるように
set hid

"バックアップファイルを作成しない
set nobackup

"スワップファイルを作成しない
set noswapfile

"改行コードの自動認識
set fileformats=unix,dos,mac

"ヤンクを*レジスタにも入るようにすることでクリップボードにも入る
set clipboard=unnamed

"検索の大文字小文字区別なく
set ignorecase

" 循環検索をOFF
set nowrapscan  

"インクリメンタルサーチ
set incsearch

" 検索で移動時にカーソル行を画面中央にする
noremap n  nzz
map N  Nzz
noremap *  *zz
noremap #  #zz

"バックスペースはインデント等にも適用
set backspace=indent,eol,start

"カーソル行を強調
set cursorline

"対応する括弧のハイライトをなくす
let loaded_matchparen = 1

"ステータスラインを常に表示
set laststatus=2

"ファイルタイプ・文字コード・改行コードをステータスラインに表示
set statusline=%<[%n]%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"Exコマンドのキーバインドを入れ替えて;でコマンドラインモードに
noremap ; :
"noremap : ;

"表示行ごとに移動
nnoremap j gj
nnoremap k gk

"論理行ごとに移動
nnoremap gj j
nnoremap gk k

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"インサートモードでもjkhl移動
inoremap <C-J> <DOWN>
inoremap <C-K> <UP>
inoremap <C-H> <LEFT>
inoremap <C-L> <RIGHT>

"ノーマルモードでもエンターで改行
noremap <CR> o<ESC>

" <C-a>や<C-x>で8進数の計算をさせない
set nrformats-=octal 

" ファイルの再読み込み
nnoremap <Leader><Leader> :w<CR> :source %<CR>

" ファイルの保存
imap <C-s> <ESC>:up<CR>
nmap <C-s> :up<CR>

" セッションの保存
" ウィンドウの復元は :so {filename} 指定がなければ Session.vim
"map <Leader>w <ESC>:mks! $HOME/Session.vim

" ハイライトを非表示
nnoremap <silent> <Space>/ :set hlsearch!<CR>

"括弧が入力されたときに自動的に閉じ括弧を入力する
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
"inoremap { {}<LEFT>
"inoremap " ""<LEFT>

"バッファ切り替えのキーマップ
"前のバッファ
map <F2> <ESC>:bp<CR>
"次のバッファ
map <F3> <ESC>:bn<CR>
"バッファ削除
map <F4> <ESC>:bw<CR>

"bbでbufferのlist出すようにして番号選択
nmap <unique> <silent> <space>bb :ls<CR>:buf 

"文字カウント
"vnoremap <f11> :s/./&/g

"画面サイズを+/-キーで変更
map <kPlus> <C-W>+
map <kMinus> <C-W>-

"ペーストする内容を無名レジスタから0番レジスタに
nnoremap p "0p
nnoremap P "0P

"Yで行末までヤンク
nnoremap Y y$

"ビジュアルモード時vで行末まで選択
vnoremap v $h

"選択している文字カウント
vmap <Leader>c  g<C-g>

" タグを選択して折りたたみ
nnoremap <Space>zf  vatzf

"/{pattern}の入力中は「/」をタイプすると自動で「\/」が、 
"?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力される
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" Lessのsyntaxハイライト
au BufNewFile,BufRead *.less			setf less

" HTMLとかでドキュメントルートからの絶対パスのファイルを開く（gfみたいな感じで）
" 絶対パスじゃなかったら(/で始まってなかったら）gfと同じ
" ドキュメントルートのディレクトリは配列で複数指定できる。
"http://webtech-walker.com/archive/2009/10/02230656.html
 
let s:root_dirs = [$HOME.'/dev/site/localhost/test']
function! GotoAbsFile()
    let filename = expand('<cfile>')
    let filepath = filename
    if (match(filename, '^/') != -1)
        for dir in s:root_dirs
            if match(expand("%:p:h"), dir) != -1 && isdirectory(dir) == 1
                let filepath = dir . filename
                break
            endif
        endfor
    endif
    if filereadable(filepath)
        execute 'edit ' . filepath
    else
        echohl ErrorMsg
        echo 'no such file ' . filename
        echohl None
    endif
endfunction
nnoremap gaf :<C-u>call GotoAbsFile()<CR>

"開いているファイルのディレクトリをカレントディレクトリに
augroup BufferAu
    autocmd!
    " カレントディレクトリを自動的に移動
    autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END

"カレントディレクトリのキーマッピング　via:http://vim-users.jp/2009/09/hack69/
"CDというコマンドを定義し、<Space>cdに割り当てています。
"コマンドが引数なしで呼び出されたときは、現在開いているファイルと同じディレクトリに移動し、そうでない場合は引数のディレクトリに移動します。
":CD!として呼び出された場合、移動先のカレントディレクトリを表示し、どこに移動したのかを分かり易くしています。
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"拡張子htmlの際に読み込むテンプレートの設定
augroup SkeletonAu
	autocmd!
	autocmd BufNewFile *.html 0r $HOME/.vim/templates/skel.html
augroup END


" vimrc,gvimrc表示
noremap <Leader>v  :tabnew $HOME/dotfiles/.vimrc<CR>
noremap <Leader>g  :tabnew $HOME/dotfiles/.gvimrc<CR>

" vimrcを再読み込み
noremap <Leader><Leader>  :w<CR> :source $MYVIMRC<CR>
" vimrcとgvimrcを再読み込み
noremap <Leader>^  :source $MYVIMRC<CR> :source $MYGVIMRC<CR>

" Open junk file
command! -nargs=0 JunkFile call s:open_junk_file()
command! -nargs=0 JunkFileTxt call s:open_junk_file('txt')

function! s:open_junk_file(ext)
  " 保存先
  let l:junk_dir = $HOME . '/_vim_junk'. strftime('/%Y/%m')
  " 保存先をdrobbox内に変更する場合
  "" Mac
  "let l:junk_dir = $HOME . '/Dropbox/Public/_vim_junk'. strftime('/%Y/%m')
  "" Win
  "let l:junk_dir = $HOME . '/My Dropbox/Public/_vim_junk'. strftime('/%Y/%m')

  let l:junk_ext = a:ext
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.').junk_ext)
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction


" 使い捨てメモ保存
nnoremap <Space>jf :<C-u>JunkFile<CR>
nnoremap <Space>jt :<C-u>JunkFileTxt<CR>

" Select CSS Rule Set  "{{{1
" カーソルから最も近いCSSルールを選択する
command! -nargs=0 SelectCssRuleSet call s:select_css_rule_set()
function! s:select_css_rule_set()
    let save_reg = @@

    silent normal $va{Voy
    let first_yank = @@

    " 最初にヤンクした内容に'{'が含まれるかどうかチェック
    let chk_first_yank = matchstr(first_yank, '{')
    if chk_first_yank == ''
        " 最初にヤンクした内容に'{'が含まれない場合は次の行をチェックする
        let chk_next_line = matchstr(getline(line(".")+1), '{')
        while chk_next_line == '' " 次の行に'{'がない場合は見つかるまで繰り返す
            silent normal j
            " ファイルの最終行に来たらループ抜けてエラーメッセージを表示する
            if line(".")==line("$")
                execute "normal \<Esc>"
                echohl ErrorMsg
                echo 'no match css rule sets.'
                echohl None
                return
                break
            endif
            let chk_next_line = matchstr(getline(line(".")+1), '{')
        endwhile
        silent normal j
    endif

    execute "normal \<Esc>"
    silent normal $va{Vo
    let chk_prev_line = matchstr(getline(line(".")-1), ',')
    while chk_prev_line != '' " 上の行に','があればセレクタグループとして選択する
        silent normal k
        let chk_prev_line = matchstr(getline(line(".")-1), ',')
    endwhile

    let @@ = save_reg
endfunction

nnoremap <silent> var  :<C-u>SelectCssRuleSet<CR>
nnoremap <silent> <Space>var  :<C-u>SelectCssRuleSet<CR>zf
nnoremap <silent> vir  $vi{
nnoremap <silent> <Space>vir  $vi{zf
"}}}

"MacVimで保存したUTF-8な書類がMacのQuickLookで見れない問題を解決する
"http://d.hatena.ne.jp/uasi/20110523/1306079612
au BufWritePost * call SetUTF8Xattr(expand("<afile>"))

function! SetUTF8Xattr(file)
	let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
	if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
		call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
	endif
endfunction

"surroun.vimのキーマップ
nmap s   <Plug>Ysurround
nmap ss  <Plug>Yssurround

"NERDtreeのトグルをキーマップ
nnoremap <f12> :NERDTreeToggle<CR>

"YankRingの履歴ウィンドウを表示するキーマップ
nnoremap <silent> <F7> :YRShow<CR>
:let g:yankring_max_history = 10
:let g:yankring_window_height =13

" @:EnhCommentify.vim
"EnhancedCommentiyで、ブロック単位でコメントアウト
let g:EnhCommentifyMultiPartBlocks = 'yes' 
"コメントアウト
nnoremap <Space>x <Leader>x

" @:endtagcommentcustomize.vim
nnoremap ,t :<C-u>call Endtagcomment()<CR>
" HTML:既存のコメント削除した後でコメント追加。
au FileType html nnoremap <Space>,t  0f<df> :<C-u>call Endtagcomment()<CR>
au FileType xhtml nnoremap <Space>,t  0f<df> :<C-u>call Endtagcomment()<CR>

" NERD_commenter コメント記号の間に半角スペースを挿入します。
let NERDSpaceDelims = 1

" NERD_commenter 未対応のファイルがあった場合の警告を表示しません。
let NERDShutUp = 1

" NERD_commenter insert comments
" let NERDComInsertMap='<c-c>'
imap <C-c> <Plug>NERDCommenterInInsert
" NERD_commenter コメントアウト
nnoremap <Space>cc <Leader>cc
" NERD_commenter コメントトグル
nnoremap <Space>c<Space> <Leader>c<Space>

"matchit.vimで%を拡張
"対応するタグに移動できるようにする
:let b:match_words = '<:>,<tag>:</tag>'

"fuzzyfinder.vimの設定
"http://subtech.g.hatena.ne.jp/secondlife/20091203/1259817893
"http://tech.kayac.com/archive/vim-3-plugin.html
"nnoremap <unique> <silent> <C-S> :FufBuffer!<CR>
"nnoremap <unique> <silent> ef :FufFile!<CR>
"nnoremap <silent> eff :FufFile!<CR>
"nnoremap <silent> efm :FufMruFile!<CR>
nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
nnoremap <unique> <silent> <space>ff :FufFile!<CR>
nnoremap <unique> <silent> <space>fd :FufDir!<CR>
nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_splitPathMatching = ' '
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|\.howm$'
let g:fuf_file_exclude = '\v\.(swp|thumb|DS_Store)$|\.svn|\.git|\.(gif|jpg|png)$'
let g:fuf_mrufile_maxItem = 10000
let g:fuf_enumeratingLimit = 20

"Unite.vimの設定
nnoremap <unique> <silent> <space>uu :Unite buffer file file_mru directory_mru<CR>
nnoremap <unique> <silent> <space>uf :Unite -buffer-name=file file<CR>
" ESCキーを2回押してUnite終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"Gundo.vim
"アンドゥツリー
"nmap U :<C-u>GundoToggle<CR>
nnoremap <F5> :GundoToggle<CR>

"Fugitive.vim ステータスラインにブランチ名とリビジョンを表示
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" github(for gist.vim)
let g:github_user = 'e-luck'
let g:github_token = 'd7fc39d81511c62432361265e68b53d1'

"HTML文字実体参照の変換を行うスクリプトstr2htmlentity.vim用
vmap <silent> sx :Str2HtmlEntity<cr>
vmap <silent> sr :Entity2HtmlString<cr>

" neocomplcache.vim
autocmd! FileType xhtml setlocal iskeyword+=:,+
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Disable auto popup
"let g:neocomplcache_disable_auto_complete = 1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_snippets_dir =   '$HOME/.vim/snippets_complete'
let g:neocomplcache_auto_completion_start_length = 2
if !exists('g:neocomplcache_plugin_completion_length')
endif
let g:neocomplcache_plugin_completion_length = {
 \ 'snippets_complete'  : 1,
 \ 'keyword_complete'  : 3,
 \ 'syntax_complete'   : 3
 \ }
" 'snipMate_complete' : 1,
" Highlighting first candidate. AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
" Plugin key-mappings.
"imap <Tab>     <Plug>(neocomplcache_snippets_expand)
"smap <Tab>     <Plug>(neocomplcache_snippets_expand)
imap <C-e>     <Plug>(neocomplcache_snippets_expand)
smap <C-e>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
" Auto complete to common string and show available variants (if any).
inoremap <expr><C-l> neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
imap <expr><Tab> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<Tab>"
" <CR>: close popup and save indent.
" Choose candidate with <CR>.
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" 日本語をキャッシュしない
"if !exists('g:neocomplcache_keyword_patterns')
"	  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Quick match list
"let g:neocomplcache_quick_match_patterns['default'] = ';'
" Edit snippets files
nnoremap <silent> <Space>nh :NeoComplCacheEditSnippets xhtml<CR>
nnoremap <silent> <Space>nc :NeoComplCacheEditSnippets css<CR>
nnoremap <Space>nn :NeoComplCacheEditSnippets 
" Tab入力時に展開できるスニペットがあれば展開。それ以外はTab入力
"imap <expr><TAB> Expand()
" Tab入力でスニペット展開
"smap <TAB> Expand()
"function! Expand()
"	if neocomplcache#sources#snippets_complete#expandable() == 0
"	 return "\<TAB>"
"	elseif neocomplcache#sources#snippets_complete#expandable() == 1
"	 return "\<Plug>(neocomplcache_snippets_expand)"
"	elseif neocomplcache#sources#snippets_complete#expandable() == 2
"	 return "\<Plug>(neocomplcache_snippets_jump)"
"	endif
"endfunction

"powerlineのモードインジケーターを日本語に
"http://mattn.kaoriya.net/software/vim/20120823214404.htm
let g:Powerline_mode_i = '挿入'
let g:Powerline_mode_R = '置換'
let g:Powerline_mode_n = '通常'
let g:Powerline_mode_v = 'ビジュアル'
let g:Powerline_mode_V = '行ビジュアル'
let g:Powerline_mode_cv = '矩形ビジュアル'
let g:Powerline_mode_s = '選択'
let g:Powerline_mode_S = '行選択'
let g:Powerline_mode_cs = '矩形選択'

" This selects the next closest text object.
let g:wildfire_fuel_map = "<C-ENTER>"

" This selects the previous closest text object.
let g:wildfire_water_map = "<BS>"
