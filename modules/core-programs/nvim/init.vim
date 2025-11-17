" set color scheme
colorscheme catppuccin-mocha

" set leader key
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" nerdtree keybinds
nnoremap <C-e> :NERDTreeToggle<CR>

" tabs
nnoremap th :tabfirst<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap tl :tablast<cr>
nnoremap tn :tabnew<cr>
nnoremap tc :tabclose<cr>

" create horizontal window
nnoremap <c-w>h <c-w>s
