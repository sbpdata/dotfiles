set nocompatible              " required
filetype off                  " required


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/AppData/local/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" ## PACKAGES RELATED TO R ##
" make nvim an R ide
Plug 'jalvesaq/Nvim-R'
" documentation w. leader-d
Plug 'rizzatti/dash.vim'
" linting
Plug 'vim-syntastic/syntastic'

"## PACKAGES RELATED TO PYTHON ##
" autocomplete for python
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
" auto indent
Plug 'vim-scripts/indentpython'
" should be able to send file, line to REPL
Plug 'jalvesaq/vimcmdline'

" TESTESTESTEST
Plug 'jpalardy/vim-slime'


" ## PACKAGES RELATED TO UI ##
" themes
Plug 'arcticicestudio/nord-vim'
" distraction free writing
Plug 'junegunn/goyo.vim'
" light line
Plug 'itchyny/lightline.vim'

" ## PACKAGES RELATED TO EDITOR
" auto completes " (, etc 
Plug 'jiangmiao/auto-pairs'
" file navigation, use :NERDtree
Plug 'scrooloose/nerdtree'
" git
Plug 'tpope/vim-fugitive'
" live git changes
Plug 'mhinz/vim-signify'
" Initialize plugin system
call plug#end()

" ### PYTHON SETTINGS ###
" To see autocomplete info and navigation, see 
" https://github.com/Shougo/deoplete.nvim/issues/416
" vimcmdline mappings
let cmdline_map_start          = '<leader>qq'

" ## R SETTINGS ##
" remapping the basic :: send line
nmap , <Plug>RDSendLine
" remapping selection :: send multiple lines
vmap , <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
vmap ,e <Plug>RESendSelection
" stop r assign
let R_assign_map = '<M-->'
" remap search key
nmap <silent> <leader>d <Plug>DashSearch<CR>
" linting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" lintr
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']

" ## EDITOR SETTINGS ##
" set leader to space
let mapleader = "-"
" signify
let g:signify_vcs_cmds = {
    \ 'git':      'git.exe diff --no-color --no-ext-diff -U0 -- %f',
    \ }


"## UI SETTINGS ##
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" line numbers
set nu
colorscheme nord
set t_Co=256

let g:slime_target = "neovim"
