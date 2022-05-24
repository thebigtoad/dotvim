execute pathogen#infect()

if has('autocmd')
    filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

set background=dark
let g:molokai_original = 1
let g:rehash256 = 1

" Tomorrow-Night colour scheme varients
colorscheme Tomorrow-Night-Eighties

" Spelling
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
highligh clear SpellBad
highligh SpellBad cterm=underline ctermfg=009
" Set style for gVim
highligh SpellBad gui=undercurl

" Enable spell checking for git commits and markdown
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Enable dictionary auto-completion in Markdown files and Git Commit Messages
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

" Change the vertical split separator and clear its background so you just get
" a nice thin line
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

if has('gui_running')
    "set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline\ 9
    set guifont=Meslo\ LG\ M\ for\ Powerline\ 9
    " Hacky way to make gvim open maximised
    set lines=999 columns=999
endif

" change colour of brace matching highlight
highlight MatchParen cterm=bold ctermbg=none ctermfg=Red

" Set up system clipboard integration, so vim yanks write to system clipboard
" and pastes paste from system clipboard
" If 
"     :echo has(clipboard')' 
" returns 0, then do
"     sudo apt-get install vim-gtk
" to enable clipboard support
if has('clipboard') || has('ide')
    set clipboard=unnamedplus
endif


" Global settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set title
set nocompatible
" use /tmp for vim swap/undo/backups
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" keep 3 lines of context when scrolling
set scrolloff=3
set laststatus=2
set t_Co=256
set showmode
set showcmd
" Reduce delay waiting for a mapping/key code to complete
" e.g. if you have <leader>xy binding, then this is the time vim will wait for 
" the y to be pressed after the x. Also due to insert mode jk binding, you
" have to wait this time before you can type a k after a j.
set timeoutlen=750
set ttimeoutlen=50

" default tab/indent settings
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent

" searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Enable checking for a mode line in a file to set the indent specifically for
" a file
set modeline
set modelines=3

" Tab completion in command mode like zsh
set wildmenu
set wildmode=list:longest,list:full
set wildignore=.git,*.swp,*/tmp/*

if has('linebreak')
  set breakindent
  let &showbreak = '↳ '
  set cpo+=n
end


" Bespoke filetype handling
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" No smart indenting for python scripts
autocmd FileType python setlocal nosmartindent

" files to use an indent of 4 with
autocmd FileType groovy,python,java setlocal softtabstop=4 shiftwidth=4

" Add vertical column at the 8st char
autocmd FileType sh,bash,python,javascript setlocal colorcolumn=81
" Set the colour of the column
highlight ColorColumn ctermbg=236 guibg=lightgrey

" Stop vim-json or syntastic from setting the filetype of .template files to json                                                                                                                        
autocmd BufRead,BufNewFile *.template set filetype=text

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Treat other file types as zip files
autocmd BufReadCmd *.jar,*.xpi,*.jar,*.xpi,*.apk,*.crx call zip#Browse(expand("<amatch>"))

" Open .aliases files as sh files to get sh/bash syntax highlighting
autocmd BufRead,BufNewFile .aliases set filetype=sh


" Insert a newly generated UUID at the cursor position
command! Uuid execute "normal! i".system('uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"')


if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif


" Folding stuff
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Enable folding but open all folds on open
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
"autocmd BufEnter * silent! lcd %:p:h


"ale (Asynchronous Lint Engine)
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Stop ale from deselecting Ultisnips selections due to linting issues
let g:ale_lint_on_text_changed = 'normal'
" Stop ale from deselecting Ultisnips selections due to linting issues
let g:ale_lint_on_insert_leave = 0
" Don't lint on opening a file, as we may not intend to edit it.
let g:ale_lint_on_enter = 0
let g:ale_list_window_size = 5
let g:ale_lint_delay = 2000


"vim-markdown-preview
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let vim_markdown_preview_github = 1
" show preview on hotkey and with images
" doesn't seem to work
"let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<C-m>'


" vim-indent-lines
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:indentLine_char = '▏'
let g:indentLine_color_term = 237
let g:indentLine_fileType = [
  \ 'groovy', 
  \ 'java', 
  \ 'javascript', 
  \ 'json',
  \ 'python', 
  \ 'ruby', 
  \ 'sh', 
  \ 'vim',
  \ 'xml', 
  \ 'xsd', 
  \ 'xslt', 
  \ 'yaml'
  \ ]

" vim-json
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Stop vim-json concealing quotes
let g:vim_json_syntax_conceal = 0


" vim-air-line
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:airline_powerline_fonts = 1

" Don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0

" Put a buffer list at the top
let g:airline#extensions#tabline#enabled = 0

"let g:airline_inactive_collapse=1
"let g:airline_inactive_alt_sep=1 

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme = 'luna'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_symbols.space = "\ua0"

" Customise the vim-airline sections
"+-----------------------------------------------------------------------------+
"| A | B |                     C                            X | Y | Z |  [...] |
"+-----------------------------------------------------------------------------+

" remove separators for empty sections
"let g:airline_skip_empty_sections = 1

" Remove the vim mode from section A
let g:airline_section_a = ''
" Use file path relative to current dir (normally repo root)
let g:airline_section_c = '%f'
" <Position percentage> <line no>:<col no>
let g:airline_section_z = '%3p%% %l:%c'

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.whitespace = 'Ξ'


" Assorted key bindings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use space as the leader                                                                                                                                                          
map <space> <leader>

" Make <leader><leader> work
"map <space><space> <leader><leader>

" Maximise a window pane
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>

" Rebalance window panes
nnoremap <leader>= :wincmd =<cr>

" Swap j <=> gj and k <=> gk
" Ideavim doesn't like the 'v:' scope so only use the <expr> mapping if we
" are not in ideavim
if has('ide')
    nnoremap j gj
    nnoremap k gk
else
    " Also prevent the swap if a count has been prefixed, e.g. 10k
    " to move 10 lines down, thus 10 moves 10 actual lines, not 10 visual lines
    nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
    nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
endif
nnoremap gj j
nnoremap gk k

" K to split a line
nnoremap K i<CR><Esc>

" Now remap gJ to J for cases when we want to do the opposite
nnoremap gJ J

" Like gJ, but always remove spaces
fun! JoinSpaceless()
    execute 'normal gJ'

    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun

" Replace default J behaviour with one that doesn't add the extra space between
" joined lines
nnoremap J :call JoinSpaceless()<CR>

" Buffer cycling
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" Open new tab
noremap <leader>tn :tabnew<cr>
" Close tab
noremap <leader>tc :tabclose<cr>
" Use default mappings gt and gT for tabnext/tabprevious

" Y yanks to end of line
nmap Y y$

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Get rid of highlighting
noremap <leader>h :noh<CR>

" Quick global replace using * and #
nnoremap <leader>rg :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left><left>

" Insert the current git branch name, stripping the text after the issue
" number, e.g. inserts "gh-123 " if the branch is "gh-123-some-issue"
noremap <leader>i :-1read ![[ "$(pwd)" =~ .*/\.git ]] && cd ..; git rev-parse --abbrev-ref HEAD \| sed -E "s/^(gh-[0-9]+).*$/\1 /"<CR>A

" Hitting jk will jump out of insert mode
inoremap jk <esc>

" Toggle line wrapping
nnoremap <leader>w :set wrap!<cr>

" Make C-Space do the same as C-n. C-Space is seen by vim as C-@
inoremap <C-@> <C-n>

" toggle spell checking in the local buffer with F7
" There is an issue with Conoline hiding the spelling errors on the current
" line so turning on spelling current disables conoline. Temporary hack
" till I can work out how to fix it.
map <F7> :ConoLineToggle<CR>:setlocal spell! spelllang=en_gb<CR>


" Window split stuff
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" window split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vertical split
noremap <leader>v :vsp<CR><C-w><C-w>

" Horizontal split
noremap <leader>s :sp<CR><C-w><C-w>


" Insert shell colour constants for use in 'echo -e'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
noremap <leader>colours :set paste<CR>i#Colour constants for use in echo -e statements<CR>RED='\033[1;31m'<CR>GREEN='\033[1;32m'<CR>YELLOW='\033[1;33m'<CR>BLUE='\033[1;34m'<CR>NC='\033[0m' # No Colour<CR><ESC>:set nopaste<CR>
noremap <leader>blu i${BLUE}<ESC>
noremap <leader>red i${RED}<ESC>
noremap <leader>grn i${GREEN}<ESC>
noremap <leader>yel i${YELLOW}<ESC>
noremap <leader>nc i${NC}<ESC>
"insert an 'echo -e ""' and put it in insert mode in the quotes
noremap <leader>echo iecho -e ""<ESC>i


" GitGutter stuff
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Toggle gigGutter
noremap <leader>gg :GitGutterToggle<CR>

" Toggle gigGutter lines colouring
noremap <leader>gl ::GitGutterLineHighlightsToggle<CR>

let g:gitgutter_enabled = 1

" This block is a bit of a hack to fix colour problems with
" GitGutter signs as they were showing wih vimdiff background
" colours
hi myGitGutterAdd          ctermbg=none ctermfg=green
hi myGitGutterChange       ctermbg=none ctermfg=brown
hi myGitGutterDelete       ctermbg=none ctermfg=red
hi myGitGutterChangeDelete ctermbg=none ctermfg=brown
hi link GitGutterAdd          myGitGutterAdd
hi link GitGutterChange       myGitGutterChange
hi link GitGutterDelete       myGitGutterDelete
hi link GitGutterChangeDelete myGitGutterChangeDelete

" Change the gutter symbols
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = '⛔'


" line numbering
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set relativenumber
set number
if !has('nvim')

    "Toggle between line number states (relative|absolute|none)
    function! NumberToggle()
      if !exists("b:curr_num_state")
          let b:curr_num_state = "rel"
      endif

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


" Cursor keys == BAD!
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Prevent use of cursor keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Prevent use of cursor keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Prevent use of cursor keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Script to stop vim overwriting the default register
" when pasting over a visual selection
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! RestoreRegister()
    let @" = s:restore_reg
    if &clipboard == "unnamed"
        let @* = s:restore_reg
    elseif &clipboard == "unnamedplus"
        let @+ = s:restore_reg
    elseif &clipboard == "unnamed,unnamedplus"
        let @* = s:restore_reg
        let @+ = s:restore_reg
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
let g:NERDTreeChDirMode = 1
let NERDTreeShowHidden=1
" see if there is a way to toggle nerdtree in the current pane.
" May need some form of map of project root => nerd tree buffer to pick the
" right one
" https://github.com/scrooloose/nerdtree/issues/244
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
" Stop syntastic from checking java files
let g:loaded_syntastic_java_javac_checker = 1
" run shellcheck with the -x arg to make it follow sourced files
" needs a more recent version of shellcheck
" let g:syntastic_sh_shellcheck_args = "-x"
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["java"] }


"vim-markdown stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_toc_autofit = 1
let g:move_key_modifier = 'M'
" Specify languages to ssyntax highlight in markdown code blocks
let g:markdown_fenced_languages = [
            \ 'css', 
            \ 'javascript', 
            \ 'js=javascript', 
            \ 'json=javascript', 
            \ 'xml', 
            \ 'json', 
            \ 'html', 
            \ 'python', 
            \ 'bash=sh', 
            \ 'java']

" Don't break lines on words in markdown
autocmd Filetype markdown setlocal linebreak


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
"let g:ctrlp_map = '<leader>p'
"open ctrl-p in buffer mode
"nmap <leader>b :CtrlPBuffer<CR>
"open ctrl-p in most recently used mode
"nmap <leader>m :CtrlPMRU<CR>
"open ctrl-p in files mode in the root of git_work
"nmap <leader>gw :CtrlP ~/git_work<CR>

" FZF (FuzzyFinder)
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"un-comment and chnage this to make vim behave differently to FZF in the shell
"let $FZF_DEFAULT_COMMAND= 'ag --hidden -g ""'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Keyword'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Keyword'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

function! s:current_word()
  return expand('<cword>')
endfunction

"find files from the git root, rather than current dir
command! ProjectFiles execute 'Files!' s:find_git_root()

"find occurences from the git root, rather than current dir
command! WordOccurences execute 'Ag!' s:current_word() s:find_git_root()

" Use FZF to change current directory to a direct child of the passed
" directory
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
  \ {'source': 'find '.(empty(<f-args>) ? '.' : <f-args>).' -maxdepth 1 -type d -not -wholename "./.git*"',
  \  'sink': 'cd'}, 1))

"Use FZF/Ag to list occurances of current word (smart case match)
"nmap <leader>o :Ag! <C-R><C-w> call s:find_git_root()<CR>
nmap <leader>o :WordOccurences<CR>
"open FZF in lines mode
nmap <leader>l :Lines!<CR>
"open FZF in files mode, rooted at the current git root
nmap <leader>p :ProjectFiles<CR>
"open FZF in bUffer mode, <leader><leader> is a bit flaky so use
"<space><space>
nmap <space><space> :Buffers!<CR>
" Used to use this mapping for buffers so make it no-op to stop use.
nmap <leader>u <Nop>
"open FZF in history mode (Most recently used)
nmap <leader>m :History!<CR>
"open FZF in files mode in the root of git_work
nmap <leader>gw :Files! ~/git_work<CR>
" Use FZF to change current directory to one of the git repos in git_work
nmap <leader>d :Cd ~/git_work<CR>


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
nmap <leader>gs :Git<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gp :Git push<CR>
set diffopt+=vertical


"vim-sneak stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"enable smart streak mode
let g:sneak#streak = 1 
let g:sneak#label = 1
" Case sensitivity is determined by 'ignorecase' and 'smartcase'
let g:sneak#use_ic_scs = 1


"vim-easymotion
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Jump to lines above or below
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_startofline = 1 " keep cursor column when JK motion


" conoline.vim stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"use colour scheme's colours for normal mode
let g:conoline_use_colorscheme_default_normal=1

if &diff
    "in diff mode so disable conoline as it doesn't work with diff's colour
    "scheme
    let g:conoline_auto_enable = 0
else
    "enable conoline
    let g:conoline_auto_enable = 1
endif


" YouCompleteMe stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"s clear the black list so we also get completion, e.g. in markdown
"let g:ycm_filetype_blacklist = {}

" make YCM compatible with UltiSnips, and consistent with vim
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"let g:ycm_key_list_select_completion = ['<C-j>']
"let g:ycm_key_list_previous_completion = ['<C-k>']

"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]

" SuperTab
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:SuperTabDefaultCompletionType = '<C-n>'

" Ultisnips
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<C-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:BASH_Ctrl_j = 'off'
"let g:C_Ctrl_j = 'off'
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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


" vim-tmux-navigator stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


" vim-togglelist stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Prevent mapping <leader>l to the location list as this would clash with FZF
let g:toggle_list_no_mappings=1

" map <leader>q to toggle the quickfix window
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>


" vim-rooter stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin to change directory to the root of the repository

let g:rooter_silent_chdir = 1


" vim-easy-align stuff
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" comfortable-motion.vim
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:comfortable_motion_no_default_key_mappings = 1
"nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
"nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>
" motion proportional to window height
let g:comfortable_motion_impulse_multiplier = 1.5  " Feel free to increase/decrease this value.
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>


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


" plugin-less way of previewing markdown in vim but cant get it to work,
" came from https://www.reddit.com/r/vim/comments/8asgjj/topnotch_vim_markdown_live_previews_with_no/
"noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>

"function! OpenMarkdownPreview() abort
  "if exists('s:markdown_job') && job_status(s:markdown_job) == 'run'
    ":echom "stopping job"
    "call job_stop(s:markdown_job)
    "unlet s:markdown_job
  "endif
  "let s:markdown_job = job_start(['grip ', '.', shellescape(expand('%:p'))])
  ":echom 'grip ' . shellescape(expand('%:p'))
  ":echom job_status(s:markdown_job)
  ":echom s:markdown_job

  "if job_status(s:markdown_job) != 'run' | return | endif
  ""if s:markdown_job_id <= 0 | return | endif
  ":echom "opening url"
  "call system('open http://localhost:6419')
"endfunction


" vim: set shiftwidth=4 tabstop=4 expandtab:
