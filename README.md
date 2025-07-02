# sticky_header.vim

A vim/neovim plugin to get what scope closest you are currently in (function, class, other tags)

Use cases:
- light weight sticky_header plugin if you dont want a bunch of heavy dependencies

# Table of contents
1. [Motivation](#motivation)
2. [Supported editors](#supported_editors)
3. [Supported Runners](#supported_runners)
4. [Recommended Keybindings](#recommended_keybindings)
5. [Contribution Requests](#contribution_requests)
6. [Install](#install)

## Motivation: <a id="motivation"></a>

A lightweight 'good enough' current context plugin
No heavy dependencies, just a basic file based around regex and can easily extend or change

## Supported editors: <a id="supported_editors"></a>
- vim
- neovim

## Supported Runners (in order of runner search): <a id="supported_runners"></a>

See `vim_sticky_header_runner_configs` list in code

### How a runner is selected:

`g:vim_sticky_header_runner_configs` runner ordered list drives the runner selection

### Add a runner

You can add a new runner by prepending or appending a runner to `g:vim_sticky_header_runner_configs`

NOTE: the order of `g:vim_sticky_header_runner_configs` is important. The first runner that matches the conditions in the function `_VSH_IsRunner` will be choosen

NOTE: you can also reorder `g:vim_sticky_header_runner_configs` all together

---

## Recommended Keybindings: <a id="recommended_keybindings"></a>

```vim
" find the context of the current line that your cursor is at
nmap <leader>sh :call VSH_Run()<CR>
```

## Contribution Requests: <a id="contribution_requests"></a>

requesting MRs for other runners or improve regex patterns for current runners

## Install: <a id="install"></a>

Use your plugin manager of choice such as vimplug or lazy as follows:

### VimPlug
```vim
call plug#begin('~/.vim/plugged')
" rest of your plugins ...
Plug 'MajorZiploc/sticky_header.vim'
" rest of your plugins ...
call plug#end()
```

### Lazy (Example of Lazy being used inside of LunarVim)
```vim
lvim.plugins = {
  " rest of your plugins ...
  { "MajorZiploc/code_runner.vim" },
  " rest of your plugins ...
}
```

## Keywords:

sql_client, nosql_client, execute_code, execute_file, sql, redis, mongo, sql, nosql, execute_code_block key_value_store_client
