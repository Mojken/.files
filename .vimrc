filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'zxqfl/tabnine-vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

set expandtab
set tabstop=2
set shiftwidth=0
set smarttab
set autoindent
set autoread
set autowrite
set relativenumber
set number
set showcmd
set mouse=
set noerrorbells
colorscheme ron

"TabNine::config -- give it ustlusarmqedpzdyoipaqkzcizkxtm"

nnoremap <F1> :!clear; make test<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F10> :wq<CR>

au BufNewFile,BufRead *.c call CheckForCustomConfiguration()

function! CheckForCustomConfiguration()
    " Check for .vim.custom in the directory containing the newly opened file
    let custom_config_file = expand('%:p:h') . '/.vim.custom'
    if filereadable(custom_config_file)
        exe 'source' custom_config_file
    endif
endfunction
