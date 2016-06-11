dotvim
======
vimrc and a bash script to pull various vim plugins from github

Installation
------------
Run:

    git clone git@github.com:thebigtoad/dotvim.git ~/.vim
 
To pull down or update all the plugins:

    ~/.vim/setupPlugins.sh

To use ack.vim you will need the perl tool 'Ack' which can be obtained from the packager manager as 'ack-grep', e.g. 

    suso apt-get install ack-grep

Run the following to update help with all the plugins

    :Helptags

Install the following font in linux, then set it as font for the terminal
    
    ~/.vim/bundle/fonts/Meslo/Meslo LG M Regular for Powerline.otf

Useful Vim commands, some of which may be specific to this vimrc
----------------------------------------------------------------

<leader> = \

Basic commands for installed plugins
------------------------------------

### NerdTree 
Toggle NerdTree = `<Leader>'`

### Nerd Commenter
Toggle comment state of current line or [count] lines = `[count]<Leader>c<space>`

Yank then comment current line or [count] lines = `[count]<Leader>cy`

### Ctrl-P
Open Ctrl-P = `<ctrl-p>`

### vim-easymove
Search forward = `<Leader><Leader>w`

Search back = `<Leader><Leader>b`

### vim-fugitive
Git status = `:Gst`

Git diff = `:Gdiff`

Git blame = `:Gblame`

Git pull = `:Gpull`

Git push = `:Gpush`


In the git status window

Add/remove file from git index = -

Commit = cc

Diff the file under cursor = D

### vim-surround
[Where * = ", ', [, {, (, t ]

Surround word from cursor = ysw*

Surround word from anywhere in the word = ysiw*

Delete surround from inside it = ds

Change surround = ds12 (1=old surround, 2=new, e.g. cs[{ )

Surround visual selection = S*

### vim-move
Move line/selection up = <alt-k>
Move line/selection down = <alt-j>

### vim-abolish (Coercion)
Make word under cursor camelCase = crc
Make word under cursor MixedCase = crm
Make word under cursor snake_case = crs
Make word under cursor SNAKE_UPPERCAE = crU
Make word under cursor dot.case = cr.

### vim-markdown
Go to next header = ]]
Go to previous header = [[
Go to current header = ]c
Go to parent header = ]u (i.e. 'up')

### tabular
Convert space delimited selection to tabular form = :Tabu / 
