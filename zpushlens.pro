pro zPushLens, update_windows=update_windows
  if n_elements(update_windows) eq 0 then cmd='PushLens,0' else cmd='PushLens,1'  
  ret = zemax(cmd)
  if ret eq -999 then begin
    allow = zPushLensPermission()
    if allow eq 0 then message, $
        "Check 'Allow Extensions To Push Lenses' under File, Preferences on the Editors tab. ", $
      BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  endif
  if ret ne 0 then message, $
      string(format='(%"Could not push currently loaded lens into the Lens Data Editor. Error code %d")',ret), $
      BLOCK='Zemax', NAME='M_ZMX_ZMX' 
end
