
call plug#begin()

Plug 'Valloric/YouCompleteMe'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
call plug#end()

" Settings {{{
set clipboard=unnamed
set nocompatible " Use vim settings
set modelines=0	" Prevent security hole

" All tabs are 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" General Settings
set visualbell                  " No bell
set t_vb=                       " No bell
set encoding=utf-8
set scrolloff=3                 " Allow text to scroll to center view when it's at the bottom of the document
set autoindent
set showmode
set showcmd                     " Show incomplete commands
set hidden                      " Open new file without being forced so save open buffer
set wildmenu
set wildmode=list:longest
" Ignore file types in autocomplete
set wildignore=*.pkl,*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.DS_Store,*.jpg,*.d,*.dia,*.imageset,*.png,*.ai,*/Pods/*,*.xcworkspace,*.xcodeproj,*/tmp/*,*.lock,*/xcodebuild/*,*.orig,*.rope*
set ruler                       " Show cursor position info in a line at the bottom
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set undofile                    " Preserve undo information between sessions
let mapleader = "," 
autocmd FileType vim autocmd BufEnter * set textwidth=0     " Force this on .vimrc which otherwise attempts to override and text textwidth=78
set textwidth=0
set formatoptions-=tc
set autoread                    " Automatically read from file whenever it's changed on disk

" in many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" History
"set nobackup		" prevent the ~ backup files from appearing on the filesystem
"set backup
"set writebackup
set swapfile
"set backupdir=~/.config/nvim/backup/
set directory=~/.config/nvim/swap/
set undodir=~/.config/nvim/undo/
set history=500		" keep 50 lines of command line history
set undolevels=500
set incsearch		" do incremental searching
" }}}
"
" " Keyboard Mappings {{{
" To find out what a key is mapped to execute :verbose map KEY, such as <C-h>
nnoremap <leader>ev :e $MYVIMRC<cr>
" Reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Open a new vertical split window and switch to it
nnoremap <leader>w <C-w>v<C-w>l
" Navigate splits the same way you navigate tmux panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set pastetoggle=<F2>    " Toggle paste mode to disable syntax changes to content that's pasted iv
" Go backward in jumplist
nnoremap <C-a> <C-i>
" Use 0 to jump to the first non-whitespace character on the line and ^ to go to the beginning of the line
nnoremap 0 ^
nnoremap ^ 0
" When accidently typing :q out of order, do what's expected rather than showing a list of commands I may have been thinking of
map q: :q

" Save a file that requires sudo privelage after you opened it
cmap w!! w !sudo tee % >/dev/null

" Search Settings
nnoremap / /\v
vnoremap / /\v
set ignorecase                      " Ignore case if all character in search string are lowercase
set smartcase                       " Case-sensitive search if at least one character is uppercase
set gdefault                        " By default, replace all occurences of a word on the line
" Highlight search results while typing
set incsearch
set showmatch
set hlsearch
" Remove search highlights with <leader><space>
nnoremap <leader><space> :noh<cr>
" Tab key matches bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Use semi-colon as colon key
" nnoremap ; :
" TODO: Make a shortcut that puts ; at the end of the current line
"nnoremap <leader>:

"These are to cancel the default behavior of d, D, c, C to put the text they delete in the default register. Note that this means e.g. "ad won't copy the text into register a anymore.  You have to explicitly yank it.
vnoremap i d \| :let @"=@c<cr>
nnoremap d "cd
vnoremap d "cd
nnoremap D "cD
vnoremap D "cD
nnoremap c "cc
vnoremap c "cc
nnoremap C "cC
vnoremap C "cC
nnoremap x "cx
vnoremap x "cx

vmap r "_dP       // Replace the selected text with what's in the yank register

" vim training
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Show/hide line numbers
nnoremap <leader>n :set number<cr>
nnoremap <leader>nn :set nonumber<cr>
nnoremap <leader>m :set relativenumber<cr>
nnoremap <leader>mm :set norelativenumber<cr>
" Cool ideas to show relative or absolute line numbers depending on current use
":au FocusLost * :set number
":au FocusGained * :set relativenumber
"autocmd InsertEnter * :set number

" Cut (Copy and then delete the current line)
nnoremap yd yydd<CR>
"vnoremap yd y \| d<CR>

" Jump to next and previous items in quickfix list
" Having either of these shortcuts enabled breaks selecting items in the quickfix list by
" pressing Enter
nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>

" }}}
"

" YouCompleteMe {{{

" I might want to use jedi-vim instead of YouCompleteMe for Python:
 "let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
 "let g:ycm_filetype_blacklist = { 'python' : 1 }

" Also consider using clang complete instead of YouCompleteMe for Objective-C
" since it currently supports multi argument methods. http://appventure.me/2013/01/29/use-vim-as-xcode-alternative-ios-mac-cocoa/

nnoremap <leader>d :YcmCompleter GoToDefinition <cr>
nnoremap <leader>s :YcmCompleter GoToDeclaration <cr>
"let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = '/Users/admin/.ycm_extra_conf.py'
:command! Errors :YcmDiag
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview " Don't show the window at the top with additional completion information
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_collect_identifiers_from_tags_files = 1   " Load completion identifiers from the ctags files as well.  ctags files in use can be found with `:echo tagfiles()`
let g:ycm_autoclose_preview_window_after_completion = 1 " Close the window at the top that appears with additional completion information
let g:ycm_autoclose_preview_window_after_insertion = 1
function! SetErrorsAndWarnings() " Only show the errors and warnings gutter if it's a file that I wrote
    let currentFilePath = expand('%:p')
    echo currentFilePath
    if currentFilePath =~ '/Dropbox/dev/'
        let g:ycm_show_diagnostics_ui = 1
    elseif currentFilePath =~ '/local'
        let g:ycm_show_diagnostics_ui = 1
    else
        let g:ycm_show_diagnostics_ui = 0
    endif
endfunction
" Execute the function before the file is opened so that it can be turned off in time for files that are be opened
"autocmd BufRead * call SetErrorsAndWarnings()
" Execute it on entering a buffer so that it can be turned on for files that were already read
"autocmd BufEnter * call SetErrorsAndWarnings()
let g:ycm_semantic_triggers =  {
  \   'objc' : ['re!\@"\.*"\s',
  \     're!\@\w+\.*\w*\s',
  \     're!\@\(\w+\.*\w*\)\s',
  \     're!\@\(\s*',
  \     're!\@\[.*\]\s',
  \     're!\@\[\s*',
  \     're!\@\{.*\}\s',
  \     're!\@\{\s*',
  \     "re!\@\'.*\'\s",
  \     '#ifdef ',
  \     're!:\s*',
  \     're!=\s*',
  \     're!,\s*', ],
  \ }
" }}}

let g:python3_host_prog = '/usr/bin/python3'

" defx.nvim
" 使用 ,e 切换显示文件浏览，使用 ,a 查找到当前文件位置
nnoremap <silent> <leader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <leader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	noremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> h defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> s defx#do_action('open', 'botright vsplit')
    nnoremap <silent><buffer><expr> i defx#do_action('open', 'botright split')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
endfunction

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

autocmd FileType defx call s:defx_mappings()

" buffer设置
set hidden " 避免必须保存修改才可以跳转buffer

" buffer快速导航
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>

" 查看buffers
nnoremap <Leader>l :ls<CR>

" 通过索引快速跳转
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" 显示行号
set relativenumber

" 高亮当前行和列
"set cursorcolumn
"highlight CursorColumn cterm=NONE ctermbg=darkblue ctermfg=green guibg=NONE guifg=NONE

set cursorline
"highlight CursorLine   cterm=NONE ctermbg=darkblue ctermfg=green guibg=NONE guifg=NONE
