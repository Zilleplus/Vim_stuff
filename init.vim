" ---- use the windows shortkeys like crtl-v and ctrl-c with the mouse
" source $VIMRUNTIME/mswin.vim
set mouse=a
" ---- enable line numbers
set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"stuff required when using nvim-qt
if exists('g:GuiLoaded')
    " call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
    GuiFont! Hack:h10:l
endif

nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"

syntax on


call plug#begin('~/.vim.plugged')

Plug 'drewtempelmeyer/palenight.vim' " colorscheme
Plug 'itchyny/lightline.vim' " lighting bar
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot' " syntax highlighting

Plug 'editorconfig/editorconfig-vim'
Plug 'markwoodhall/vim-nuget'
Plug 'vhdirk/vim-cmake'
Plug 'Chiel92/vim-autoformat'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': {-> mkdp#util#install()}}
Plug 'https://github.com/soramugi/auto-ctags.vim'
Plug 'kana/vim-submode'
Plug 'sakhnik/nvim-gdb', { 'do' : ':!./install.sh'}

"Plug 'neomake/neomake'

"Plug 'LumaKernel/coqpit.vim'
Plug 'whonore/Coqtail' 

Plug 'neovimhaskell/haskell-vim' " Nice haskell highlighting
" Plug 'parsonsmatt/intero-neovim' " very weird doesn seem to work at all,
" also it breaks the syntax highlighting
"
" autocomplete-> used by lsp 
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'

" Telescope related dependencies.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" SLIME:
Plug 'jpalardy/vim-slime', {'branch': 'main'}

Plug 'whonore/Coqtail' | Plug 'let-def/vimbufsync'

call plug#end()

" Palenight configuration
set background=dark
colorscheme palenight

"lightLine configuration
if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

" space is leader so overwrite the default stuff first.
nnoremap <SPACE> <Nop>
let mapleader=" "

" There must be a cleaner way to do this ..
if has("win32") || has ("win16")
    let vimStuffLocation = "~/AppData/Local/nvim/Vim_stuff/"
else
    let vimStuffLocation =  "~/.config/nvim/Vim_stuff/"
end
exec 'source' vimStuffLocation.'neoterm.vim'
exec 'source' vimStuffLocation.'langserver.vim'
exec 'source' vimStuffLocation.'hotkeysGeneral.vim'
exec 'source' vimStuffLocation.'coqpit.vim'
exec 'source' vimStuffLocation.'telescope.vim'
exec 'source' vimStuffLocation.'slime.vim'
exec 'source' vimStuffLocation.'submode.vim'
