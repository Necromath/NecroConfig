"""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{"}}}
" Mauricio Montes'  nvim config: ~/.config/nvim/init.vim borrowed from Le Chen 
"""""""""""""""""""""" """""""""""""""""""""""""""""""
" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3
" Preferred basic settings:
" Fixes weird character problem in some devel versions neovim under tmux sesssion. This might go away in future.

"Default Configs

set guicursor="{{{

set foldmethod=marker
set nowrap
set spell
set spelllang=en
set guioptions+=a
set laststatus=2
set cursorline
set shiftwidth=2
set splitbelow
set splitright
set autochdir
set timeoutlen=800
set backspace=0

" set notermguicolors
if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE
endif
set termguicolors
set background=dark

" Tab related
set tabstop=2
set expandtab

" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set grepprg=rg\ --vimgrep
" The following is to copy to clipboard
set clipboard=unnamedplus
" The following is for tex_conceal
" set conceallevel=2

" set line number
set relativenumber
set number
set textwidth=100
set t_Co=256
set background=dark
" Remove white background of status line at bottom of nvim viewport (default is 2)

set nocompatible              " be iMproved, required
filetype on                   " required
syntax on " required"

set laststatus=2
" set encoding=UTF-8
set autoread


nnoremap qw :wq!<cr>
"{{{ Some setup for the temporary files}}}
" https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f
"}}}
"{{{ Some of my key bindings
" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" The following is for spelling by choosing the first hit
nnoremap ]ss ]sz=1<cr><cr>
nnoremap [ss [sz=1<cr><cr>

" the following is to automatically remove trailing white spaces
" https://vim.fandom.com/wiki/Remove_unwanted_spaces
" autocmd FileType tex,vimwiki,mail autocmd BufWritePre * %s/\s\+$//e
nnoremap <leader>s mm:%s/\s\+$//e<cr>'m

" Insert blank line above or below in the normal mode.
" https://vi.stackexchange.com/questions/3875/how-to-insert-a-newline-without-leaving-normal-mode
nnoremap <silent> oo :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> OO :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

nnoremap <leader>] :e #<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <silent>qq :q<CR>
" nnoremap <leader>qq :q!<CR>
nnoremap .m :set foldmethod=marker<CR>
" Insert new line without leaving Normal mode
" nnoremap <Leader>o o<Esc>
" nnoremap <Leader>O O<Esc>
" nmap <S-Enter> O<Esc>
" nmap <CR> o<Esc>

" The following is to input date and time by <F10>
" https://vim.fandom.com/wiki/Insert_current_date_or_time
nnoremap <F10> "=strftime("%Y-%m-%d %a %H:%M:%S")<CR>P
inoremap <F10> <C-R>=strftime("%Y-%m-%d %a %H:%M:%S")<CR>

" Map <leader> + 1-9 to jump to respective tab
let i = 1
while i < 10
  execute ":nmap <leader>" . i . " :tabn " . i . "<CR>"
  let i += 1
endwhile

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Visual move lines upwards or downwards
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" nnoremap <C-p> :GFiles<CR>
" nnoremap // :BLines<CR>
" nnoremap <leader>[ :FzfPreviewAllBuffers<CR>
nnoremap <leader>l :FzfPreviewBufferLines<CR>
" nnoremap <leader>[ :Buffers<CR>


" The following to lines really delete things without cut.
nnoremap <leader>d "_d
xnoremap <leader>d "_d
" Do not pollute my buffer by pasting
vnoremap <leader>p "_dP

nnoremap <leader>o :only<cr>
nnoremap <space><space> za
" {{{ toggle conceal level
" https://github.com/tpope/vim-unimpaired/issues/105
nnoremap =oe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
nnoremap [oe :setlocal conceallevel=<c-r>=&conceallevel > 0 ? &conceallevel - 1 : 0<cr><cr>
nnoremap ]oe :setlocal conceallevel=<c-r>=&conceallevel < 2 ? &conceallevel + 1 : 2<cr><cr>
"}}}
" Close all buffers except the current one
" https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one
noremap <leader>bd :%bd\|e#\|bd#<cr>\|'"

nnoremap gqp vip<CR>gqq<CR>
nnoremap br A<br><Esc>'.

nnoremap <leader>sop :source %<cr>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>el :vsplit  ~/.config/nvim/my_vim/LatexProject.vim<cr>
inoremap jk <esc>

"So I can move around in insert
" inoremap <C-k> <C-o>gk
" inoremap <C-h> <Left>
inoremap <C-b> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-d> <end>

" Here is an attempt to make vim more responsive
" set nocursorline
" set nocursorcolumn
" set scrolljump=5
" set lazyredraw
" set synmaxcol=180

" Open :UltiSnipsEdit
nnoremap <leader>ee :UltiSnipsEdit<CR>

map gf :e <cfile><CR>
" nnoremap gf <c-w>v :let mycurf=expand("<cfile>")<cr> :execute("e ".mycurf)<cr><c-w>p
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
"}}}
"{{{ Plug
" Use the following command to install and update plugin's
" :PluginInstall
" :PluginUpdate
" Delete a plugin then run
" :PlugClean{{{ Plugin
" set the runtime path to include Vundle and initialize
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim"
call vundle#begin()
    "Install plugins below, look for the Vundle Install
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'dracula/vim', { 'name': 'dracula' } 	    " Colorscheme
    Plugin 'vifm/vifm.vim'
    Plugin 'kamykn/spelunker.vim'
    Plugin 'vimwiki/vimwiki'
    Plugin 'preservim/nerdtree'
    Plugin 'tpope/vim-fugitive'
    Plugin 'altercation/vim-colors-solarized'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}
source ~/.config/nvim/my_vim/my_vimwiki.vim

"{{{ Choose colorscheme
set background=dark
" colorscheme solarized
" colorscheme gruvbox
" colorscheme badwolf
" colorscheme monokai
" colorscheme sublimemonokai
" colorscheme vitaminonec
" colorscheme one
" colorscheme nvcode
" colorscheme highlite
" colorscheme iceberg
colorscheme dracula
" colorscheme everforest
" let g:everforest_background = 'hard'
" let g:airline_theme = 'everforest'
" colorscheme OceanicNext
" colorscheme tokyonight
" colorscheme one-nvim
" vim.g.one_nvim_transparent_bg = true
" Make transparent background in vim
" hi Normal guibg=NONE ctermbg=NONE
syntax enable
" set background=dark
" set term=screen-256color
highlight Pmenu ctermbg=bg ctermfg=white guibg=DarkGreen
" highlight Pmenu ctermbg=black ctermfg=white guibg=Non
" highlight Pmenu ctermbg=black ctermfg=white guibg=Non
highlight PmenuSel ctermbg=DarkYellow ctermfg=white guibg=Non
" highlight CursorLine ctermbg=black
" highlight CursorColumn ctermbg=black
highlight CursorLine   ctermbg=DarkGray
highlight CursorColumn ctermbg=DarkGray
highlight Visual ctermbg=DarkGreen ctermfg=bg
highlight ColorColumn ctermbg=black
set foldmethod=marker

