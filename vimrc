execute pathogen#infect()

if has('autocmd')
    filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif


set background=dark
"molokai colour scheme
"colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"Tomorrow-Night colour scheme varients
"colorscheme Tomorrow-Night
colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night-Bright

if has('gui_running')
    set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline
endif

" change colour of brace matching highlight
highlight MatchParen cterm=bold ctermbg=none ctermfg=Red

" set up tab spacing
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set smartindent

autocmd FileType python setlocal nosmartindent

" searching
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set ignorecase
set smartcase
set incsearch
set hlsearch

set title
set nocompatible

"keep 3 lines of context when scrolling
set scrolloff=3

set ttimeoutlen=50
set laststatus=2
set t_Co=256
set showmode
set showcmd

" Markdown specific settings
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Don't break lines on words in markdown
autocmd Filetype markdown setlocal linebreak


" live life on the edge - don't create swap files
set noswapfile

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

" Folding stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" enable folding but open all folds on open
set foldenable
set foldmethod=indent
if has("autocmd")
    au BufRead * normal zR
endif

autocmd Filetype gitcommit setlocal nofoldenable
autocmd Filetype markdown setlocal foldenable

" Set fold level                                                                                                                                                                  
nmap z0 :set foldlevel=0<CR>
nmap z1 :set foldlevel=1<CR>
nmap z2 :set foldlevel=2<CR>
nmap z3 :set foldlevel=3<CR>
nmap z4 :set foldlevel=4<CR>
nmap z5 :set foldlevel=5<CR>
nmap z6 :set foldlevel=6<CR>
nmap z7 :set foldlevel=7<CR>
nmap z8 :set foldlevel=8<CR>
nmap z9 :set foldlevel=9<CR>

" Set the current working directory to that of the active file
autocmd BufEnter * silent! lcd %:p:h


"vim-markdown-preview
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let vim_markdown_preview_github = 1
let vim_markdown_preview_hotkey='<C-m>'




" vim-air-line
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:airline_powerline_fonts = 1

" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0

" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnametruncate = 20
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme = 'luna'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_symbols.space = "\ua0"

" prefix the filename (%t) with the current working dir, max 30chars
let g:airline_section_c = '%-0.30{getcwd()}/%t'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Assorted key bindings
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"Use space as the leader                                                                                                                                                          
map <space> <leader>

"Specific mapping for easymotion
map <space><space> <leader><leader>


"Swap j <=> gj and k <=> gk
"Also  prevent the swap if a count has been prefixed, e.g. 10k
"to move 10 lines down, thus 10 moves 10 actual lines, not 10 visual lines
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap gj j
nnoremap gk k

" K to split a line
:nnoremap K i<CR><Esc>

"buffer cycling
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"Y yanks to end of line
nmap Y y$

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Get rid of highlighting
noremap <leader>h :noh<CR>

" Hitting jk will jump out of insert mode
inoremap jk <esc>

"make C-Space do the same as C-n. C-Space is seen by vim as C-@
inoremap <C-@> <C-n>

" toggle spell checking in the local buffer with F7
" There is an issue with Conoline hiding the spelling errors on the current
" line so turning on spelling current disables conoline. Temporary hack
" till I can work out how to fix it.
map <F7> :ConoLineToggle<CR>:setlocal spell! spelllang=en_gb<CR>


" Window split stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" window split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vertical split
noremap <leader>v :vsp<CR><C-w><C-w>

" Horizontal split
noremap <leader>s :sp<CR><C-w><C-w>


" GitGutter stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Toggle gigGutter
noremap <leader>gg :GitGutterToggle<CR>

" Toggle gigGutter lines colouring
noremap <leader>gl ::GitGutterLineHighlightsToggle<CR>

let g:gitgutter_enabled = 1


"line numbering
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set relativenumber
set number
if !has('nvim')
    if !exists("b:curr_num_state")
        let b:curr_num_state = "rel"
    endif

    "Toggle between line number states (relative|absolute|none)
    function! NumberToggle()
      if(b:curr_num_state ==# "rel")
        set number
        set norelativenumber
        let b:curr_num_state = "abs"
      elseif(b:curr_num_state ==# "abs")
        set nonumber
        set norelativenumber
        let b:curr_num_state = "none"
      else
        set relativenumber
        set number
        let b:curr_num_state = "rel"
      endif
    endfunc

    nnoremap <C-n> :call NumberToggle()<cr>
endif


"Cursor keys == BAD!
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Prevent use of cursor keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Prevent use of cursor keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>


"Script to stop vim overwriting the default register
"when pasting over a visual selection
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" I haven't found how to hide this function (yet)
function! RestoreRegister()
    let @" = s:restore_reg
    if &clipboard == "unnamed"
        let @* = s:restore_reg
    endif
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()


"NERDTree
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let NERDTreeQuitOnOpen = 1
nnoremap <leader>' :NERDTreeToggle<cr>


"syntastic settings
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1


"vim-markdown stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_toc_autofit = 1
let g:move_key_modifier = 'M'
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'xml', 'json']


"vim-move
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if !has('nvim')
    execute "set <M-j>=\ej"
    nnoremap <M-j> j
    execute "set <M-k>=\ek"
    nnoremap <M-k> k
endif


" ctrl-p
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<leader>p'


"ack.vim
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<Left>
"Immediately search for the word under the cursor in a new tab
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>


" ag - The Silver Searcher
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if executable('ag')
  " Use ag instead of ack
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"fugitive (git) stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap <leader>g :Gstatus<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gp :Gpush<CR>
set diffopt+=vertical


"vim-sneak stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"enable smart streak mode
let g:sneak#streak = 1 


" conoline.vim stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"use colour scheme's colours for normal mode
let g:conoline_use_colorscheme_default_normal=1

" YouCompleteMe stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" clear the black list so we also get completion, e.g. in markdown
let g:ycm_filetype_blacklist = {}

" vim-expand-region stuff                                                                                                                                                         
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                                                                                      
let g:expand_region_text_objects_xsd = {                                                                                                                                          
      \ 'iw' :0,
      \ 'iW' :0,
      \ 'iq' :0,
      \ 'aq' :0,
      \ 'i>' :0,
      \ 'a>' :0,
      \ 'it' :1,
      \ 'at' :1,
      \ }
                                                                                                                                                                                  
let g:expand_region_text_objects_xml = {
      \ 'iw' :0,
      \ 'iW' :0,
      \ 'iq' :0,
      \ 'aq' :0,
      \ 'i>' :0,
      \ 'a>' :0,
      \ 'it' :1,
      \ 'at' :1,
      \ }
      
let g:expand_region_text_objects_markdown = {
      \ 'iw' :0,
      \ 'iW' :0,
      \ 'ib' :0,
      \ 'ab' :0,
      \ 'iq' :0,
      \ 'aq' :0,
      \ 'i_' :0,
      \ 'a_' :0,
      \ 'i`' :0,
      \ 'a`' :0,
      \ 'is' :0,
      \ 'as' :0,
      \ 'ip' :0,
      \ 'ap' :0,
      \ }

"neovim specific stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if has('nvim')
    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    if &listchars ==# 'eol:$'
        set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif
    " Show problematic characters.
    set list

    " Also highlight all tabs and trailing whitespace characters.
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    match ExtraWhitespace /\s\+$\|\t/

    "ESC to get out of terminal mode
    :tnoremap <Esc> <C-\><C-n>

    "switch windows without escaping
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
endif
