" set color scheme
colorscheme catppuccin-mocha

" set leader key
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" nerdtree keybinds
nnoremap <C-e> :Neotree<CR>

" tabs
nnoremap th :tabfirst<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap tl :tablast<cr>
nnoremap tn :tabnew<cr>
nnoremap tc :tabclose<cr>

" window management
nnoremap <C-n> :vsplit<CR>
nnoremap <C-c> :q<CR>
nnoremap <DOWN> :wincmd j<CR>
nnoremap <UP> :wincmd k<CR>
nnoremap <LEFT> :wincmd h<CR>
nnoremap <RIGHT> :wincmd l<CR>

" enables relative numbering off lines
set relativenumber