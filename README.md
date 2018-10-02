# dotvim
vimrc and a bash script to pull various vim plugins from github

## Installation
Run:

    git clone git@github.com:thebigtoad/dotvim.git ~/.vim
 
To use ack.vim you will need 'Ack' and 'ag' 

    sudo apt-get install ack-grep silversearcher-ag

To pull down or update all the plugins:

    ~/.vim/setupPlugins.sh

Run the following to update help with all the plugins

    :Helptags

Install the following font in linux, then set it as font for the terminal
    
    ~/.vim/bundle/fonts/Meslo/Meslo LG M Regular for Powerline.otf

## Useful Vim commands, some of which may be specific to this vimrc

**Note:** The '|' character in an example indicates cursor position.

* Leader key = `<space>`
* Escape key = `jk` or `kj`

* Substitute (formally 's') = `cl`
* Substitute line (formally 'S') = `cc`
* Fix line breaks in hard wrapped paragraph = `gqip`
* Increment/decrement a number = `<ctrl>a` / `<ctrl>x`
* Generate a UUID as the cursor position = `:Uuid`
* Toggle line wrapping = `<leader>w`
* Hide search highlighting = `<leader>h`
* Toggle line numbering (relative|absolute|none) = `<ctrl>n`

### Buffers
* Next buffer = `<Tab>`
* Previous buffer = `<S-Tab>`

### Navigation
* Jump to last character = `g_`
* Jump backwards/forwards in jump list = `<ctrl>o` / `<ctrl>i`

### Folds
* Turn on syntax based folding = `:setlocal foldmethod=syntax`
* Open fold under cursor = `zo`
* Close fold under cursor = `zc`
* Toggle fold under cursor = `za`
* Open all folds under cursor = `zO`
* Set fold level 0-9 = `z0` - `z9`

### Windows
* Vertical split = `<leader>v`
* Horizontal split = `<leader>h`
* Maximise a window pane = `<leader>-`
* Re-balance all window panes = `<leader>=`
* Toggle quickfix window = `<leader>q`
* Navigate between window panes = `<ctrl>h` / `<ctrl>j` / `<ctrl>k` / `<ctrl>l`

### Spelling
* Toggle spell checking for the open buffer = `F8`
* Next spelling mistake = `]s`
* Previous spelling mistake = `[s`
* Add word under cursor to word list = `zg`
* Suggest spelling for word under cursor = `z=`

## Basic commands for installed plugins

### NerdTree 
* Toggle NerdTree = `<leader>'`

### Nerd Commenter
* Toggle comment state of current line or [count] lines = `[count]<leader>c<space>`
* Yank then comment current line or [count] lines = `[count]<leader>cy`

### vim-sneak
* Search forward for 'xx' = `sxx`
* Search backward for 'xx' = `Sxx`
* Delete up to 'xx' = `dzxx`

### FZF
* Open FZF in lines mode (all lines in open buffers) = `<leader>l`
* Open FZF in files mode (filenames in current git repo) = `<leader>p`
* Open FZF in buffers mode (filenames in open buffers) = `<leader>b`
* Open FZF in MRU mode (filenames in history or open buffers) = `<leader>m`
* Use FZF to select a sub-directory of ~/git_work and _cd_ to it = `<leader>d`

### vim-buffkill
* Delete currennt buffer (without closing pane) = `:BD`

### vim-easymove
* Search forward = `<leader><leader>w`
* Search back = `<leader><leader>b`

### vim-expand-region
* Expand selection around cursor = `+`
* Shrink selection around cursor = `_`

### vim-fugitive
* Git status = `:Gst` or `<leader>gs`
* Git diff = `:Gdiff` or `<leader>gd`
* Git blame = `:Gblame` or `<leader>gb`
* Git pull = `:Gpull`
* Git push = `:Gpush` or `<leader>gp`

#### git status window
* Add/remove file from git index = `-`
* Commit = `cc`
* Diff the file under cursor = `D`
* Insert issue from git branch name (e.g. _gh-123_) = `<leader>i`

### git-gutter
* Toggle git-gutter = `gg`

#### gv.vim (git log viewer)
* View commit log = `:GV`
* View commit log (current file ony) = `:GV!`
* Open commit or range of commits = `o` or `<CR>`

#### vim-twiggy (git branch viewer/manger)
* Open Twiggy = `:Twiggy`
* Checkout a branch = `c`
* Merge selected branch into current branch = `m`
* Fetch selected branch = `F`
* Delete a branch = `dd`
* Push `^`
* Pull `V`
* Show commits for branch under cursor = `gl`
* Show commits from branch under cursor to current branch = `gL`
* Quit = `q`

### vim-surround
[Where * = ", ', [, {, (, t ]

* Surround word from cursor = `ysw*`
* Surround word from anywhere in the word = `ysiw*`
* Delete surround from inside it = `ds`
* Change surround = `cs12` (1=old surround, 2=new, e.g. cs[{ )
* Surround visual selection = `S*`

### vim-move
* Move line/selection up = `<alt-k>`
* Move line/selection down = `<alt-j>`

### vim-abolish (Coercion)
* Make word under cursor camelCase = `crc`
* Make word under cursor MixedCase = `crm`
* Make word under cursor snake_case = `crs`
* Make word under cursor SNAKE_UPPERCAE = `crU`
* Make word under cursor dot.case = `cr.`

### vim-markdown
* Open Table of contents = `:Toc`
* Go to next header = `]]`
* Go to previous header = `[[`
* Go to current header = `]c`
* Go to parent header = `]u` (i.e. 'up')
* Open link in vim for editing = `ge`

### tabular
* Convert space delimited selection to tabular form = `:Tabu / ` 
* Format a markdown table = `:Tabu /|` 

### vim-textobj-function
* Text object for a java function = `af` / `if`

### vim-textobj-css
* Text object for a css class = `ac` / `ic`

### vim-textobj-variable-segments
* Text object for a variable segment = `av` / `iv`

e.g 'MY_VARI|ABLE_NAME' and `dav` becomes 'MY_NAME'
