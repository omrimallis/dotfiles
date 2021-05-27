"""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" Enable loading plugin/indent files for specifig file types
"""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
" Store ton of history
set history=1000
" Display the current mode
set showmode
" Show ruler
set ruler
" Show matching brackets
set showmatch
" Automatically change directory to that of current file
autocmd BufEnter * silent! lcd %:p:h
" Change the mapleader to ','
let mapleader = ","
" Allow selection of non-characters in visual selection mode
set virtualedit=block
" use the system clipboard"
set clipboard=unnamed
set tags=../tags,tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
set nu
" Allow mouse
if has('mouse')
    set mouse=a
endif
" Syntax higlighting
syntax on
" Show folding column
if has('foldcolumn')
    set foldcolumn=1
endif
" Highlight current line
set cursorline
" Wild Menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%<%t\ " Filename
set statusline+=%w%h%m%r " Options
set statusline+=\ [%{&ff}/%Y] " filetype
set statusline+=\ [%{getcwd()}] " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic indent
set cindent
" Ident "case" statements with their "switch"
set cinoptions+=:0
" Show 2 lines around the cursor
set scrolloff=2
" Move lines with C+[jk]. Re-indent after moving.
nnoremap <C-j> mz:m+<cr>`z==
nnoremap <C-k> mz:m-2<cr>`z==
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Insert new line
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
" Insert space
nnoremap <leader>a a <ESC>
nnoremap <leader>i i <ESC>

" Copy and paste to/from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Make ; a shortcut for :
nnoremap ; :

" Disable Ex mode
nnoremap Q <nop>

" Use four spaces instead of tabs
set shiftwidth=4
set tabstop=4
set expandtab

" Select last changed (or pasted) text
nnoremap gp `[v`]

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically reload .vimrc when saved.
au! BufWritePost .vimrc source %
" Open .vimrc for editing
nnoremap <Leader>v :e $MYVIMRC

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase
" Override 'ignorecase' if the search pattern contains upper case characters
set smartcase
" Higlight search
set hlsearch
" Search as you type
" set incsearch

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
	\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
	\gvy/<C-R><C-R>=substitute(
	\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
	\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
	\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
	\gvy?<C-R><C-R>=substitute(
	\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
	\gV:call setreg('"', old_reg, old_regtype)<CR>

" Get rid of search higlights
nmap <DEL> :nohlsearch<CR>

" Global search and replace in document
nmap S :%s///g<LEFT><LEFT><LEFT>
vmap S :s///g<LEFT><LEFT><LEFT>

" Map "Y" to copy till end of line (Like, 'S', 'D', 'C')
nmap Y y$

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn automatic backup off
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => CScope
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	" Use both cscope and ctag for 'ctrl-]'.
	set cscopetag

	" Check cscope befor ctags.
	set csto=0

    " Treat cscope file names as relative
    set cscoperelative

	" Show message when cscope DB added.
	" set cscopeverbose

	if filereadable("cscope.out")
		cscope add cscope.out
	elseif $CSCOPE_DB != ""
		cscope add $CSCOPE_DB
	endif

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Use pathogen to allow putting each plugin in seperate directory under
" ~/.vim/bundle
call pathogen#infect()


let g:solarized_termcolors=256
colorscheme solarized
set background=dark
