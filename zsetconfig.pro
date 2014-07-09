
;+
; Switches configuration and update the system
;
; SYNOPSIS
; zSetConfig, configuration, numberconfig=numberconfig, currentconfig=currentconfig
;
; RETURN 
;   currentconfig
;
; KEYWORD
;   numberconfig         number of configurations
;   currentconfig        current configuration
;
; REFERENCES
; From Zemax Manual:
; This  item switches  the current configuration number and updates  the system. 
; The desired configuration  is appended to the item name. 
; For example, to switch to configuration 3, the item name is "SetConfig,3".
; The returned string is formatted as follows:
; "currentconfig, numberconfig, error"
; The currentconfig is the new configuration number, which will be between 1 and the value of numberconfig.
; Normally, this will be the desired configuration requested in the item name, as long as it was a valid configuration
; number. The error code  is  the same as  returned by  the GetUpdate  item, and will be zero  if  the new current
; configuration is traceable. See also GetConfig.
;
; SEE 
;   zGetConfig.
;-

pro zSetConfig, configuration, numberconfig=numberconfig, currentconfig=currentconfig
  ret = zemax(string(format='(%"SetConfig,%d")',configuration))
  aaa = strsplit(ret, ',', /extr)
  currentconfig=fix(aaa[0])
  numberconfig=fix(aaa[1])
  error=aaa[2]
  if error ne 0 or currentconfig ne configuration then  $
      message, string(format='(%"Error setting config %d. Current config %d, Number of config %d, error code %d")',$
        configuration, currentconfig, numberconfig, error),  BLOCK='Zemax', NAME='M_ZMX_ZMX' 

end
