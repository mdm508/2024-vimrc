set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Your plugings
Plugin 'vimwiki/vimwiki'
Plugin 'josuegaleas/jay'
Plugin 'vim-airline/vim-airline'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""
"    Plugin Configs
""""""""""""""""""""""""
" VIM WIKI
" """"""""
" Simple VimWiki configuration
let wiki = {}
let wiki.path = '~/vimwiki'
let vimwiki_auto_chdir = 1
" Set VimWiki diary to use weekly entries
let vimwiki_diary_rel_path = 'diary/'
let vimwiki_diary_frequency = 'weekly'
let vimwiki_caption_level = -1
" Diary at same level as wiki
let vimwiki_diary_rel_path = '../vimwiki_diary/'
"" Remapped commands
nnoremap html :VimwikiAll2HTML<CR>
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
"" Builds HTML, pushes to git (FIX LATER)
"command! Push execute 'VimwikiAll2HTML' | execute 'cd C:/Users/metta/Documents/GitHub/mdm508.github.io' | w | execute '!git add -A && git commit -m "Commit via Vim" && git push'


" """""""""""""""""
" JAY (Colorscheme)
" """""""""""""""""
set background=dark
colorscheme jay


""""""""""""""""""""""""
"    General Vimrc
""""""""""""""""""""""""
" Show line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight the current line
set cursorline
" Show matching brackets when the cursor is over them
set showmatch
" Enable auto-indenting
set autoindent
set smartindent
" Enable mouse support (helps with scrolling and selecting)
set mouse=a
" Show line and column numbers in the status line
set ruler
" Display incomplete commands in the lower-right corner
set showcmd
" Show partial command in the bottom bar
set wildmenu
" === Visual Preferences ===
" Use spaces instead of tabs, and set tab width
set expandtab
set tabstop=4
set shiftwidth=4
" Enable line wrapping at word boundaries
set linebreak
" Enable 24-bit (true color) mode
set termguicolors
" === Search Settings ===
" Highlight search results
set hlsearch
" Incremental search: show results as you type
set incsearch
" Ignore case when searching (use \C to force case-sensitive search)
set ignorecase
set smartcase
" === File Handling ===
" Enable persistent undo, so undo history persists after closing a file
set undofile
" Automatically reload the file if it is changed outside of Vim
set autoread
" Easier window navigation (Ctrl + hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Disable arrow keys to encourage using hjkl
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
" Auto-save when losing focus
autocmd FocusLost * :wa
" Enable clipboard to copy/paste between Vim and other programs
set clipboard=unnamedplus
" " Set textwidth to automatically break lines at 80 characters
set textwidth=80
" Enable automatic line wrapping while typing
set wrap
set linebreak


