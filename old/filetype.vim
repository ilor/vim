if exists("did_load_filetypes") 
    finish 
endif 
augroup filetypedetect 
    au! BufNewFile,BufRead *.antlr   setfiletype antlr 
augroup END

