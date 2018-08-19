" Plugin: wsl-copy
" Maintainer: Christian Fosli <cfosli@gmail.com>
" Website: https://github.com/christianfosli/wsl-copy

" Thanks to vim's 'help map-operator' to help me figure out how to do this

nmap <silent> wy :set operatorfunc=WslSendToClipboard<cr>g@
xmap <silent> wy :<C-U>call WslSendToClipboard(visualmode(),1)<cr>
nmap <silent> wyy Vwy
	
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
	endif

	silent new /tmp/vimBuffer
	silent %d
	silent normal! "0P
	if line('$') > 1 " Remove excess newlines if necessary
		silent normal! Gdd
	endif
	silent normal! ZZ
	silent ! cat /tmp/vimBuffer | clip.exe
	redraw!

	let &selection = l:sel_save
	let @@ = l:reg_save

endfunction
