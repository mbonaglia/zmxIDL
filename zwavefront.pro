function zWavefront, timeout=timeout, file=file, config=config

  if n_elements(file) eq 0 then file = getenv('IDL_TMPDIR')+'wavefront.txt'

  if n_elements(config) ne 0 then begin
    origcfg=zgetconfig()
    zsetconfig,config
  endif
  

  cmd = string(format='(%"GetTextFile, \"%s\", Wfm, \"\", 0")',file)
  ret = zemax(cmd, time=timeout)
  
  if n_elements(config) ne 0 then begin
    zsetconfig, origcfg
  endif
  
  if ret ne 'OK' then begin
    message, string(format='(%"Could not get wavefront from text file %s. return string is %s")',file,ret), $
        BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  endif

  res = read_ascii(file, count=count, data_start=16, header=header) 
  return, res.(0)
end
