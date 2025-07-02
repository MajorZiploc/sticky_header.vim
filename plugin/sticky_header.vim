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
let g:_vsh_cpp_tags = ['cpp']
let g:_vsh_java_tags = ['java']
let g:_vsh_gdscript_tags = ['gdscript', 'gd']
let g:_vsh_glsl_tags = ['glsl']
let g:_vsh_lua_tags = ['lua']
let g:_vsh_vimscript_tags = ['vim', 'vimscript']

let cpp_style_tag_pattern = '^\s*[^\.=]*[({]\s*$'
" TODO: improve fsharp_tag_pattern
let fsharp_tag_pattern = '^\s*\<\(let\|class\|type\)\>\s\+[^;+|]\+\s\+[^;+|]\+='

let g:vim_sticky_header_runner_configs = [
  \ {
  \ "file_types": g:_vsh_sh_tags + g:_vsh_zsh_tags + g:_vsh_bash_tags,
  \ "file_extensions": g:_vsh_sh_tags,
  \ "tag_patterns": ['^\s*\<\(function\)\>'],
  \ "fn_name": '_VSH_RunSh',
  \ },
  \ {
  \ "file_types": g:_vsh_javascript_tags + g:_vsh_typescript_tags,
  \ "file_extensions": g:_vsh_javascript_tags + _vsh_typescript_tags,
  \ "tag_patterns": ['^\s*\<\(function\|class\|type\)\>'],
  \ "fn_name": '_VSH_RunJavascript',
  \ },
  \ {
  \ "file_types": g:_vsh_fsharp_tags,
  \ "file_extensions": g:_vsh_fsharp_tags,
  \ "tag_patterns": [fsharp_tag_pattern],
  \ "fn_name": '_VSH_RunFsharp',
  \ },
  \ {
  \ "file_types": g:_vsh_python_tags,
  \ "file_extensions": g:_vsh_python_tags,
  \ "tag_patterns": ['^\s*\<\(def\|class\)\>'],
  \ "fn_name": '_VSH_RunPython',
  \ },
  \ {
  \ "file_types": g:_vsh_gdscript_tags,
  \ "file_extensions": g:_vsh_gdscript_tags,
  \ "tag_patterns": ['^\s*\<\(func\|class\)\>'],
  \ "fn_name": '_VSH_RunGdscript',
  \ },
  \ {
  \ "file_types": g:_vsh_glsl_tags,
  \ "file_extensions": g:_vsh_glsl_tags,
  \ "tag_patterns": [] + [g:cpp_style_tag_pattern],
  \ "fn_name": '_VSH_RunGlsl',
  \ },
  \ {
  \ "file_types": g:_vsh_csharp_tags,
  \ "file_extensions": g:_vsh_csharp_tags,
  \ "tag_patterns": [] + [g:cpp_style_tag_pattern],
  \ "fn_name": '_VSH_RunCsharp',
  \ },
  \ {
  \ "file_types": g:_vsh_vimscript_tags,
  \ "file_extensions": g:_vsh_vimscript_tags,
  \ "tag_patterns": ['^\s*\<\(function\)\>'],
  \ "fn_name": '_VSH_RunVimscript',
  \ },
  \ {
  \ "file_types": g:_vsh_lua_tags,
  \ "file_extensions": g:_vsh_lua_tags,
  \ "tag_patterns": ['^\s*\<\(function\)\>', '^\s*local.*=\s*\<\(function\)\>'],
  \ "fn_name": '_VSH_RunLua',
  \ },
  \ {
  \ "file_types": g:_vsh_powershell_tags,
  \ "file_extensions": g:_vsh_powershell_tags,
  \ "tag_patterns": ['^\s*\<\(function\)\>'],
  \ "fn_name": '_VSH_RunPowershell',
  \ },
  \ {
  \ "file_types": g:_vsh_perl_tags,
  \ "file_extensions": g:_vsh_perl_tags,
  \ "tag_patterns": ['^\s*\<\(sub\|package)\>'],
  \ "fn_name": '_VSH_RunPerl',
  \ },
  \ {
  \ "file_types": g:_vsh_php_tags,
  \ "file_extensions": g:_vsh_php_tags,
  \ "tag_patterns": ['^\s*\<\(function\|class\)\>'],
  \ "fn_name": '_VSH_RunPhp',
  \ },
  \ {
  \ "file_types": g:_vsh_java_tags,
  \ "file_extensions": g:_vsh_java_tags,
  \ "tag_patterns": [] + [g:cpp_style_tag_pattern],
  \ "fn_name": '_VSH_RunJava',
  \ },
  \ {
  \ "file_types": g:_vsh_cpp_tags,
  \ "file_extensions": g:_vsh_cpp_tags,
  \ "tag_patterns": [] + [g:cpp_style_tag_pattern],
  \ "fn_name": '_VSH_RunCpp',
  \ },
  \ {
  \ "file_types": g:_vsh_bat_tags,
  \ "file_extensions": g:_vsh_bat_tags,
  \ "tag_patterns": ['^\s*:\w+\s*$'],
  \ "fn_name": '_VSH_RunBat',
  \ },
\ ]

function! _VSH_RunVimscript(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunLua(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunFsharp(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunJavascript(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunPowershell(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunRuby(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunPhp(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunPerl(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunBat(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunGlsl(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunCpp(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunGdscript(args)
  return _VSH_RunBasic(a:args)
endfunction

function! _VSH_RunPython(args)
  return _VSH_RunBasic(a:args)
endfunction

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

function! _VSH_FindTagLineUpwards(args) " abort <- NOTE: 'abort' will end a function when an error occurs - Look into its compatibility before using it
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

function! s:VSH_OpenHeaderScratch()
  new
  resize 1
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile number
endfunction

command! VSHHeaderScratch call s:VSH_OpenHeaderScratch()

function! _VSH_MakeHeader(args)
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

function! _VSH_CloseHeaderIfExists()
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

function! _VSH_IsLabelMemOf(actual_label, expected_labels)
  for expected_label in a:expected_labels
    if (a:actual_label == expected_label)
      return 1
    endif
  endfor
  return 0
endfunction

function! _VSH_IsRunner(runner_config, file_ext)
  return _VSH_IsLabelMemOf(a:file_ext, a:runner_config['file_extensions'])
    \  || _VSH_IsLabelMemOf(&filetype, a:runner_config['file_types'])
endfunction

function! _VSH_RunCases(file_ext)
  let case_values = {}
  let found_runner = -1
  for runner_config in g:vim_sticky_header_runner_configs
    if (_VSH_IsRunner(runner_config, a:file_ext))
      let FuncRef = function(runner_config['fn_name'])
      let func_input = {
        \'runner_config': runner_config
      \}
      let case_values = FuncRef(func_input)
      let found_runner = 1
      break
    endif
  endfor
  if found_runner == -1
    echohl WarningMsg
    echo "No Header Runner!"
    echohl None
  endif
endfunction

function! VSH_Run()
  let file_ext = expand('%:e')
  call _VSH_RunCases(file_ext)
endfunction
