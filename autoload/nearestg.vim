function! s:get_candidates(cnt) "{{{
  let cur_pos = getcurpos()[1]
  let header_digits = ""
  if len(cur_pos) > len(a:cnt)
    let header_digits = cur_pos[:len(cur_pos) - (len(a:cnt) + 1)]
  endif

  let lower = (header_digits . a:cnt) - float2nr(pow(10, len(a:cnt)))
  let same  = (header_digits . a:cnt) + 0
  let upper = (header_digits . a:cnt) + float2nr(pow(10, len(a:cnt)))

  return [lower, same, upper]
endfunction "}}}

function! s:is_valid_linenr(linenr, lim) "{{{
  return a:lim[0] <= a:linenr && a:linenr <= a:lim[1]
endfunction "}}}

function! nearestg#nearest_backward_G(cnt, lim) abort "{{{
  let cur_pos = getcurpos()[1]
  let candidates = s:get_candidates(a:cnt)

  let lower = candidates[0]
  let same = candidates[1]

  if s:is_valid_linenr(same, a:lim) && same < cur_pos
    execute 'normal' . same . 'G'
    return
  endif

  if s:is_valid_linenr(lower, a:lim)
    execute 'normal' . lower . 'G'
    return
  endif

  execute 'normal' . a:lim[0] . 'G'
endfunction "}}}

function! nearestg#nearest_forward_G(cnt, lim) abort "{{{
  let cur_pos = getcurpos()[1]
  let candidates = s:get_candidates(a:cnt)

  let same = candidates[1]
  let upper = candidates[2]

  if s:is_valid_linenr(same, a:lim) && same > cur_pos
    execute 'normal' . same . 'G'
    return
  endif

  if s:is_valid_linenr(upper, a:lim)
    execute 'normal' . upper . 'G'
    return
  endif

  execute 'normal' . a:lim[1] . 'G'
endfunction "}}}

function! nearestg#nearest_neighbor_G(cnt, lim) abort "{{{
  let cur_pos = getcurpos()[1]
  let candidates = s:get_candidates(a:cnt)

  let min_idx = -1
  let min_dist = -1
  for idx in range(len(candidates))
    if !s:is_valid_linenr(candidates[idx], a:lim)
      continue
    endif
    let dist = abs(candidates[idx] - cur_pos)
    if min_dist < 0 || min_dist > dist 
      let min_dist = dist
      let min_idx = idx
    endif
  endfor

  if min_idx < 0
    return
  endif

  execute 'normal' . candidates[min_idx] . 'G'
endfunction "}}}


" vim:et:foldmethod=marker:
