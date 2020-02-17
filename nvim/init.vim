"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Neovim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define python providers
let g:python_host_prog  = '/bin/python'
let g:python3_host_prog = '/bin/python3'

" met runtimepath^=~/.vim runtimepath+=~/.vim/afmer
" let &packpath = &runtimepath
" source ~/.vimrc
" set clipboard+=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  PLUGINS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" --- Workflow ---
Plug 'scrooloose/nerdTree'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'

" --- Git ---
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'justinmk/vim-sneak'

" --- Appareance ---
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'dracula/vim'

" --- Code completer ---
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Appareance 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula

" set nu rnu

" Load staus-line 
runtime! status-line.vim

set termguicolors

" Set numbers
" set nu

" Set indentation (Tab space) lenght, comment line for default
set softtabstop=4 shiftwidth=4 expandtab 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Workflow 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move through tabs with ctrl-l and ctrl-h 
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

"Ctr-D to open terminal in a tab in insert mode
noremap <C-d> :tabe term://fish<CR>:startinsert<CR>
" Esc to exit
" tnoremap <Esc> <C-\><C-n>:exit<Enter> 
tnoremap <Esc> <C-\><C-n>

" TagBar, show code functions and variables, really nice
nmap <C-T> :TagbarToggle<CR>

" NerdTree toggle with Ctr-n
nmap <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Code completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Required for operations modifying multiple buffers like rename.
set hidden

"""""""""""
" Instaled Language Servers
" --> (Rust) RLS
" --> (Python) pyls
" --> (Java) javacomplete2
"""""""""""

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" automatically close the preview window after a completion is made
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
" Java enable autocompletion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
