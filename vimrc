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

let g:vimwiki_path = '~/vimwiki'
let g:vimwiki_auto_chdir = 1
" Set VimWiki diary to use weekly entries
let g:vimwiki_diary_frequency = 'monthly'
let g:vimwiki_caption_level = -1
" Diary at same level as wiki
let g:vimwiki_diary_rel_path = '../vimwiki_diary/'
" html output will go to this area
let g:vimwiki_path_html = '~/vimwiki'


let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,audio controls,audio'
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



function! GitAutoPush(repo_path)
  "echom "GitAutoPush started for " . a:repo_path

  " Save the current working directory
  let l:current_dir = getcwd()
  "echom "Current directory: " . l:current_dir

  " Change to the repository directory
  execute 'cd ' . fnameescape(a:repo_path)
  "echom "Changed directory to " . getcwd()

  " Stage all changes
  let l:add_output = system('git add . 2>&1')
  "echom l:add_output

  " Check if there are changes to commit
  let l:status = system('git status --porcelain')
  if empty(l:status)
    "echom "No changes to commit in " . a:repo_path
  else
    " Commit the changes with a timestamped message
    let l:commit_message = "Auto-update from VimWiki: " . strftime("%c")
    let l:commit_output = system('git commit -m "' . l:commit_message . '" 2>&1')
  ""  echom l:commit_output
    " Push the changes to GitHub
    let l:push_output = system('git push origin main 2>&1')
    echom l:push_output
  endif

  " Return to the original working directory
  execute 'cd ' . fnameescape(l:current_dir)
 " echom "Returned to " . getcwd()
endfunction


" Autocommands
autocmd BufWritePost ~/vimwiki_diary/* call GitAutoPush('/home/matt/vimwiki_diary')

"for testing
"autocmd BufWritePost ~/vimwiki/* call GitAutoPushWiki('/home/matt/vimwiki')

function! GitAutoPushWiki(repo_path)
   " Delete the public HTML files (adjust the path as needed)
    execute 'cd' a:repo_path
    " Generate HTML files using Vimwiki command
    if &filetype=='vimwiki'
        VimwikiAll2HTML
        echo "Rebuilt Vimwiki HTML."
    else
        echo "Not in a Vimwiki file. Skipping rebuild and push."
    endif
    call GitAutoPush(a:repo_path)
endfunction




"autocmd BufWritePost ~/vimwiki/* call GitAutoPushWiki('/home/matt/vimwiki')
command! Push call GitAutoPushWiki('/home/matt/vimwiki')

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

set guifont=Liberation\ Mono\ 21
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
set textwidth=120
" Enable automatic line wrapping while typing
"set wrap
"set linebreak


