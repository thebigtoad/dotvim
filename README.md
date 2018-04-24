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
* Substitute (formally 's') = `cl`
* Substitute line (formally 'S') = `cc`
* Fix line breaks in hard wrapped paragraph = `gqip`
* Increment/decrement a number = `<ctrl>a` / `<ctrl>x`
* Open quicklist = `:cw`

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
* Maximise a window pane = `<leader>-`
* Re-balance all window panes = `<leader>=`

### Spelling
* Turn on spell checking for the open buffer = `:setlocal spell spelllang=en_gb`
* Turn off spell checking for the open buffer = `:setlocal nospell`
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
* Open FZF in lines mode (lines in current buffer) = `<leader>l`
* Open FZF in files mode (filenames in current repo) = `<leader>p`
* Open FZF in buffers mode (filenames in open buffers) = `<leader>b`
* Open FZF in MRU mode (filenames in history or open buffers)= `<leader>m`

### vim-buffkill
* Delete currennt buffer (without closing pane) = `:BD`

### vim-easymove
* Search forward = `<leader><leader>w`
* Search back = `<leader><leader>b`

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
