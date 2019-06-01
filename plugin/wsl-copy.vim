" Plugin: wsl-copy
" Maintainer: Christian Fosli <cfosli@gmail.com>
" Website: https://github.com/christianfosli/wsl-copy

" Thanks to vim's 'help map-operator' to help me figure out how to do this

nnoremap <silent> <Plug>WslCopy :set operatorfunc=WslSendToClipboard<cr>g@
xnoremap <silent> <Plug>WslCopy :<C-U>call WslSendToClipboard(visualmode(),1)<cr>
command -range Wsly exe "normal gv \<Plug>WslCopy"

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
        call WslSendLastYankedToTmpFileAndSendToClip()
    elseif a:type ==# 'line'
        normal! '[V']y
        call WslSendLastYankedToTmpFileAndSendToClip()
    elseif a:type ==# 'char'
        normal! `[v`]y
        call WslSendLastYankedToClip()
    endif

    redraw!
    echo 'wsl-copy: text yanked to clip.exe'
    let &selection = l:sel_save
    let @@ = l:reg_save
endfunction

function! WslSendLastYankedToTmpFileAndSendToClip() abort
    silent new /tmp/vimBuffer
    silent %d
    silent normal! "0P
    if line('$') > 1 " Remove excess newlines if necessary
        silent normal! Gdd
    endif
    silent normal! ZZ
    silent ! cat /tmp/vimBuffer | clip.exe
endfunction

" This function only works when there are no newlines:
function! WslSendLastYankedToClip() abort
    silent execute '! printf ' . shellescape(@@) . ' | clip.exe'
endfunction
