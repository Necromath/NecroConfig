" This is setup for vimwiki
" The prerequisites {{{
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_key_mappings = { 'table_mappings': 0, }
let g:vimwiki_list_ignore_newline = 0
" }}}
"{{{ Vimwiki projects go here.
"{{{ wiki_default
" let wiki_default = {}
" let wiki_default.path = '$HOME/necromath.github.io'
" let wiki_default.template_path = '$HOME/.config/nvim/templates'
" let wiki_default.template_default =  'Auburn'
" let wiki_default.template_ext = '.html'
" let wiki_default.path_html = '$HOME/necromath.github.io'
"}}}
"{{{ wiki_Math221_2020Fall
let g:vimwiki_list = [{
      \ 'path': '$HOME/necromath.github.io/',
      \ 'template_path' : '~/.config/nvim/Templates',
      \ 'template_default' : 'Github',
      \ 'template_ext': '.html',
      \ 'path_html': '$HOME/necromath.github.io'}]

"}}}
"{{{ Other setups
command! Diary VimwikiDiaryIndex
command! VimwikiDiaryTemplate :silent 0r !~/bin/generate-vimwiki-diary-template '%:t'
command! VimwikiDiaryCal :silent r !vimwikical
command! Html w|VimwikiAll2HTML
autocmd FileType vimwiki nnoremap <leader><leader> :Html <CR>
autocmd FileType vimwiki nnoremap <leader>rr GG:r !~/bin/GenReview.lua <CR>
autocmd FileType vimwiki set foldmethod=syntax
autocmd FileType vimwiki let @u='di(F[a[|Pf]xf]a]da('
" To enable TableModeEnable in vimwiki"
" https://github.com/dhruvasagar/vim-table-mode/issues/110
" let g:vimwiki_table_mappings=0
" let g:vimwiki_table_auto_fmt=0
au! BufEnter,BufRead,BufNewFile *.wiki set filetype=vimwiki
" }}}
