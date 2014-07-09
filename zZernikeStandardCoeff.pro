function zZernikeStandardCoeff, timeout=timeout, file=file, settingsfile=settingsfile

  if n_elements(file) eq 0 then file = getenv('IDL_TMPDIR')+'zern.txt'
  if n_elements(settingsfile) eq 0 then begin
    settingsfile=''
    flag=0
  endif else begin
    flag=1
  endelse

  cmd = string(format='(%"GetTextFile, \"%s\", Zst, \"%s\", %d")',file,settingsfile,flag)
  ret = zemax(cmd, time=timeout)
  if ret ne 'OK' then begin
    message, string(format='(%"Could not get Zernike Standard coeff from text file %s. return string is %s")',file,ret), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  endif
  res = read_ascii(file, count=count, data_start=37)
  return, reform(res.field1[2,*])
end
