" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif





" Small tweaks here and there{{{
set path+=**		" Recursive path search
set number		" Line indexing
set title		" Display filename on title bar
set ignorecase		" Search case-insensitive
set smartcase		" Search case-sensitive when using capital letter
set hlsearch		" Highlight search results}}}

" Set leader key
let mapleader = ","

" Rebind esc 
noremap! <leader><leader> <esc>l"{{{
vnoremap <leader><leader> <esc>l
cabbrev <leader><leader> <esc>"}}}

" netrw file explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Template files
nnoremap <leader>html :-1read ~/.vim/templates/index.html<CR>3jwf>a"{{{
nnoremap <leader>lorem :-1read ~/.vim/templates/lorem.txt<CR>
nnoremap <leader>php :-1read ~/.vim/templates/bracket.php<CR>o
nnoremap <leader>flask :-1read ~/.vim/templates/flask.py<CR>"}}}

" Auto closing brackets in insert mode
inoremap " ""<left>"{{{
inoremap ' ''<left>

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

inoremap () ()
inoremap [] []
inoremap {} {}

inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O"}}}

" Wrap whole word in bracket or qoutes
inoremap <leader>" <esc>viw<esc>a"<esc>bi"<esc>leli{{{
inoremap <leader>' <esc>viw<esc>a'<esc>bi'<esc>leli
inoremap <leader>( <esc>viw<esc>a)<esc>bi(<esc>leli
inoremap <leader>[ <esc>viw<esc>a]<esc>bi[<esc>leli
inoremap <leader>{ <esc>viw<esc>a}<esc>bi{<esc>leli

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel"}}}

" Wrap whole text area in bracket or qoutes
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>{{{
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>"}}}

" Easier scrolling
nnoremap <C-k> <C-y>"{{{
nnoremap <C-j> <C-e>
inoremap <C-k> <C-x><C-y>
inoremap <C-j> <C-x><C-e>"}}}

" Quickly open and source vimrc"
nnoremap <leader>rc :vsplit $VIM/vimrc<cr>
nnoremap <leader>src :source $VIM/vimrc<cr>

" Easier splitting
nnoremap <leader>w <C-w>"{{{
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>j
nnoremap <leader>wo :only<cr>"}}}

" Useful abbreviations
iabbrev <leader>@ tuannguyendinh224@gmail.com

" Toggle relativenumber
inoremap <leader>re <esc>:set<space>relativenumber!<cr>a
nnoremap <leader>re :set<space>relativenumber!<cr>

" Auto indent at open and save
autocmd BufWritePre,BufRead *.html :normal gg=G

" Autocmd grouping 
:augroup filetype_js"{{{
:	autocmd!
:	autocmd FileType javascript nnoremap <buffer> <leader>/ I//<esc>
:	autocmd FileType javascript inoremap <buffer> <leader>/ <esc>I//
:augroup end"}}}
:augroup filetype_py"{{{
:	autocmd!
"":	autocmd FileType python nnoremap <buffer> <leader>/ I#<esc>:s/##<cr>
:	autocmd FileType python nnoremap <buffer> <leader>/ I#<esc>
:	autocmd FileType python inoremap <buffer> <leader>/ <esc>I#
:	autocmd FileType python iabbrev <buffer> try try:<cr>except:<esc><<O
:augroup end"}}}
:augroup filetype_vim"{{{
:	autocmd!
:	autocmd FileType vim setlocal foldmethod=marker
:augroup end"}}}
