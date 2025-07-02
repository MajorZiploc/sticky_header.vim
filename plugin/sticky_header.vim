function! VSH_FindTagLineUpwards() abort
  let lnum = line('.')
  while lnum >= 1
    let line_text = getline(lnum)
    if match(line_text, '^\s*\(func\|class\)') != -1
      return {'line_num':lnum,'line_content':line_text}
    endif
    let lnum -= 1
  endwhile
  " Not found
  return {'line_num':-1,'line_content':''}
endfunction

function! ShowFindFuncLineUpwards() abort
  echo VSH_FindTagLineUpwards()
endfunction

command! HeaderScratch call s:OpenHeaderScratch()

function! s:OpenHeaderScratch() abort
  new
  resize 1
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile number
endfunction

function! VSH_MakeHeader() abort
  let line_res = VSH_FindTagLineUpwards()
  if get(line_res, 'line_num', -1) != -1
    horizontal leftabove HeaderScratch
    let formatted_res = get(line_res, 'line_num') . ': ' . get(line_res, 'line_content', '')
    put =formatted_res
    execute "wincmd j"
  else
    echohl WarningMsg
    echo "No Header Found!"
    echohl None
  endif
endfunction

function! VSH_CloseHeaderIfExists() abort
  let cur_win = winnr()
  let cur_pos = win_screenpos(cur_win)[0]
  " Check if there's a window above by comparing screen row positions
  for w in range(1, winnr('$'))
    if win_screenpos(w)[0] < cur_pos
      " Move to the window above and close it
      execute w . 'wincmd w'
      close
      " restore focus
      " execute cur_win . 'wincmd w'
      return
    endif
  endfor
endfunction

function! VSH_Run() abort
  call VSH_CloseHeaderIfExists()
  call VSH_MakeHeader()
endfunction

" TODO: move out of plugin and into dotfiles pluggin-settings
nmap <leader>sh :call VSH_Run()<CR>
