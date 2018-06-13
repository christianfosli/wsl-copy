" Plugin: wsl-copy
" Yanks a String to clip.exe
" Author: Christian Fosli <cfosli@gmail.com>
" Maintainer: Christian Fosli <cfosli@gmail.com>
" Website: tba

nnoremap wy :set operatorfunc=WslSendToClipboard<cr>g@
xnoremap wy :call WslSendToClipboard(visualmode())<cr>
	
function! WslSendToClipboard(type) abort

	if !(has('unix') && executable('clip.exe'))
		return " Return if not running on wsl
	endif

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[v`]y
	else
		return
	endif

	silent execute '! echo ' . shellescape(@@) . ' | clip.exe'
	:redraw!
	" TODO: Handle newlines

endfunction
