let g:_vsh_sh_tags = ['sh', 'shell']
let g:_vsh_zsh_tags = ['zsh']
let g:_vsh_bash_tags = ['bash']
let g:_vsh_bat_tags = ['bat', 'cmd']
let g:_vsh_python_tags = ['python']
let g:_vsh_javascript_tags = ['javascript', 'node', 'js']
let g:_vsh_typescript_tags = ['typescript', 'ts-node', 'ts']
let g:_vsh_php_tags = ['php']
let g:_vsh_perl_tags = ['perl', 'pl']
let g:_vsh_ruby_tags = ['ruby', 'rb']
let g:_vsh_powershell_tags = ['ps1', 'powershell', 'pwsh']
let g:_vsh_fsharp_tags = ['fsharp', 'fs']
let g:_vsh_csharp_tags = ['csharp', 'cs']
let g:_vsh_java_tags = ['java']

let cpp_style_tag_pattern = '^\s*[^\.=]*[({]\s*$'

let g:vim_sticky_header_runner_configs = [
  \ {
  \ "file_types": g:_vsh_sh_tags + g:_vsh_zsh_tags + g:_vsh_bash_tags,
  \ "file_extensions": g:_vsh_sh_tags,
  \ "tag_patterns": ['^\s*\(function\)'],
  \ "fn_name": '_VSH_RunSh',
  \ },
  \ {
  \ "file_types": g:_vsh_java_tags,
  \ "file_extensions": g:_vsh_java_tags,
  \ "tag_patterns": [] + [g:cpp_style_tag_pattern],
  \ "fn_name": '_VSH_RunJava',
  \ },
  \ {
  \ "file_types": g:_vsh_csharp_tags,
  \ "file_extensions": g:_vsh_csharp_tags,
  \ "tag_patterns": [] + [g:cpp_style_tag_pattern],
  \ "fn_name": '_VSH_RunCsharp',
  \ },
\ ]

function! _VSH_RunCsharp(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunJava(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunSh(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunBasic(args)
  let runner_config = a:args['runner_config']
  call _VSH_CloseHeaderIfExists()
  call _VSH_MakeHeader(runner_config)
endfunction

function! _VSH_IsTagLine(line_text, tag_patterns)
  for tag_pattern in a:tag_patterns
    if match(a:line_text, tag_pattern) != -1
      return 1
    endif
  endfor
  return -1
endfunction

function! _VSH_FindTagLineUpwards(args) abort
  let tag_patterns = a:args['tag_patterns']
  let lnum = line('.')
  while lnum >= 1
    let line_text = getline(lnum)
    if _VSH_IsTagLine(line_text, tag_patterns) != -1
      return {'line_num':lnum,'line_content':line_text}
    endif
    let lnum -= 1
  endwhile
  " Not found
  return {'line_num':-1,'line_content':''}
endfunction

function! s:VSH_OpenHeaderScratch() abort
  new
  resize 1
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile number
endfunction

command! VSHHeaderScratch call s:VSH_OpenHeaderScratch()

function! _VSH_MakeHeader(args) abort
  let line_res = _VSH_FindTagLineUpwards(a:args)
  if get(line_res, 'line_num', -1) != -1
    horizontal leftabove VSHHeaderScratch
    let formatted_res = get(line_res, 'line_num') . ': ' . get(line_res, 'line_content', '')
    put =formatted_res
    execute "wincmd j"
  else
    echohl WarningMsg
    echo "No Header Found!"
    echohl None
  endif
endfunction

function! _VSH_CloseHeaderIfExists() abort
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

function _VSH_IsLabelMemOf(actual_label, expected_labels)
  for expected_label in a:expected_labels
    if (a:actual_label == expected_label)
      return 1
    endif
  endfor
  return 0
endfunction

function _VSH_IsRunner(runner_config, file_ext)
  return _VSH_IsLabelMemOf(a:file_ext, a:runner_config['file_extensions'])
    \  || _VSH_IsLabelMemOf(&filetype, a:runner_config['file_types'])
endfunction

function _VSH_RunCases(file_ext)
  let case_values = {}
  for runner_config in g:vim_sticky_header_runner_configs
    if (_VSH_IsRunner(runner_config, a:file_ext))
      let FuncRef = function(runner_config['fn_name'])
      let func_input = {
        \'runner_config': runner_config
      \}
      let case_values = FuncRef(func_input)
      break
    endif
  endfor
endfunction

function! VSH_Run() abort
  let file_ext = expand('%:e')
  call _VSH_RunCases(file_ext)
endfunction

" TODO: move out of plugin and into dotfiles pluggin-settings
nmap <leader>sh :call VSH_Run()<CR>
