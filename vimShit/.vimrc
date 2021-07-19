call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'bluz71/vim-moonfly-colors'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:coc_global_extensions = ['coc-tsserver']

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_arrow_function = "⇒"

map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set autoindent
set smartindent

let g:moonflyCursorColor = 1
let g:moonflyUnderlineMatchParen = 1

let NERDTreeWinSize = 20

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("NT","NERDTree")
