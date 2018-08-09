"plugin zone (Vundle)
set nocompatible
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'nerdtree'
Plugin 'kylef/apiblueprint.vim'

call vundle#end()            " required
"plugin zone

syntax on
filetype plugin indent on

set laststatus=2
set ruler
set rulerformat=%30(%=%y\ %l,%c\ %P,totLine=%L%)

set nobackup " do not keep a backup file, use versions instead

function! FormatJSON()
	!python -m json.tool
endfunction

com! FormatJSON %!python -m json.tool

set hlsearch
set incsearch
set backspace=indent,eol,start

set list
set listchars=eol:¶,tab:\|\ ,trail:• 

set wildmenu
set wildmode=longest,full

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

endif " has("autocmd")

  set autoindent		" always set autoindenting on

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

colorscheme codedark

set number

nnoremap .h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
           \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
           \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Nerdtree Settings
" Configure Nerdtree to open at the same time that vim does
" Allow C-n to show or not Nerdtree panel
set mouse=a
autocmd VimEnter * NERDTree | wincmd p
map <C-n> :NERDTreeToggle<CR>
