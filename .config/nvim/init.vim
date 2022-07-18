"vim-plug if
if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
syntax on
colorscheme dracula

set updatetime=100
set clipboard=unnamedplus
set nu
set relativenumber
set shortmess+=c
set hidden
set cursorline
set showcmd
set noshowmatch
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell

set nowrap
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set tw=80
set autoindent
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,. 
if has('perseistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

noremap <LEADER><CR> :nohlsearch<CR>
noremap K 5k
noremap J 5j
noremap H 5h
noremap L 5l

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>



"plug.vim
call plug#begin('~/.config/nvim/plugged')
"coc.nvim
Plug 'neoclide/coc.nvim', {'branch':'release'}

"lua
"Plug 'sumneko/lua-language-server'
"NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"indentLine提供的一个可视化的缩进
Plug 'Yggdroot/indentLine'

"vim-airline给nvim 提供一个强大的状态栏和标签栏，当打开多个文本时，可以用它进行快速的切换
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题

"nerdcommenter是一个很好用的注释工具，在normal和visual模式下，他会对你光标所在行或所选中的多行进行注释和去注释，只需要你按下 <\>+<c>+<space>。
Plug 'scrooloose/nerdcommenter'

"rainbow是一个提供嵌套括号高亮的一个工具。
Plug 'luochen1990/rainbow'

"tagbar可以用来展示当前的文件的一些函数。
Plug 'majutsushi/tagbar'
"vim-cpp-enhanced-highlight，这个是用来加强C++的高亮的
Plug 'octol/vim-cpp-enhanced-highlight'

"honza/vim-snippets提供C++的snippets
Plug 'honza/vim-snippets'
"
Plug 'mhinz/vim-startify'
"
"dracula color
Plug 'Mofiqul/dracula.nvim'

"
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'godlygeek/tabular'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim'
"安装插件
Plug 'ferrine/md-img-paste.vim' 

call plug#end()


" Compile function
"=========<F5>Compile<F6>RunResult=====================
" func! CompileGcc()
"     exec "w"
"     let compilecmd="!gcc "
"     let compileflag="-o %< "
"     if search("mpi\.h") != 0
"         let compilecmd = "!mpicc "
"     endif
"     if search("glut\.h") != 0
"         let compileflag .= " -lglut -lGLU -lGL "
"     endif
"     if search("cv\.h") != 0
"         let compileflag .= " -lcv -lhighgui -lcvaux "
"     endif
"     if search("omp\.h") != 0
"         let compileflag .= " -fopenmp "
"     endif
"     if search("math\.h") != 0
"         let compileflag .= " -lm "
"     endif
"     exec compilecmd." % ".compileflag
" endfunc
" func! CompileGpp()
"     exec "w"
"     let compilecmd="!g++ "
"     let compileflag="-o %< "
"     if search("mpi\.h") != 0
"         let compilecmd = "!mpic++ "
"     endif
"     if search("glut\.h") != 0
"         let compileflag .= " -lglut -lGLU -lGL "
"     endif
"     if search("cv\.h") != 0
"         let compileflag .= " -lcv -lhighgui -lcvaux "
"     endif
"     if search("omp\.h") != 0
"         let compileflag .= " -fopenmp "
"     endif
"     if search("math\.h") != 0
"         let compileflag .= " -lm "
"     endif
"     exec compilecmd." % ".compileflag
" endfunc
"
" func! RunPython()
"         exec "!python %"
" endfunc
" func! CompileJava()
"     exec "!javac %"
" endfunc
" func! RunLua()
"         exec "!lua %"
" endfunc
" func! CompileCode()
"         exec "w"
"         if &filetype == "cpp"
"                 exec "call CompileGpp()"
"         elseif &filetype == "c"
"                 exec "call CompileGcc()"
"         elseif &filetype == "python"
"                 exec "call RunPython()"
"         elseif &filetype == "java"
"                 exec "call CompileJava()"
"         elseif &filetype == "lua"
"             exec "call RunLua()"
"         endif
" endfunc
"
" func! RunResult()
"         exec "w"
"         if search("mpi\.h") != 0
"             exec "!mpirun -np 4 ./%<"
"         elseif &filetype == "cpp"
"             exec "! ./%<"
"         elseif &filetype == "c"
"             exec "! ./%<"
"         elseif &filetype == "python"
"             exec "call RunPython"
"         elseif &filetype == "java"
"             exec "!java %<"
"         endif
" endfunc
" func! CompileRun()
"     CompileCode()
"     RunResult()
" endfunc
"
" map <F5> :call CompileCode()<CR>
" imap <F5> <ESC>:call CompileCode()<CR>
" vmap <F5> <ESC>:call CompileCode()<CR>
" map <F6> :call RunResult()<CR>
"=========<F5>Compile<F6>RunResult=====================

"=========<LEADER>r -> Com&Run=====================
noremap <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        set splitbelow
        :sp
        :res -5
        term gcc % -o %< && time ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'cs'
        set splitbelow
        silent! exec "!mcs %"
        :sp
        :res -5
        :term mono %<.exe
    elseif &filetype == 'java'
        set splitbelow
        :sp
        :res -5
        term javac % && time java %<
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'lua'
        set splitbelow
        :sp
        :term lua %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        exec "InstantMarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
        silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'racket'
        set splitbelow
        :sp
        :res -5
        term racket %
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

"设置默认储存文件夹。这里表示储存在当前文档所在文件夹下的'pic'文件夹下，相当于 ./pic/
let g:mdip_imgdir = 'pic' 
"设置默认图片名称。当图片名称没有给出时，使用默认图片名称
let g:mdip_imgname = 'image'
"设置快捷键，个人喜欢 Ctrl+p 的方式，比较直观
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i


"=========<LEADER>r -> Com&Run=====================

set list lcs=tab:\|\ "提供的一个可视化的缩进 For code indented with tabs.


"=============Coc.nvim================="
"TAB 补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
  "inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
"nmap <silent> <LEADER>= <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"var rename
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"coc.nvim
let g:coc_global_extensions = [
	\ 'coc-highlight',
	\ 'coc-sh',
	\ 'coc-syntax',
	\ 'coc-vimlsp',
	\ 'coc-word',
	\ 'coc-snippets',
	\ 'coc-json',
	\ 'coc-sumneko-lua',
	\ 'coc-pyright',
	\ 'coc-clangd',]




"=====================NERDTree===========================
"       HELP
"       新建文件	ma	在要创建文件的目录中按命令 ma然后键入你要创建的文件名称即可。
"       删除文件	md	在要删除的文件上按命令md然后输入y回车即可。
"       移动文件/修改文件名	mm	在要修改的文件上按命令mm然后输入对应的目录和名称回车即可。
"       设置当前目录为项目根目录	C	在要设置为根目录的目录上按即可"查看当前文件所在目录	
"       :NERDTreeFind	执行命令 :NERDTreeFind 或添加 map <leader>v :NERDTreeFind<CR> 全局使用
"       i和s 水平分割或纵向分割窗口打开文件
"       u 打开上层目录
"       t 在标签页中打开
"       T 在后台标签页中打开
"       
"       o 打开关闭文件或者目录，如果是文件的话，光标出现在打开的文件中
"       O 打开结点下的所有目录
"       X 合拢当前结点的所有目录
"       x 合拢当前结点的父目录
"       p 到上层目录
"       P 到根目录
"       K 到同目录第一个节点
"       J 到同目录最后一个节点
"       m 显示文件系统菜单（添加、删除、移动操作）
"
"autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=1     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
nnoremap <LEADER>e :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
"================================================================


"indentLine提供的一个可视化的缩进
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进



"vim-airline给nvim 提供一个强大的状态栏和标签栏，当打开多个文本时，可以用它进行快速的切换
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'dark'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 



"nerdcommenter是一个很好用的注释工具，在normal和visual模式下，他会对你光标所在行或所选中的多行进行注释和去注释，只需要你按下 <\>+<c>+<space>。
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
 
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
 
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
 
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
 
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
 
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1




"rainbow是一个提供嵌套括号高亮的一个工具。
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


"tagbar可以用来展示当前的文件的一些函数。
let g:tagbar_width=30
nnoremap <silent> <F4> :TagbarToggle<CR> " 将tagbar的开关按键设置为 F4

"SimpylFold设置代码折叠
"set foldmethod=indent
"let g:SimpylFold_docstring_preview=0

