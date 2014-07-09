
;+
; This function extracts the current configuration number and the number of configurations
;
; SYNOPSIS
; currentconf = zGetConfig( numberconfig=numberconfig)
;
; RETURN 
;   currentconfig
;
; KEYWORD
;   numberconfigs        (output) number of configurations
;
; TODO/BUG 
;   numbermcoper non viene ritornato. controllare matlab 
; 
; SEE 
;   SetConfig.
;-

function zgetconfig, numberconfig=numberconfig ;, numbermcoper=numbermcoper
  ret = zemax('GetConfig')
  aaa = strsplit(ret, ',', /extr)
  currentconfig=fix(aaa[0])
  numberconfig=fix(aaa[1])
  ;numbermcoper=aaa[2]
  return, currentconfig 
end
