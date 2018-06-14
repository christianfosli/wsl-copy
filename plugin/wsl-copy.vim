" Plugin: wsl-copy
" Author: Christian Fosli <cfosli@gmail.com>
" Maintainer: Christian Fosli <cfosli@gmail.com>
" Website: https://github.com/christianfosli/wsl-copy

nnoremap  wy :set operatorfunc=WslSendToClipboard<cr>g@
xnoremap  wy :call WslSendToClipboard(visualmode())<cr>
	
function! WslSendToClipboard(type) abort

	if !(has('unix') && executable('clip.exe'))
		return " Return if not running on wsl
	endif

	if a:type ==? 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[v`]y
	else
		return
	endif

	new /tmp/vimBuffer
	%d
	normal! "0p
	w
	q
	silent ! cat /tmp/vimBuffer | clip.exe
	redraw!

endfunction
