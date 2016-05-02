" Plugins {{{
" Plugin manager provided by: https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/Raimondi/delimitMate'
" Don't use deoplete. It was interupting typing too much
" Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/benekastah/neomake'
Plug 'https://github.com/jeetsukumaran/vim-indentwise'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/junegunn/vim-peekaboo.git'
Plug 'https://github.com/kana/vim-arpeggio'
Plug 'https://github.com/kana/vim-smartword'
Plug 'https://github.com/kana/vim-submode'
Plug 'https://github.com/kana/vim-textobj-indent'
Plug 'https://github.com/kana/vim-textobj-line'
Plug 'https://github.com/kana/vim-textobj-underscore'
Plug 'https://github.com/kana/vim-textobj-user.git'
Plug 'https://github.com/kassio/neoterm'
Plug 'https://github.com/kshenoy/vim-signature.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'https://github.com/nelstrom/vim-textobj-rubyblock.git'
Plug 'https://github.com/osyo-manga/vim-monster.git'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/rust-lang/rust.vim.git'
" Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-haml'
Plug 'https://github.com/tpope/vim-obsession'
Plug 'https://github.com/tpope/vim-rails'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'https://github.com/zeekay/vimtips.git'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'https://github.com/haya14busa/incsearch.vim'
Plug 'https://github.com/ecomba/vim-ruby-refactoring'
Plug 'https://github.com/tommcdo/vim-exchange.git'
Plug 'https://github.com/AndrewRadev/switch.vim.git'
Plug 'AndrewRadev/sideways.vim'
Plug 'tek/vim-fieldtrip'
call plug#end()
" }}}

runtime macros/matchit.vim
call arpeggio#load()

" Basics Settings {{{
scriptencoding utf-8

filetype indent plugin on
syntax sync fromstart

" tree style listing
let g:netrw_liststyle=3
let g:netrw_altfile=1

" misc
set directory=~/tmp
set foldmethod=syntax
set foldlevelstart=99
set incsearch
set number
set norelativenumber
set showcmd
set virtualedit=block
" Case sensitivity
" I tried this while ignoring case and it was driving me crazy
set noignorecase
set smartcase

" No tmp or swp files
set nobackup
set nowritebackup
set noswapfile

" System clipboard
set clipboard+=unnamedplus

" allow unsaved buffers to be hidden
set hidden
" }}}

" Look and Feel {{{
set background=dark
" Make sure to set iTerm to xterm-256color
let g:solarized_termcolors=16
let g:solarized_termtrans=0
colorscheme solarized

" set fillchars=diff:⣿,vert:\│
set fillchars=diff:-,vert:\│
set listchars=nbsp:+,trail:*,precedes:<,extends:>,tab:>\
set splitbelow
set splitright

" Don't try to highlight lines longer than X
set synmaxcol=1000

" Sensible window sizes
set winheight=10
set winwidth=80
set winminheight=5
set winminwidth=15

" no background on vertical split
highlight VertSplit cterm=bold ctermfg=11 ctermbg=NONE

" text wrapping
set textwidth=80
set linebreak     " break at whitespace
set nolist        " list disables linebreak
set nowrap
set lazyredraw
set breakindent
set breakindentopt=sbr
set showbreak=↪>\  " ↪ space
set autoindent smartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set whichwrap+=<,>,h,l,[,]

" Sensible side scrolling, makes it like other editors.
" And can see more text at a
set sidescroll=1
set sidescrolloff=3

" Completion options
"   current buffer, windowed buffers, other loaded bufferes, and tags.
"   different from default by NOT considering unloaded buffers.
set complete=.,w,b,t
set completeopt=menuone,preview
" }}}

" Airline {{{
let g:airline#extensions#tabline#left_alt_sep = '|'
" no more top bar. lets see if we can live without it.
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 0
let g:airline_theme='solarized'
let g:airline_section_x=''
let g:airline_section_y=''
let g:vim_markdown_fenced_languages=['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'rb=ruby']
" }}}

" NeoVim {{{
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <Esc><Esc> <C-\><C-n>
  augroup neovim_stuff
    au!
    autocmd BufWinEnter,WinEnter term://*
      \ setlocal nonumber norelativenumber
    autocmd WinEnter term://*
      \ startinsert
  augroup END
endif
" }}}

" Deoplete - disabled {{{
" This was messing slowing down each keystroke.
"let g:deoplete#sources = {}
"let g:deoplete#sources._ = ['buffer']
"let g:deoplete#sources.rb = ['buffer','tag']
"let g:deoplete#enable_camel_case = 1
"let g:deoplete#auto_complete_delay = 100
"let g:deoplete#enable_at_startup = 1
" }}}

" Fuzzy Finder {{{
set runtimepath+=~/.fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" }}}

" Autocmds Settings  {{{
augroup basics_autocmd
  au!
  " sets special tag files to include gem.tagsand look at parent dirs
  " remove '_' from ruby keyword so `w` stops at underscore
  autocmd FileType ruby set tags=gem.tags,tags;/
    \ | setlocal makeprg=rubocop\ \-\-format\ emacs\ %
  autocmd FileType javascript set tags=.tags.jsx,tags
  autocmd FileType markdown,vim setlocal textwidth=80
  autocmd FileType java,go,hs set autoindent smartindent tabstop=4 shiftwidth=4  noexpandtab

  " set term title to current file
  autocmd BufEnter * let &titlestring=expand("%:t") | set title

  " Use Neomake for syntax checking
  autocmd BufWritePost * Neomake

  " open search results immediately
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd VimResized * let &previewheight=(winheight(0) * 1/3)
  autocmd BufEnter init.vim setlocal foldmethod=marker
augroup END
" }}}

" Key Mappings {{{
" Reset Leader
nnoremap <Space> <Nop>
let mapleader=" "

" Fix my common typos
command! W w   " write it

" <C-@> is same as <S-Space>
inoremap <C-@> <C-n>

" Toggle Movements {{{
" Helper function to use an alternate movement if the first
" movement doesn't move the cursor.
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" Warning: 0 uses ^ first, then 0
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>
nnoremap <silent> ^ :call ToggleMovement('0', '^')<CR>

nnoremap <silent> $ :call ToggleMovement('$', '^')<CR>

nnoremap <silent> ; :call ToggleMovement(';', ',')<CR>
nnoremap <silent> , :call ToggleMovement(',', ';')<CR>

nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>

nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>
" }}}

" Cycle Movement {{{
" Thanks: http://ddrscott.github.io/blog/2016/vim-toggle-movement/#comment-2652924928
" TODO This gets a stack overflow error when run on a blank line.
function! CycleMovement(firstOp, secondOp, ...) abort
  let g:cycle_movement = get(g:, "cycle_movement", 1)

  if g:cycle_movement == 1
    let l:command = a:firstOp
  elseif g:cycle_movement == 2
    let l:command = a:secondOp
  elseif a:0 == 1 && g:cycle_movement == 3
    let l:command = a:1
  endif

  if (a:0 == 0 && g:cycle_movement == 2) || (a:0 == 1 && g:cycle_movement == 3)
    let g:cycle_movement = 1
  else
    let g:cycle_movement = g:cycle_movement + 1
  endif

  let pos = getpos('.')
  execute "normal! " . l:command
  if pos == getpos('.')
    if a:0 == 1
      call CycleMovement(a:firstOp, a:secondOp, a:1)
    else
      call CycleMovement(a:firstOp, a:secondOp)
    endif
  endif
endfunction
" }}}

" Warning: CTRL-G u  break undo sequence, start new change      *i_CTRL-G_u*
" This is an awesome feature. Especially for those that stay in insert mode a
" little too long. Old habits due hard. But at least now the undo isn't so
" drastic.
inoremap <CR> <C-g>u<CR>
" Warning: breaks undo sequence when space is used.
inoremap <Space> <C-g>u<Space>

" Warning: I'm killing the 2nd <C-r> in these modes because '"' is too hard to
" reach. This makes <C-r> more consistent with Register access in insert and
" command mode.
nnoremap <C-r> :echo 'which regster? (access Redo with <S-u>)'<cr>"
nnoremap <C-r><C-r> ""
cnoremap <C-r><C-r> <C-r>"
vnoremap <C-r><C-r> ""

" Warning: This pastes the last thing yanked! Awesome sauce!
inoremap <C-r><C-r> <C-r>"
" Warning: provide reverse mapping for original <C-r><C-r> behavior at the
" expense of accessing the 'r' register. Poor 'r' register no one loves you.
inoremap <C-r>r <C-r><C-r>

" Warning: Make capital U perform a Redo
" Because of the <C-r> hacks above, I break <S-u> and make it redo. The default
" because of <S-u> is undo the whole line. Sorry if you used it.
nnoremap <S-u> <C-r>

" Warning: Scroll 1 line at a time instead of default 3
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>

" Warning: Faster schooling with C-e/y and keeps cursor in place.
" This is similar to <C-d/u> behavior
nnoremap <C-e> 3<C-e>3j
nnoremap <C-y> 3<C-y>3k

" Search Replace {{{
nnoremap cn *Ncgn
nnoremap cN #Ncgn
" }}}

" Nerd Tree {{{
" nnoremap <Leader>n :NERDTreeToggle<CR>
" }}}

" Tagbar {{{
nnoremap <Leader>tb :Tagbar<CR>
nnoremap <Leader>ta :TagbarOpenAutoClose<CR>
" }}}

" Neoterm mappings {{{
nnoremap <Leader>tt :Topen<CR>
nnoremap <Leader>tr :TREPLSend<CR>
" }}}

" Pager like Less/More
nnoremap <Leader><Space> <C-d>

" Paste mode, NeoVim might not need this.
nnoremap <silent> <f5> :set paste!<CR>

" Better use :tjump instead of :tag
" Warning: swapping <C-]> and g<C-]>
nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>

" [z]ap [w]hitespace
nnoremap <silent> <Leader>zw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:write<CR>

" Copy current buffer path to system clipboard
" I picked 5 because it's also the '%' key.
nnoremap <silent> <Leader>5 :let @* = expand("%")<CR>:echom "copied: " . expand("%")<CR>

" Visual Selection Helpers {{{
" reselect last change
nnoremap <Leader>vv mv`[V`]`v

" Ctrl Left and Right (h, l) starts visual selection
" then continues it simlar to Shift-Option-Left/Right
nmap <S-A-l> ve
vmap <S-A-l> e
nmap <S-A-h> vb
vmap <S-A-h> b
nmap <A-l> e
nmap <A-h> b
" }}}

" Move through wrapped lines as default, with reverse mappings
" Warning: swapping k with gk and j with gj
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Defaults to w, but should be e like the rest all other basic editors.
" Warning: make S-RIGHT because like the rest of the OS.
nnoremap <S-RIGHT> e

" Center screen after common jumps.
" Warning: This might make you mad, but makes my happy. I'm so selfish.
nnoremap } }zz
nnoremap { {zz
nnoremap zj zjzz
nnoremap zk zkzz

" Warning: Disable annoying key defaults
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
command! Qa qa
command! QA qa

" Faster :ex commands
nnoremap <C-s> :write<CR>
inoremap <C-s> <ESC>:write<CR>
nnoremap <C-q> :close<CR>

" Buffer Stuff
" Warning: C-n/C-p to move to next/previous buffer. Instead of down/up lines.
nnoremap <silent> <C-p> :bprevious<CR>
nnoremap <silent> <C-n> :bnext<CR>
" [x]-out the current buffer and jump out.
nnoremap <silent> <C-x> <C-o>:bdelete #<CR>

" Populate QuickFix with branch changes
command! QfBranch cexpr! system("git diff --name-only  `git log --graph --oneline -99 \| grep -A 1 -E '^\\* [0-9a-f]{7}' \| cut -c 5-11 \| tail -1`.. \| sed -E 's/(.*)/\\1:0:0 \\1/'") | copen

" WIP - sed doesn't work in script, but does in terminal :/
" command! QfStat cexpr! system("git diff --stat=999 --name-only"
" \ . " `git log --graph --oneline -99 \| grep -A 1 -E '^\\* [0-9a-f]{7}' \| cut -c 5-11 \| tail -1`.. \|"
" \ . " sed -E 's~ ([^ \|]+)([ \|])+(.+)~\\1:0:0 Cats~'"
" \) | copen

" Fuzzy Finder FZF helpers {{{
command! SinceDev call fzf#run({'source': 'git diff --name-only dev..', 'down': '33%', 'sink': 'edit', 'options': '-m'})
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fh :Hist<CR>
nnoremap <silent> <Leader>fm :Marks<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fd :SinceDev<CR>
" }}

nnoremap <silent> <Leader>bb :b#<CR>

" [b]uffer [o]nly - close all except my buffer
" Thanks: http://stackoverflow.com/a/34050776
nnoremap <silent> <Leader>bo :update<cr>:%bd<cr>:e#<CR>

" Not a FZF but I like the 'f' prefix :/
map <Leader>fw [I:let nr = input("Which tag?: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Warning: Delete to "x register
vnoremap x "xx
vnoremap X "xX

" Delete to "d register
" I use dd too much expecting to cut.
"nnoremap d "dd
"nnoremap D "dD

" Warning: Yank without moving cursor! Awesome Sauce!
"          exit visual mode, my=mark y, last visual selection, y, go to mark
" Thanks: http://ddrscott.github.io/blog/2016/yank-without-jank/#comment-2643800118
vnoremap <expr>y 'my"' . v:register . 'y`y'
vnoremap <expr>Y 'my"' . v:register . 'Y`y'

" Warning: Marks last yank position.
nnoremap y myy
nnoremap Y myy$

" Warning: Paste moves to end of change. As if you typed in the change.
" This paste also maintains indent level with line above it.
" Also re-indents what ever was pasted.
nnoremap p ]p`]mp=`[`p
nnoremap P ]P`]mp=`[`p

" Visual Paste Override {{{
" Warning: overrides `p` and `P` behavior by preserving the "" register and
"          moving cursor to end of paste location
" See `:h setreg()` for a reference of how to use get/setreg.
function! VisualPaste()
  let s:saved_unnamed = getreg(v:register,1)
  let s:saved_type = getregtype(v:register)
  return "p`]mp=`[`':call RestorePaste()\<cr>"
endfunction
function! RestorePaste()
  call setreg(v:register, s:saved_unnamed, s:saved_type)
endfunction
vnoremap <silent> <expr> p VisualPaste()

" Messes up too many other plugins :(
" nnoremap c mcc
" vnoremap c <ESC>mcgvc
" vnoremap C <ESC>mcgvC

" Quick Inserts {{{
" There's no way to remember this unless you're me.
" I often `dw` parameters and append them to reorder as needed.
" Usage: `dw`, `e` to the new location, `, `
" Note: specifically NOT <Leader><Space> because ',' is a parameter seperator.
nnoremap ,<SPACE> a, <C-r>"<ESC>
" }}}

" Grep Stuff
" Warning: sets @/ register to current word
nnoremap <silent> <Leader>gw :let @/=expand("<cword>")<CR>:execute "grep! " . shellescape(expand("<cword>"))<CR>:cwindow<CR>
" }}}

" Quick Editing {{{
command! Notes Files ~/notes
" Hit [v]im[r]c at the same time to open vimrc.
nnoremap <silent> <Leader>vr :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>ve :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>vs :source $MYVIMRC<CR>:echo 'sourced: ' . $MYVIMRC<CR>

" TODO why doesn't this work?
augroup SourceVimrc
  au!
  autocmd BufWritePost ~/.config/nvim/init.vim,~/.vimrc source <afile> | echo 'Saved and Sourced: ' . expand('%:t')
augroup END
" }}}

" Gsub {{{
function! Gsub(a, b, re)
  try
    let z=@/
    exe "'" . a:a . ",'" . a:b . a:re
  finally
    unlet z
  endtry
endfunction
" }}}

" SymbolizeHash {{{
func! SymbolizeHash(a, b)
  call Gsub(a:a, a:b, 's/\v(''|")([^\1]+)\1\s*\=\>\s*/\2: /ge')
endf

func! SymbolizeHashOperation(type)
  call SymbolizeHash('[', ']')
endf

nnoremap <Leader>zh <Esc>:set opfunc=SymbolizeHashOperation<CR>g@
vnoremap <Leader>zh <Esc>:call SymbolizeHash('<','>')<CR>
" }}}

" DoubleToSingleQuote {{{
func! DoubleToSingleQuote(a, b)
  call Gsub(a:a, a:b, 's/\v"([^"#]+)"/''\1''/ge')
endf

func! DoubleToSingleQuoteOperation(type)
  call DoubleToSingleQuote('[', ']')
endf

nnoremap <Leader>zq <Esc>:set opfunc=DoubleToSingleQuoteOperation<CR>g@
vnoremap <Leader>zq <Esc>:call DoubleToSingleQuote('<','>')<CR>
" }}}

" Emacs Editing {{{
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
inoremap <C-a> <C-o>^
inoremap <C-e> <End>
nnoremap <a-bs> a<C-w>
inoremap <a-bs> <C-w>
" No need for normal mode mappings.
" use <S-i> to insert begining
" use <S-a> to append at end
" }}}

" BlackHole {{{
" Performs a "_d against them motion or visual selection.
func! BlackHoleDeleteOperator(type, ...)
  if a:type ==# 'char'
    execute 'normal! `[v`]"_d'
  elseif a:type ==# 'line'
    execute 'normal! `[V`]"_d'
  else
    execute 'normal! `<' . a:type . '`>"_d'
  endif
endf
nnoremap <silent> <BS> :set opfunc=BlackHoleDeleteOperator<CR>g@
vnoremap <silent> <BS> :<C-u>call BlackHoleDeleteOperator(visualmode(), 1)<CR>
" }}}


" Multicursor {{{
" Warning: Slightly more intuitive mappings. Plus I already use the defaults
"          <C-n/p> for buffer switching.
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<Leader>m'
let g:multi_cursor_next_key='m'
let g:multi_cursor_prev_key='<S-m>'
let g:multi_cursor_skip_key='<C-m>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

" Wildmenu completion {{{
set wildmenu
set wildmode=longest,list:longest
set wildignore=
" }}}

" The Silver Searcher {{{
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --vimgrep\ --word-regexp
        \\ --ignore='*.js.map'
        \\ --ignore='*.csv'
        \\ --ignore='ui/public/client'
        \\ --ignore='cassettes/'
endif
" }}}

" Abbreviations {{{
iab deb debugger; // eslint-disable-line
" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" }}}

" Line Return {{{
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g''"zvzz' |
        \ endif
augroup END
" }}}

" Expand Region {{{
" Warning: takes over visual mode. Get use to it! Totally Sweet!
"          Defaults to `viw` which is usually what I want anyway.
nmap v <Plug>(expand_region_expand)
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

call expand_region#custom_text_objects('ruby', {
      \ 'ir' :0,
      \ 'ar' :1,
      \ })
" }}}

" Inc Search {{{
" Warning: beat up all the search defaults.
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}

" Foldtext and Mappings {{{
" Fold mappings
nmap <Leader>zi :set foldmethod=indent<CR>
nmap <Leader>zs :set foldmethod=syntax<CR>
nmap <Leader>zk :set foldmethod=marker<CR>
nmap <Leader>zm :set foldmethod=manual<CR>

" Map <Leader>z0-9 to set a foldlevel directly
for i in [0,1,2,3,4,5,6,7,8,9]
  execute 'nmap <Leader>z' . i . ' :set foldlevel=' . i . '<CR>'
endfor

" http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! CustomFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  let w = winwidth(0) - &foldcolumn - (&number || &relativenumber ? 4 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  " let foldLevelStr = repeat(">", v:foldlevel)
  let foldLevelStr = "" . v:foldlevel
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction
set foldtext=CustomFoldText()
" defaults to off
" set foldcolumn=0
highlight Folded  cterm=underline ctermfg=10 ctermbg=0
" }}}

" Quickfix Stuff {{{
augroup quickfix_stuff
  au!
  autocmd BufReadPost quickfix  setlocal norelativenumber number
augroup END
" }}}

" Fugitive Stuff {{{
augroup fugitive_stuff
  au!
  autocmd BufEnter fugitive://* setlocal foldenable
augroup END
" }}}

" Git Mappings {{{
nnoremap <Leader>gd :Gvdiff<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>ga :Gadd<cr>
nnoremap <Leader>gb :Gblame<cr>
"nnoremap <Leader>gco :Gcheckout<cr>
"nnoremap <Leader>gci :Gcommit<cr>
"nnoremap <Leader>gm :Gmove<cr>
"nnoremap <Leader>gw :Gwrite<cr>
"nnoremap <Leader>gr :Gremove<cr>
"nnoremap <Leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
" }}}

" Neomake Stuff {{{
augroup neomake_stuff
  au!
  " It must be required or filetype gets set to javascript.jxs
  " which breaks how neomake detects the linter.
  let g:jsx_ext_required = 1
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_open_list = 0
augroup END

" Git Gutter {{{
augroup gitgutter_stuff
  au!
  nmap [h <Plug>GitGutterPrevHunk
  nmap ]h <Plug>GitGutterNextHunk
  nmap <Leader>hs <Plug>GitGutterStageHunk
  nmap <Leader>hr <Plug>GitGutterRevertHunk
  nmap <Leader>hp <Plug>GitGutterPreviewHunk
  nmap <Leader>hc <Plug>GitGutterStageHunk:Gcommit<cr>
augroup END
" }}}

" ctag helpers {{{
command! Ctag !ctags --verbose --languages=ruby --recurse -f tags .
command! CtagBundle !ctags --verbose --languages=ruby --recurse -f gem.tags $(bundle list --paths | grep -v $(pwd))
command! Rtag !ripper-tags -R -f tags .
command! RtagBundle !ripper-tags -R -f gem.tags $(bundle list --paths | grep -v $(pwd))
" }}}

" Submode Plugins {{{
" Exit submodes after a 2 seconds. Think fast!
let g:submode_always_show_submode=1
let g:submode_timeout=1
let g:submode_timeoutlen=2000
" }}}

" Fieldtrip and Sideways {{{
" Note: Sideways allows for switching of arguments.
"       Fieldtrip provides a submode for doing so.
" Defaults: `l` and `h' quickly move between args
"           `L` and `H` moves the arguments position right and left.
" [g]oto [a]rguments
let g:fieldtrip_start_map='ga'
" }}}

" Window Submode {{{
call submode#enter_with('window', 'n', '', '<Leader>w')
call submode#leave_with('window', 'n', '', '<Esc>')
for key in ['a','b','c','d','e','f',
          \ 'g','h','i','j','k','l',
          \ 'm','n','o','p','r','s',
          \ 't','u','v','w','x','y','z']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor
call submode#map('window', 'n', '', 'q', '<C-w>c')
call submode#map('window', 'n', '', '<C-q>', '<C-w>c')
call submode#map('window', 'n', '', 'v', ':vnew<CR>')
call submode#map('window', 'n', '', '<C-v>', ':vnew<CR>')
call submode#map('window', 'n', '', '\', ':vertical resize 80<CR>')
call submode#map('window', 'n', '', '+', '3<C-w>+')
call submode#map('window', 'n', '', '-', '3<C-w>-')
call submode#map('window', 'n', '', '<', '10<C-w><')
call submode#map('window', 'n', '', '>', '10<C-w>>')
call submode#map('window', 'n', '', '=', '<C-w>=')
" }}}

" 'z' submode {{{
call submode#enter_with('Z', 'n', '', '<Leader>zz', 'zz')
call submode#leave_with('Z', 'n', '', '<Esc>')
call submode#map('Z', 'n', '', 't', 'zt')
call submode#map('Z', 'n', '', 'b', 'zb')
call submode#map('Z', 'n', '', 'l', 'zl')
call submode#map('Z', 'n', '', 'h', 'zh')
call submode#map('Z', 'n', '', 'L', 'zL')
call submode#map('Z', 'n', '', 'H', 'zH')
call submode#map('Z', 'n', '', 'j', 'zjzz')
call submode#map('Z', 'n', '', 'k', 'zkzz')
call submode#map('Z', 'n', '', 'z', 'zz')

" folding
call submode#map('Z', 'n', '', 'a', 'za')
call submode#map('Z', 'n', '', 'm', 'zm')
call submode#map('Z', 'n', '', 'o', 'zo')
call submode#map('Z', 'n', '', 'r', 'zr')
call submode#map('Z', 'n', '', 'A', 'zA')
call submode#map('Z', 'n', '', 'M', 'zM')
call submode#map('Z', 'n', '', 'O', 'zO')
call submode#map('Z', 'n', '', 'R', 'zR')
" }}}

" g-changes submode {{{
call submode#enter_with('g-changes', 'n', '', 'g;', 'g;')
call submode#enter_with('g-changes', 'n', '', 'g,', 'g,')
call submode#leave_with('g-changes', 'n', '', '<Esc>')
call submode#map('g-changes', 'n', '', ';', 'g;')
call submode#map('g-changes', 'n', '', ',', 'g,')
" }}}

" Smart Word Mappings {{{
" Warning: This overrides w/b/e/ge defaults
" map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge <Plug>(smartword-ge)
" }}}

" Arpeggio Mappings {{{
Arpeggio imap kj <Esc>
Arpeggio cmap kj <Esc>
Arpeggio vmap kj <Esc>
" }}}

" Git Functions {{{
function! GitBranchPoint()
  return system('git log --graph --oneline -99 | grep -A 1 -E ''^\* [0-9a-f]{7}'' | cut -c 5-11 | tail -1')
endfunction
command! DiffBranchPoint execute(':Gvdiff ' . GitBranchPoint())
" [d]iff [v]isually, same as fugitives mapping
nnoremap <Leader>dv :DiffBranchPoint<CR>
" }}}

" Inspired by some ajh17's save view routine
" Thanks: https://github.com/ajh17/dotfiles/blob/master/.vim/autoload/format.vim
function! SaveViewNormal(cmd)
  let winview = winsaveview()
  execute 'keepjumps normal! ' . a:cmd
  call winrestview(winview)
endfunction

" Indent all lines without changing jumps or cursor position.
nnoremap <silent> g= :call SaveViewNormal('gg=G')<CR>
" }}}

