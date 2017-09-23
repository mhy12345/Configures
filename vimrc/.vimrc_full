"Configure of Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Default Plugin
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
" Put your non-Plugin stuff after this line
"
"Old encoding setting...
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"Configure airline
let molokai_original=1
let g:airline_theme="molokai"
"始终显示状态栏
set laststatus=2
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置consolas字体"前面已经设置过
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"End

"YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:airline_powerline_fonts = 1

"Own configure
nnoremap <leader>f :YcmCompleter FixIt<CR>

function Compile()
	if &filetype == 'cpp'
		exec "!g++ % -o %< -g -Wall -Wextra -Wconversion -std=c++11"
	elseif &filetype == 'c'
		exec "!gcc % -o %< -g -Wall -Wextra -Wconversion"
	elseif &filetype == 'pas'
		exec "!fpc % -g"
	elseif &filetype == 'tex'
		exec "!xelatex '%'"
	elseif &filetype == 'java'
		exec "!javac %"
	elseif &filetype == 'scss'
		exec "!sass % > %<.css"
	endif
endfunction

function Debug()
	if &filetype == 'cpp' 
		exec "!gdb ./%<"
	elseif &filetype == 'tex'
		exec "!open './%<.pdf'"
	elseif &filetype == 'java'
		exec "!jdb %<"
	endif
endfunction

function Run()
	if &filetype == 'cpp'
		exec "!time ./%<"
	elseif &filetype == 'tex'
		exec "!open './%<.pdf'"
	elseif &filetype == 'java'
		exec "!java %<"
	elseif &filetype == 'ruby'
		exec "!ruby %"
	elseif &filetype == 'html'
		exec "!firefox %"
	elseif &filetype == 'php'
		exec "!php %"
	elseif &filetype == 'sh'
		exec "!bash %"
	endif
endfunction

set hlsearch
set mouse=a
set smartindent
set fdm=marker
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
syntax on
imap jj <esc>
map <F9> : call Compile() <CR>
map <F5> : call Debug() <CR>
map <F6> : call Run() <CR>
map <F8> : ! xcodebuild <CR>
map <F12> : ! subl ./% <CR>
map <F2> : ! python3 % <CR>
colors evening
