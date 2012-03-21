if exists("g:loaded_tssimpletest") || &cp
  finish
endif
let g:loaded_tssimpletest= 1

" Public 


" Global Maps
nnoremap <LEADER>t :call SendToTmux(@%)<CR>
