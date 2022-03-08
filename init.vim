
if has("syntax")
		syntax on
endif

filetype on                 "파일종류 자동인식
filetype indent on          "파일 종류에 따른 구문강조

set autoindent              "스마트한 들여쓰기
set cindent
set number              "줄 번호 보이기
set shiftwidth=2
set tabstop=2               "탭 칸수
set hlsearch                "검색 하이라이트
set nocompatible            " 방향키로 이동 가능

let mapleader = ","

"execute pathogen#infect()

if empty(glob('~/.vim/autoload/plug.vim'))
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"vim live-server
Plug 'turbio/bracey.vim'
"vim indentguides"
Plug 'thaerkh/vim-indentguides'
"vim git상태 확인 플러그인
Plug 'airblade/vim-gitgutter'
"vim 주석 단축키 플러그인
Plug 'scrooloose/nerdcommenter'
Plug 'gko/vim-coloresque'
Plug 'leafOfTree/vim-matchtag'
"vim html css 툴"
Plug 'mattn/emmet-vim'
"vim html css 테그 자동 닫기"
Plug 'alvan/vim-closetag'
"vim 함수 원형으로 바로 이동"
Plug 'majutsushi/tagbar'
"vim 드라큘라 테마"
Plug 'Mofiqul/dracula.nvim'
"vim 파일 네비게이터"
Plug 'preservim/nerdtree'
"vim 문법검사"
Plug 'vim-syntastic/syntastic'
"노미넷"
Plug 'alexandregv/norminette-vim'
"vim 자동완성"
Plug 'neoclide/coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"vim  디버거"
Plug 'puremourning/vimspector'
Plug 'Raimondi/delimitMate'
"42 헤더"
Plug 'pbondoer/vim-42header'
"vim airline"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
"vim 필요없는 스페이스바 자동삭제"
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

"---------vimspector----------"
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <Leader>di <Plug>VimspectorBalloonEval
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>dc :!cc -g -I./libft/libft.h -L./libft/ -lft % -o main<CR>
"----------------------------------"


"----syntastic-------"
" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1
" Set the path to norminette (do no set if using norminette of 42 mac)
"let g:syntastic_c_norminette_exec = '/Library/Python/3.8/bin/norminette'
" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']
" Pass custom arguments to norminette (this one ignores 42header)
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'
" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 0
" Enable error list
let g:syntastic_always_populate_loc_list = 1
" Automatically open error list
let g:syntastic_auto_loc_list = 1
" Skip check when closing
let g:syntastic_check_on_wq = 1
" syntastic togglemode
nmap <Home> :SyntasticToggleMode<CR>
"--------------------------"


"---------42header-------------"
let g:hdr42user = 'soum'
let g:hdr42mail = 'soum@student.42seoul.kr'
"-------------------------------"


"----------NERDtree----------------"
nmap <F2> :NERDTreeToggle<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=22
"----------------------------------"


"-----------nvim-treesitter--------------"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
"--------------------------------------"


"-------delimitMate 괄호 자동완성 플러그인--------"
let delimitMate_expand_cr=1
let delimitMate_matchpairs = "(:),[:],{:}"
"------------------------------------------------"


"-----------------neovim theme-------------------"
" neovim theme <dracula> 테마 적용
" show the '~' characters after the end of buffers
colo dracula
let g:dracula_show_end_of_buffer = 1
" use transparent background
let g:dracula_transparent_bg = 1
" set custom lualine background color
let g:dracula_lualine_bg_color = "#44475a"
"-------------------------------------------------"


"---------------------tagbar----------------------"
nmap <F7> :TagbarToggle<CR>
let g:tagbar_width=30
let g:tagbar_position= 'rightbelow'
"-------------------------------------------------"


"--------terminal color?-----------
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_enabled = 1
"----------------------------------

"----------------nerdtree icon-------------------"
set encoding=UTF-8
filetype plugin indent on    " required
"------------------------------------------------"


"------------vim-beter_whitespace-----------------"
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
"-------------------------------------------------"


"-----------------------------coc auto_select-----------------------------"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction
"---------------------------------------------------------------------------"

"--------emmet-vim------------"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_expandabbr_key='<Tab>'
"------------------------------"

"-------------ctag---------------"
nnoremap <C-a> <C-]>
nnoremap <C-s> <C-t>
"--------------------------------"


"-----------------nerdcommenter---------------------------"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment
"---------------------------------------------------------"


"-------gitgutter---------
set updatetime=250
"--------------------------


"---------indentguides---------"
let g:indentguides_ignorelist = []
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
"--------------------------------"


"---------toggleterm-----------"
tnoremap <Esc> <C-\><C-n>
nmap <C-W>+ <C-W>+<SID>ws
nmap <C-W>- <C-W>-<SID>ws
nn <script> <SID>ws+ <C-W>+<SID>ws
nn <script> <SID>ws- <C-W>-<SID>ws
nmap <SID>ws <Nop>

nmap <C-W>< <C-W><<SID>ws
nmap <C-W>> <C-W>><SID>ws
nn <script> <SID>ws< <C-W><<SID>ws
nn <script> <SID>ws> <C-W>><SID>ws
nmap <SID>ws <No
