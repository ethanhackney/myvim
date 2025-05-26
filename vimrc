execute pathogen#infect()

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
syntax enable
filetype plugin indent on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
let g:solarized_termcolors=256
colorscheme gruvbox

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set number		" number line
set expandtab		" use spaces instead of tabs

" make bpftrace scripts just copy js highlighting
au BufRead,BufNewFile *.bt set filetype=javascript

" leader
let mapleader = ","

" netrw config
let g:netrw_banner = 0       " no banner
let g:netrw_listtype = 3     " tree-style listing
let g:netrw_browse_split = 4 " open files in previous window
let g:netrw_altv = 1         " open splits to the right
let g:netrw_winsize = 25     " width of the explorer

" toggle file browser function
function! ToggleNetrw()
  for w in range(1, winnr('$'))
    if getbufvar(winbufnr(w), '&filetype') ==# 'netrw'
      execute w . 'wincmd w'
      close
      return
    endif
  endfor
  Vexplore
endfunction

" toggle file browser
nnoremap <leader>, :call ToggleNetrw()<CR>
