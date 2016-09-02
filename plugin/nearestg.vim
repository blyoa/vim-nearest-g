if exists('g:loaded_nearestg')
  finish
endif
let g:loaded_nearestg = 1

let s:save_cpo = &cpo
set cpo&vim

noremap <silent> <Plug>(nearest-g:neighbor)
      \ :<C-u>call nearestg#nearest_neighbor_G(v:count, [0, line('$')])<CR>
noremap <silent> <Plug>(nearest-g:backward)
      \ :<C-u>call nearestg#nearest_backward_G(v:count, [0, line('$')])<CR>
noremap <silent> <Plug>(nearest-g:forward)
      \ :<C-u>call nearestg#nearest_forward_G(v:count, [0, line('$')])<CR>
noremap <silent> <Plug>(nearest-g:visible-neighbor)
      \ :<C-u>call nearestg#nearest_neighbor_G(v:count, [line('w0'), line('w$')])<CR>
noremap <silent> <Plug>(nearest-g:visible-backward)
      \ :<C-u>call nearestg#nearest_backward_G(v:count, [line('w0'), line('w$')])<CR>
noremap <silent> <Plug>(nearest-g:visible-forward)
      \ :<C-u>call nearestg#nearest_forward_G(v:count, [line('w0'), line('w$')])<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:et:foldmethod=marker:
