
function zRfm, timeout=timeout, file=file, settingsfile=settingsfile

  if n_elements(file) eq 0 then file = getenv('IDL_TMPDIR')+'rfm.txt'
  if file_test(file, /regular) eq 1 then file_delete, file
  if n_elements(settingsfile) eq 0 then begin
    settingsfile=''
    flag=0
  endif else begin
    if file_test(settingsfile) eq 0 then message, 'Settingsfile not existing '+settingsfile  
    flag=1
  endelse
  cmd = string(format='(%"GetTextFile, \"%s\", Rfm, \"%s\", %d")',file,settingsfile,flag)
  ret = zemax(cmd, time=timeout)
  if ret ne 'OK' then begin
    message, string(format='(%"Could not get image from text file %s. return string is %s")',file,ret), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  endif
  res = read_ascii(file, count=count, data_start=16)
  return, rotate(res.(0),7)
end
