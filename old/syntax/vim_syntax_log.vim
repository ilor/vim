" Vim syntax file for COMT Logs
" EDITOR: Csaba Pocsai

" Reset used colors


" 1 : red
hi red start=t_md stop=t_me term=NONE      cterm=NONE           ctermfg=1 gui=NONE      guifg=#FF3030
" 1 : red_inverse
hi red_inv ctermbg=Red ctermfg=White
" 1b: orange
hi Exception start=t_md stop=t_me term=NONE      cterm=bold           ctermfg=1 gui=NONE      guifg=red
" 2 : gree
hi green  term=underline cterm=NONE           ctermfg=2 gui=NONE      guifg=green4
" 2b: light green
hi Function    term=underline cterm=NONE           ctermfg=2 gui=NONE      guifg=green1
" 5 : magenta
hi String      term=underline cterm=NONE           ctermfg=5 gui=NONE      guifg=#A000A0

highlight test ctermfg=Green guifg=Green


" Define the match expressions
"Common
 syn match msgError ".*ERR.*"
 syn match msgWarn ".*WRN.*"

"UEC
 syn match msgComt " msg_id=[a-zA-Z_0-9]* "
 syn match msgSutTenv "SUT->tenv.*"
 syn match msgTenvSut "tenv->SUT.*"
 syn match msgInSut "CallMsgWrapper: Ret[ru][ur]n value: [A-Z_0-9]* "
 syn match msgInSut1 "payLoadId:[a-zA-Z_][a-zA-Z_0-9()]* "
 syn match msgInSutASN "Decoder.*[A-Z_0-9]*$"
 syn match msgOutSutASN "Encoder.*[A-Z_0-9]*$"
 syn match msgOutSut "send.*payLoadId:[A-Z_0-9]\{1,}.*$"
 syn match msgOutSut1 "send.*().*send .*$"
 syn match msgInSut "evaluate.*[A-Z_0-9]*.*$"
 syn match msgInSut1 "handle.*payLoadId:.*()"
 syn match sutFunc "evaluate[a-zA-Z_0-9()]*"
 syn match errorTemplate "MISMATCH"
 syn match invalidData "contains invalid data!"

"RROM
 syn match msgInSut ".*incoming msg.*"
 syn match msgInTenv ".*: message.*received.*"
 syn match msgOutSut ".*outgoing msg.*"
 syn match msgOutTenv ".*message.*is going to be sent.*"
 syn match verdPass ".*PASSED.*"
 syn match verdFail ".*FAILED.*"

"TTCN3
 syn match mtcFailed ".*MTC|fail$"
 syn match matchFailed ".*never.mismatch.*"
 syn match cofiFailed ".*cofi.*error"
 syn match UNDFFailed ".*UNDF=.*"
 syn match setvFailed ".*setv.*fail.*"
 syn match uninitVal ":=null"
 syn match finalVerdictFail1 ".*tcfi.*error"
 syn match finalVerdictFail2 ".*tcfi.*fail"
 syn match finalVerdictPass ".*tcfi.*pass"
 syn match msgIn ".*|ptqu|.*"
 syn match msgOut ".*|ptsd|.*"
 syn match CONV  ".*CONV.*"
 syn match TYPE  ".*TYPE.*"
 syn match MANY  ".*MANY.*"


"showMessagesComt        egrep "CallMsgWrapper| msg_id=| evaluate| asn1PayLoadId| payLoadId:[a-zA-Z_]| ERR | sendEvent() " | hc msg_id="[a-zA-Z_0-9]* \(" "CallMsgWrapper: Ret[ru][ur]n value: [A-Z_0-9]* " "evaluate[a-zA-Z_0-9()]*" "asn1PayLoadId:[a-zA-Z_0-9()]*" "payLoadId:[a-zA-Z_][a-zA-Z_0-9()]* " "() [A-Z_0-9]\+" "ERR.*"


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
" if !exists("did_dosbatch_syntax_inits")
   " let did_dosbatch_syntax_inits = 1
    command! -nargs=+ HiLink hi def link <args>
 " endif

"COMMON
  HiLink msgError red_inv
  HiLink msgWarn red

"RROM
  HiLink msgComt Function
  HiLink msgSutTenv green
  HiLink msgTenvSut green
  HiLink msgOutSut green
  HiLink msgOutTenv String
  HiLink msgInSut green
  HiLink msgInTenv green
  HiLink msgError red
  HiLink verdPass Function
  HiLink verdFail red

"UEC
  HiLink msgSutTenv green
  HiLink msgTenvSut green
  HiLink msgInSutASN green
  HiLink sutFunc Comment
  HiLink invalidData red
  HiLink msgInSut green
  HiLink msgInSut1 green
  HiLink msgOutSut String
  HiLink msgOutSut1 String
  HiLink msgOutSutASN String
  HiLink errorTemplate Exception 

"TTCN3
  HiLink mtcFailed red_inv
  HiLink matchFailed Exception
  HiLink cofiFailed red_inv
  HiLink UNDFFailed red_inv
  HiLink setvFailed red
  HiLink uninitVal red_inv
  HiLink finalVerdictFail1 red_inv
  HiLink finalVerdictFail2 red_inv
  HiLink finalVerdictPass green
  HiLink msgIn green
  HiLink msgOut String
  HiLink CONV red
  HiLink TYPE red
  HiLink MANY red
" endif

