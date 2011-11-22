if exists("did_load_filetypes") 
    finish 
endif 
augroup filetypedetect 
    au! BufNewFile,BufRead *.ttcn3   setfiletype ttcn 
    au! BufNewFile,BufRead *.ttcn    setfiletype ttcn 
    au! BufNewFile,BufRead *.antlr   setfiletype antlr 
    au! BufNewFile,BufRead *.k3.txt  setfiletype vim_syntax_log
    au! BufNewFile,BufRead *_SCT.log setfiletype vim_syntax_log
augroup END

