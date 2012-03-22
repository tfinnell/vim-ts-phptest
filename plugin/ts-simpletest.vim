if exists("g:loaded_tssimpletest") || &cp
  finish
endif
let g:loaded_tssimpletest= 1

let s:prj = getcwd()

" does this project have a tests folder and simpletest embedded inside?
if isdirectory(s:prj . "/tests") && isdirectory(s:prj . "/tests/simpletest")
  let s:testdir = s:prj . "/tests"
elseif isdirectory(s:prj . "/php/tests") && isdirectory(s:prj . "/php/tests/simpletest")
  let s:testdir = s:prj . "/tests"
endif

function! RunTests ()
  if exists("s:testdir")
    let command = "cd " . s:testdir . "; php *.php | simpletestout\n"
    call SendToTmux(command)
  else
    echo "simpletest not found"
  endif
endfunction

nmap <leader>t :call RunTests()<CR>
