if has("syntax")
	syntax on
endif

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
set nolazyredraw
nmap <END> :nohl<CR>

let mapleader = ","

hi link MiniTrailspace Search
hi link CocFloating Pmenu
hi link TagbarSignature TagbarHelp
hi FloatermBorder guifg=cyan

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Mofiqul/dracula.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'IngoMeyer441/coc_current_word'
Plug 'folke/tokyonight.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'mfussenegger/nvim-lint'
Plug 'folke/todo-comments.nvim'
Plug 'nvim-mini/mini.indentscope', { 'branch': 'stable' }
Plug 'nvim-mini/mini.pairs', { 'branch': 'stable' }
Plug 'nvim-mini/mini.animate', { 'branch': 'stable' }
Plug 'nvim-mini/mini.trailspace', { 'branch': 'stable' }
Plug 'nvim-mini/mini.move', { 'branch': 'stable' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sphamba/smear-cursor.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'projekt0n/github-nvim-theme'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


"NERDtree--------------------------------------"
nmap <F1> :Neotree position=float reveal toggle<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <Leader>bm :NERDTree<CR>
let g:NERDTreeWinSize=35
set wildignore+=*.o,*.obj,*.swp,*.DS_Store,tags*,*.d
let NERDTreeRespectWildIgnore=1
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" " Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" " Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" " Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" " Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"-----------------------------------------------"

"dracula-theme----------------------------------"
" neovim theme <dracula> 테마 적용
" show the ‘~’ characters after the end of buffers
colo dracula
let g:dracula_show_end_of_buffer = 1
" use transparent background
let g:dracula_transparent_bg = 1
" set custom lualine background color
hi CocFloating guibg=#3E4452
hi CocMenuSel guibg=#3E44a0
hi CocFloatDividingLine guibg=#3E4452
"-----------------------------------------------"

"floaterm------------------------------------------"
let g:floaterm_keymap_toggle = '<Leader>tt'
"--------------------------------------------------

"vim-airline-----------------------------------------""
let g:airline_theme = 'catppuccin'
let g:airline#extensions#gutentags#enabled = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
"-----------------------------------------------"

"nerdcommenter--------------------------------------------"
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

"nvim-treesitter------------------------------------------"
lua <<EOF
require'nvim-treesitter.install'.compilers = {'zig'}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"c", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
	enable = true,              -- false will disable the whole extension
	disable = { "" },  -- list of language that will be disabled
	-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- Instead of true it can also be a list of languages
	additional_vim_regex_highlighting = true,
  },
}
EOF
"---------------------------------------------------------"


"coc auto_select----------------------------------------------------------"
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

"coc-config-------------------------------------------------------------------"
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
nmap <silent> gs :vsplit<CR><Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

hi CocCursorRange guibg=#b16287 guifg=#ebdbdd
nmap <silent> <leader>mc <Plug>(coc-cursors-word)*
xmap <silent> <leader>mc y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

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

"telescope ---------------------------------------------------------------------------------------------------------"
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"tagbar------------------------------------------------------------------------------------------
nmap <F2> :TagbarToggle<CR>
let g:tagbar_width = 35
let g:tagbar_position = 'right'

lua <<EOF
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require'telescope'.setup {
  extensions = {
	fzf = {
	  fuzzy = true,                    -- false will only do exact matching
	  override_generic_sorter = true,  -- override the generic sorter
	  override_file_sorter = true,     -- override the file sorter
	  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
									   -- the default case_mode is "smart_case"
	}
  }
}
EOF
" --------------------------------------------------------------------------------------------------"

"coc_current_word ----------------------------------------------------------------------------------"
let g:coc_current_word_highlight_delay = 500
hi link CurrentWord IncSearch

lua <<EOF
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
EOF
" --------------------------------------------------------------------------------------------------"

lua <<EOF
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()

    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()

    -- You can call `try_lint` with a linter name or a list of names to always
    -- run specific linters, independent of the `linters_by_ft` configuration
    require("lint").try_lint("cspell")
  end,
})
EOF


"todo-comments ----------------------------------------------------------------------------------------"
lua <<EOF
require("todo-comments").setup({
{
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}
})
EOF

lua <<EOF
require('mini.indentscope').setup({})
EOF

lua <<EOF
require('mini.pairs').setup()
EOF

lua <<EOF
require('mini.animate').setup()
EOF

lua <<EOF
require('mini.trailspace').setup()
EOF

lua <<EOF
require('mini.trailspace').trim()
EOF

lua <<EOF
require('mini.move').setup()
EOF

lua require('smear_cursor').enabled = true

lua require('smear_cursor').setup({
	\cursor_color = "#ff8800",
	\stiffness = 0.3,
	\trailing_stiffness = 0.2,
	\damping = 0.5,
	\trailing_exponent = 5,
	\never_draw_over_target = true,
	\hide_target_hack = true,
	\gamma = 1
\})

lua <<EOF
require("neo-tree").setup({
  window = {
    mappings = {
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = true,
          -- use_image_nvim = true,
          use_snacks_image = true,
          -- title = 'Neo-tree Preview',
        },
      },
    }
  },
})
EOF

lua <<EOF
require("neo-tree").setup({
event_handlers = {
	{
		event = "neo_tree_buffer_enter",
		handler = function()
		vim.cmd("highlight! Cursor blend=100")
		end,
	},
	{
		event = "neo_tree_buffer_leave",
		handler = function()
		vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
		end,
	},
  },
})
EOF
