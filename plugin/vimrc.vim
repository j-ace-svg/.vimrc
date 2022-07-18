
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
if !has('nvim')
  source $VIMRUNTIME/defaults.vim
endif

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Enable mouse support.
set mouse=n

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backupdir=~/.vim/backup " directory for backups
  set directory=~/.vim/swap " directory for swap files
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undodir=~/.vim/undo-dir " directory for undo files
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
  noh
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Autoindent
set autoindent expandtab tabstop=2 shiftwidth=2
set smartindent

let g:PHP_default_indenting = 1

" Custom commands
let mapleader = " "
nnoremap <Leader><Space> <Space>

" Insert Mode
inoremap jk <Esc>l
inoremap kj <Esc>l
inoremap <C-l> <Return>
inoremap GG <Esc>bgUiwea

  " Abbreviations
iab inrm inoremap
iab nnrm nnoremap
iab cmd command
iab <lt>L <lt>Leader

" Normal Mode
nnoremap J 5j
nnoremap K 5k
nnoremap g, ^
nnoremap g. $
nnoremap <Leader>j J<CR>

" Split mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>sh <C-w><
nnoremap <Leader>sk <C-w>+
nnoremap <Leader>sj <C-w>-
nnoremap <Leader>sl <C-w>>
nnoremap <Leader>sH <C-w>H
nnoremap <Leader>sJ <C-w>J
nnoremap <Leader>sK <C-w>K
nnoremap <Leader>sL <C-w>L

  " Tab mappings
nnoremap <silent> <Leader>tt :tabnew<CR>
nnoremap <silent> <Leader>tw :tabclose<CR>
nnoremap <silent> <Leader>tn :tabnext<CR>
nnoremap <silent> <Leader>tp :tabprev<CR>
nnoremap <silent> <Leader>to :tabo<CR>

  " Better scrolling
nnoremap <C-d> <C-y> 

  " Generic Leader mappings
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>e :Vex<CR>
nnoremap <silent> <Leader>/ :noh<CR>

" Command Mode
command O wincmd o
command Reload source ~/.config/nvim/init.vim

  " Abbreviations
cabb v vert
cabb b bel
cabb s split

" Plugins
PlugUpgrade
call plug#begin(stdpath('config') . '/plugged')
Plug 'github/copilot.vim'  
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
