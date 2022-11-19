if has("syntax")
	syntax on
endif



aaaa

filetype on
filetype indent on

set encoding=UTF-8
set smartindent
set cindent
set	rnu
set number
set shiftwidth=4
set tabstop=4
set nocompatible
set clipboard=unnamedplus


nmap <END> :nohl<CR>

let mapleader = ","
imap <leader>ww <ESC>:w<CR>i
imap <leader>wq <ESC>:wq<CR>

autocmd FileType cpp set keywordprg=/Users/soum/.brew/bin/cppman

call plug#begin('~/.vim/plugged')
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'gko/vim-coloresque'
Plug 'IngoMeyer441/coc_current_word'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'
Plug 'd86leader/vim-cpp-helper'
Plug 'bfrg/vim-cpp-modern'
Plug 'puremourning/vimspector'
Plug 'gauteh/vim-cppman'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/vim-cppman'
Plug 'Pocco81/auto-save.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'gko/vim-coloresque'
Plug 'leafOfTree/vim-matchtag'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'pbondoer/vim-42header'
Plug 'alexandregv/norminette-vim'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'Mofiqul/dracula.nvim'
Plug 'Raimondi/delimitMate'
" Plug 'neoclide/coc.nvim' "", {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:hdr42user = 'soum'
let g:hdr42mail = 'soum@student.42seoul.kr'
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1
" let g:syntastic_c_norminette_exec = '~/.norminette/norminette.rb'
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']
let g:syntastic_c_norminette_args = '-R CheckForbiddenSourceHeaer'
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'c++'
let g:syntastic_cpp_compiler_options = "-std=c++98 -Wall -Wextra -Werror -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Werror -Wpedantic"

"--------------------NERDtree------------------"
nmap <F2> :NERDTreeToggle<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
let g:NERDTreeWinSize=20
set wildignore+=*.o,*.obj,*.swp,*.DS_Store,tags*
let NERDTreeRespectWildIgnore=1
let NERDTreeShowBookmarks=1
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p
"-----------------------------------------------"

"----------------dracula-theme------------------"
" neovim theme <dracula> 테마 적용
" show the ‘~’ characters after the end of buffers
colo dracula
let g:dracula_show_end_of_buffer = 1
" use transparent background
" let g:dracula_transparent_bg = 1
" set custom lualine background color
hi CocFloating guibg=#3E4452
hi CocMenuSel guibg=#3E44a0
hi CocFloatDividingLine guibg=#3E4452
"-----------------------------------------------"

" delmitMate
let delimitMate_expand_cr=1
let delimitMate_matchpairs = "(:),[:],{:}"

"syntastic
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']
let g:syntastic_c_norminette_args = 'R CheckTopCommentHeader'
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
nmap <HOME> :SyntasticToggleMode<CR>

"tagbar
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width=30
let g:tagbar_position = 'rightbelow'

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"cpp", "c"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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

"vim-airline
let g:airline_theme = 'base16_dracula'
let g:airline#extensions#gutentags#enabled = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

"vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=0
" let g:better_whitespace_ctermcolor='Violet'
let g:better_whitespace_guicolor='Skyblue'

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
"customize keymapping
nmap <leader>mm <plug>NERDCommenterToggle
xmap <leader>mm <plug>NERDCommenterToggle
nmap <Leader>m<space> <plug>NERDCommenterInvert
xmap <Leader>m<space> <plug>NERDCommenterInvert
"---------------------------------------------------------"

"ctags"
nnoremap <leader><C-a> <C-]>
nnoremap <leader><C-s> <C-t>

"
tnoremap <Esc> <C-\><C-n>
nmap <C-W>= <C-W>+<SID>ws
nmap <C-W>- <C-W>-<SID>ws
nmap <C-W>+ <C-W>=<SID>ws
nn <script> <SID>ws= <C-W>+<SID>ws
nn <script> <SID>ws- <C-W>-<SID>ws
nmap <SID>ws <Nop>

nmap <C-W>< <C-W><<SID>ws
nmap <C-W>> <C-W>><SID>ws
nn <script> <SID>ws< <C-W><<SID>ws
nn <script> <SID>ws> <C-W>><SID>ws


"----------AutoSave------------"
lua << EOF
require("auto-save").setup
    {
			{
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    execution_message = {
		message = function() -- message to print on save
			return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
		end,
		dim = 0.18, -- dim the color of `message`
		cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	},
    trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
	-- function that determines whether to save the current buffer or not
	-- return true: if buffer is ok to be saved
	-- return false: if it's not ok to be saved
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if
			fn.getbufvar(buf, "&modifiable") == 1 and
			utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
	callbacks = { -- functions to be executed at different intervals
		enabling = nil, -- ran when enabling auto-save
		disabling = nil, -- ran when disabling auto-save
		before_asserting_save = nil, -- ran before checking `condition`
		before_saving = nil, -- ran before doing the actual save
		after_saving = nil -- ran after doing the actual save
	}
}
    }
EOF
"

"-----------------------------coc auto_select-----------------------------"
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif
  "
  inoremap <expr> <CR> InsertMapForEnter()
  function! InsertMapForEnter()
	  if coc#pum#visible()
		  return coc#pum#confirm()
	  elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
		  return "\<CR>\<Esc>O"
	  elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
		  return "\<CR>\<Esc>O"
	  else
		  return "\<CR>"
	  endif
  endfunction
"---------------------------------------------------------------------------"

"----------------------------------coc-config---------------------------------"
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
nmap <leader>hh :CocCommand clangd.switchSourceHeader <CR>
nmap <leader>sh :CocCommand clangd.switchSourceHeader vsplit <CR>

set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number colmn into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
" inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
" inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"
"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> J :call <SID>show_documentation()<CR>

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>co <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>u
" ------------------------------------------------------------------------------------------------------------------"

"-------------------gutentags------------------------"
let g:gutentags_project_root = ['Makefile']
set statusline+=%{gutentags#statusline()}
"----------------------------------------------------"

"-------------------vimspector-----------------------"
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <Leader>di <Plug>VimspectorBalloonEval
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>dc :!cc -g -I./libft/libft.h -L./libft/ -lft % -o main<CR>
nmap <leader>aa <Plug>VimspectorUpFrame
nmap <leader>ss <Plug>VimspectorDownFrame
"--------------------------------------------------"

"----------------------cpp-enhanced-highlight-----------------------"
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 0

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1
"---------------------------------------------------------------------"

"-----------------------cpp_helper-----------------------------------"
let g:cpp_helper_header_extension = ".hpp"
let g:cpp_helper_source_extension = ".cpp"
let g:cpp_helper_inclusion_guard_flavour = 1
let g:cpp_helper_inclusion_guard_format = "%s_hpp"
let g:cpp_helper_bracket_style = 1
let g:cpp_helper_after_creation = 1
let g:cpp_helper_wipe_buffers = 1
let g:cpp_helper_scope_marker_indent = 2
let g:cpp_helper_declaration_offset = 0
let g:cpp_helper_implementation_offset = 1
"----------------------------------------------------------------------"

"---------------------floaterm---------------------"
let g:floaterm_keymap_toggle = '<Leader>tt'
"--------------------------------------------------

"---------------coc_current_word-----------------"
let g:coc_current_word_highlight_delay = 350
"-------------------------------------------------"

"------------------nerdtree-syntax-highlight----------"
let s:git_orange = 'F54D27'
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['cpp'] = s:git_orange " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['c'] = s:git_orange " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['Makefile'] = s:git_orange " sets the color of css files to blue
"-------------------------------------------------"
