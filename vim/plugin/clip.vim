if exists('g:loaded_wayland_clipboard')
    finish
endif
let g:loaded_wayland_clipboard = 1

if empty($WAYLAND_DISPLAY)
    finish
endif

function! s:WaylandYank()
    silent call job_start(['wl-copy', '--', getreg(v:event['regname'])], {
        \   "in_io": "null", "out_io": "null", "err_io": "null",
        \   "stoponexit": "",
        \ })
endfunction
aug waylandyank
    au!
    au TextYankPost * call s:WaylandYank()
aug END

for p in ['p', 'P']
    execute "nnoremap <silent> " . p . " :<C-U>silent let @\"=substitute(system('wl-paste --no-newline'), \"\\r\", '', 'g') \\| exec 'normal! ' . v:count1 . '" . p . "'<CR>"
endfor
