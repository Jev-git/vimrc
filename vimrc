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
















" Start at line 77, for some lucks :3"

" Editor configs, small tweaks here and there
"/*{{{*/
let mapleader = ","
set path+=**		" Recursive path search
set number		" Line indexing
set relativenumber	" Display relative line
set title		" Display filename on title bar
set ignorecase		" Search case-insensitive
set smartcase		" Search case-sensitive when using capital letter
set hlsearch incsearch	" Highlight search results
set autoindent		" Auto indent on newline
set tabstop=4
set shiftwidth=4
set expandtab
let g:netrw_liststyle = 3
let g:netrw_banner = 0
"/*}}}*/

" Abbreviation list, for insert mode
"/*{{{*/
iabbrev <leader>@ tuannguyendinh224@gmail.com
"/*}}}*/

" Mappings
" For all FileType
"/*{{{*/

" Rebind esc 
"/*{{{*/
inoremap <leader><leader> <esc>
vnoremap <leader><leader> <esc>
cabbrev <leader><leader> <esc>
nnoremap <leader> <nop>
inoremap jk <esc>
"/*}}}*/

" Toggle: relativenumber, hlsearch
"/*{{{*/
inoremap <leader>re <esc>:set<space>relativenumber!<cr>a
nnoremap <leader>re :set<space>relativenumber!<cr>
inoremap <leader>hl <esc>:set<space>hlsearch!<cr>a
nnoremap <leader>hl :set<space>hlsearch!<cr>
"/*}}}*/

" Open and source vimrc"
"/*{{{*/
nnoremap <leader>rc :tabe $VIM/vimrc<cr>
nnoremap <leader>src :source $VIM/vimrc<cr>
"/*}}}*/

" Template files
"/*{{{*/
nnoremap <leader>lorem :-1read ~/.vim/templates/others/lorem.txt<CR>
"/*}}}*/

" Jump to markers: <++>
"/*{{{*/
inoremap <leader>m <esc>/<++><cr>4cl
nnoremap <leader>m /<++><cr>4cl
inoremap <leader>M <esc>?<++><cr>4cl
nnoremap <leader>M ?<++><cr>4cl
"/*}}}*/

" Remove markers: <++>
"/*{{{*/
inoremap <leader>rm <esc>mm/<++><cr>4x`ma
nnoremap <leader>rm mm/<++><cr>4x`m
inoremap <leader>rM <esc>mm?<++><cr>4x`ma
nnoremap <leader>rM mm?<++><cr>4x`m
"/*}}}*/

" Auto closing brackets in insert mode
"/*{{{*/
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

inoremap ) <right>
inoremap ] <right>
inoremap } <right>

inoremap {<CR> {<CR>}<space><++><ESC>O<tab>
inoremap (<CR> (<CR>)<space><++><ESC>O<tab>
inoremap [<CR> [<CR>]<space><++><ESC>O<tab>
"/*}}}*/

" Wrap whole word in bracket or qoutes
"/*{{{*/
inoremap <leader>" <esc>viw<esc>a"<esc>bi"<esc>leli
inoremap <leader>' <esc>viw<esc>a'<esc>bi'<esc>leli
inoremap <leader>( <esc>viw<esc>a)<esc>bi(<esc>leli
inoremap <leader>[ <esc>viw<esc>a]<esc>bi[<esc>leli
inoremap <leader>{ <esc>viw<esc>a}<esc>bi{<esc>leli

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
"/*}}}*/

" Wrap whole text area in bracket or qoutes
"/*{{{*/
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
"/*}}}*/

" Scrolling using j and k
"/*{{{*/
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>
inoremap <C-k> <C-x><C-y>
inoremap <C-j> <C-x><C-e>
"/*}}}*/

" Splitting windows
"/*{{{*/
nnoremap <leader>w <C-w>
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>j
nnoremap <leader>wo :only<cr>
"/*}}}*/

" Add newline from normal mode
"/*{{{*/
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j
"/*}}}*/

" Add/remove semicolon at end of line
"/*{{{*/
inoremap <expr> <leader>; getline('.') =~ ';$' ? "\<esc>mq\$x`qa" : "\<esc>mqA;\<esc>`qa"
nnoremap <expr> <leader>; getline('.') =~ ';$' ? "mq\$x`q" : "mqA;\<esc>`q"
"/*}}}*/

" Open new tab and switch tab
"/*{{{*/
nnoremap <leader>t :tabe<cr>
nnoremap gl gt
nnoremap gh gT
"/*}}}*/

" Find file with name
nnoremap <leader>f :find<space>

"/*}}}*/

" For specific FileType
"/*{{{*/

" Filetype Vim
" /*{{{*/
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldcolumn=4
augroup end
" /*}}}*/
" Filetype Html
"/*{{{*/
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <leader>html :-1read ~/.vim/templates/html/index.html<CR>3jwf>a
    autocmd FileType html inoremap <buffer> /> />
    autocmd FileType html inoremap <buffer> > ><esc>F<lyiwA</><esc>PF<i
augroup end
"/*}}}*/
" Filetype Javascript
" /*{{{*/
augroup filetype_js
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <leader>/ I//<esc>
	autocmd FileType javascript inoremap <buffer> <leader>/ <esc>I//
augroup end
"/*}}}*/
" Filetype Python
" /*{{{*/
augroup filetype_py
	autocmd!
    autocmd FileType python nnoremap <buffer> <leader>flask :-1read ~/.vim/templates/py/flask.py<CR>
	autocmd FileType python nnoremap <buffer> <leader>/ I#<esc>
	autocmd FileType python inoremap <buffer> <leader>/ <esc>I#
	autocmd FileType python iabbrev <buffer> try try:<cr>except:<esc><<O
augroup end
" /*}}}*/
" Filetype Php
"/*{{{*/
augroup filetype_php
    autocmd FileType php nnoremap <buffer> <leader>php :-1read ~/.vim/templates/php/bracket.php<CR>o
augroup end
"/*}}}*/

"/*}}}*/
