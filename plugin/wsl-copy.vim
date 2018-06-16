" Plugin: wsl-copy
" Maintainer: Christian Fosli <cfosli@gmail.com>
" Website: https://github.com/christianfosli/wsl-copy

" Thanks to vim's 'help map-operator' to help me figure out how to do this


nnoremap <silent> wy :set operatorfunc=WslSendToClipboard<cr>g@
xnoremap <silent> wy :<C-U>call WslSendToClipboard(visualmode(),1)<cr>
nnoremap <silent> wyy V wy<cr>
	
function! WslSendToClipboard(type, ...) abort
	let l:sel_save = &selection
	let &selection = 'inclusive'
	let l:reg_save = @@

	if !(has('unix') && executable('clip.exe'))
		echoerr 'wsl-copy: invalid config - are u on wsl?'
		return
	endif

	if a:0 " Invoked from visual mode, use gv command
		normal! gvy
	elseif a:type ==# 'line'
		normal! '[V']y
	elseif a:type ==# 'char'
		normal! `[v`]y
	else 
		echom a:type . ' operator not yet supported for wsl-copy'
	endif

	silent new /tmp/vimBuffer
	silent %d
	silent normal! "0p
	silent w
	silent q
	silent ! cat /tmp/vimBuffer | clip.exe
	redraw!

	let &selection = l:sel_save
	let @@ = l:reg_save

endfunction
