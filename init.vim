" Plug-In Start
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim' " for file browsing
Plug 'neoclide/coc.nvim', {'branch': 'release'} " vim complete, grammar check
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " vim status line
Plug 'Raimondi/delimitMate' " for auto-complete brackets
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " for syntax highlight
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] } " for prettier on vim
Plug 'tpope/vim-fugitive' " for git
Plug 'sodapopcan/vim-twiggy' " for git too
Plug 'ryanoasis/vim-devicons' " for pretty dev icons
Plug 'turbio/bracey.vim' " for live preview html/css/js

Plug 'wakatime/vim-wakatime' " wakatime
Plug 'vimsence/vimsence' " Discord playing vim

call plug#end()

" NVIM settings
set nu
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set mouse=a

" NERDTree Config
nnoremap <silent><C-n> :NERDTreeToggle<CR> 
nnoremap <silent><S-n> :NERDTreeFocus<CR> 

" Compile & Run Code files
autocmd FileType c nnoremap <buffer> <F5> :w<CR>:term gcc % -o %:r && ./%:r && rm %:r <CR>

" airline config
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

" <Ctrl + j, k> 를 눌러서 이전, 다음 버퍼로 전환
nnoremap <silent><C-j> :bp<CR>
nnoremap <silent><C-k> :bn<CR>

" <F4>를 눌러 버퍼 닫고 이전 버퍼로 이동
nnoremap <silent><F4> :bp <BAR> bd #<Enter> " 현재 버퍼를 닫고 이전 버퍼로 이동

" <Shift + t>을 눌러 새로운 버퍼 생성
nnoremap <S-t> :enew<Enter>         " 새로운 버퍼를 연다

" delimitMate
let delimitMate_expand_cr=1

" prettier config
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" let g:prettier#autoformat_config_present = 1 " whether a config file can be
" found in the current/parent directory

" fugitive - vim/git config
nnoremap <space>gs :G status<CR>
nnoremap <space>gc :G commit -m
nnoremap <space>gl :G log<CR>
nnoremap <space>gp :Git push<CR>

" twiggy - vim/git branch config
nnoremap <space>gb :Twiggy<space>

" nvim-treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" vimsence config
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
" let g:vimsence_custom_icons = {'filetype': 'iconname'}
