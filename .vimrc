" Plug package and plugins
call plug#begin()

Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'AlexGose/sendlines.vim'

" Add new vim Plug Plugins here

call plug#end()

" use relative line numbers
set number relativenumber

" map , to save the file
nnoremap , :w<CR>

" map ,q to save and quit
nnoremap ,q :wq<CR>

" F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Add Conquer of Completion (CoC) key bindings here 

" Use Tab and shift+Tab to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" make <cr> select the first completion item and confirm the 
" completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" format code on <cr>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Add sql file key bindings here

" For sql files, send visually selected lines to the right tmux pane
" (note: this uses the sendlines.vim plugin)
autocmd FileType sql vnoremap <buffer> <F9> :<c-u>call SendLines("{right}")<CR>

" Add pandoc key bindings here

" For pandoc markdown, map F5 to Zotero's citation picker in insert mode 
autocmd FileType pandoc inoremap <buffer> <F5> <C-r>=system("curl -s 'http://localhost:23119/better-bibtex/cayw?format=pandoc&brackets=t' \| tr -d '\n'")<CR>

" For pandoc markdown files, map F9 to compile into a pdf file
autocmd FileType pandoc noremap <buffer> <F9> :make %:r.pdf<CR>

" For pandoc markdown files, map F10 to open the compiled pdf file
autocmd FileType pandoc noremap <buffer> <F10> :!zathura %:r.pdf &<CR><CR>

" For pandoc markdown files, map F2 to insert the date as a second level header
autocmd FileType pandoc noremap <buffer> <F2> zii# <ESC>:r!date --date='now' +'\%A \%d \%B \%Y'<CR>kJo<CR>## <ESC>zia

" For Pandoc Markdown, find "<++>" and replace in insert mode 
autocmd FileType pandoc nnoremap <buffer> ;; /<++><CR>da<a

" Read an empty pandoc markdown tag for python code and move cursor
autocmd FileType pandoc nnoremap <buffer> ;p :read $HOME/Documents/Vim/Snippets/python.md<CR>kJa

" Read an empty pandoc markdown block for python code and move cursor
autocmd FileType pandoc nnoremap <buffer> ;bp :read $HOME/Documents/Vim/Snippets/blockpython.md<CR>ji

" Add latex key bindings here

" For latex files, map F9 to compile the file into a pdf using a makefile
autocmd FileType tex noremap <buffer> <F9> :make %:r.pdf<CR>

" For latex files, map F10 to open the compiled pdf file
autocmd FileType tex noremap <buffer> <F10> :!evince %:r.pdf &<CR>

" for latex files, map F5 to Zotero's citation picker in insert mode
autocmd FileType tex inoremap <buffer> <F5> <C-r>=system("curl -s 'http://localhost:23119/better-bibtex/cayw?format=citep&brackets=t' \| tr -d '\n'")<CR>
