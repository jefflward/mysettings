"------------------------------------------------------------------------------
" Welcome to Jeff's .vimrc!
"------------------------------------------------------------------------------
set viminfo='50,\"1000,f1,%,!,n/home/j.ward/.viminfo
set pt=<F6>       " Toggle paste mode during insert
                  " Useful for not auto indenting code
set backspace=2   " Backspace can join lines
set ruler                  " show cursor position
set hidden        " Save modification history for the buffer
set smartindent   " Actually Smart auto-spacing
set shiftwidth=3  " <Tab> at start of line tabs 4 chars
set tabstop=3     " Tabs are equal to 4 spaces
set softtabstop=3 " Tabs are equal to 4 spaces when automatically inserted
set et            " All tabs are filled with spaces
set background=dark
set number        " Show line numbers
"set mouse=a      " Enable the mouse

"imap jj <Esc>

set encoding=utf-8
set fileencodings=utf-8

set guifont=Courier_New:h10:cANSI

set complete=.,w,b,u,t  " :help ins-completion

"Navigate split screens with CTRL+jlhl
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h<C-W>|
map <C-L> <C-W>l<C-W>|
"Split screens equal size
map <C-E> <C-W>=
"Make current split screen the only screen open
map <C-E> <C-W>o

"Remove trailing whitespace and replace tabs with spaces
map ,s :%s;\(.*\) \+$;\1;g<CR>:%s;\t;   ;g<CR>

"------------------------------------------------------------------------------
" The rest of this is inherited
"------------------------------------------------------------------------------
set t_Co=8
set nottybuiltin
set nocompatible
set hls
"set smarttab           " <Tab> at start of line tabs <shiftwidth> chars
" The following eats gcc and SGI cc/CC
set errorformat=%f:%l:%m,\"%f\"\\,\ line\ %l\:\ %m
set magic                  " regular expressions the way I'm used to them
set nobackup            " don't clutter my account with *.bak!
set writebackup " keep a backup copy during the edit session
set incsearch           " Incremental search.
set joinspaces          " Join adds two spaces after a period.
" I use the One True Brace Style
set cinoptions=>s,{0,}0,?0,^0,:0,=s,p0,t0,+s,(0,)20,*30
" My <Del> key is screwed up
"set t_kD=
" Sometimes I edit code with really weird indentation, like *three*
" spaces and stuff like that...
set shiftround
" My message length preferences
set shortmess=mrnto
" I really hated this when Emacs did it ;)
set showmatch
" Oh I hate it when programs do things I didn't ask for
set nostartofline
" Setting the window title does not work good with screen
set title
set cindent

" Search path for files.  Matches whole subtree, up to 100 directories deep.
":set path=.,/home/j.ward/projects/

autocmd Filetype gitcommit setlocal spell textwidth=72

" Nice autocommands:
" Return to last known position in a file just after opening it
au BufReadPost * if line("'\"") | exe "normal '\"" | endif
" When editing my vimrc and exrc, the comment is "
autocmd BufEnter .vimrc,.exrc set com=:\"

function! ResetTitle()
    let &titleold = hostname() . " : " . substitute(getcwd(), $HOME, "~", '')
endfunction

au VimLeave * silent call ResetTitle()

" My highlighting stuff
syntax on
"so /home/j.ward/.vim/highlight.vim
colorscheme wombat

