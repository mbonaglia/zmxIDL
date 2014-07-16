pro test_install
  help, 'zemaxmodule', /dlm
  zddeclose
  a=''
  read, a, prompt='Run ZEMAX and press a button when ready:'
  catch, errorStatus
  if errorStatus ne 0 then begin
    catch, /cancel
    print, 'zmxIDL cannot communicate with ZEMAX. Aborting'
    return
  endif 
  print, 'retrieved ZEMAX version:' + zemax('GetVersion')
    
  print, 'zmxIDL installation seems ok - Communication with ZEMAX is ok'
end