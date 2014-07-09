
function zFps, timeout=timeout, file=file, settingsfile=settingsfile, param=param

  if n_elements(file) eq 0 then file = getenv('IDL_TMPDIR')+'fps.txt'
  if file_test(file, /regular) eq 1 then file_delete, file
  if n_elements(settingsfile) eq 0 then begin
    settingsfile=''
    flag=0
  endif else begin
    if file_test(settingsfile) eq 0 then message, 'Settingsfile not existing '+settingsfile  
    flag=1
  endelse
  cmd = string(format='(%"GetTextFile, \"%s\", Fps, \"%s\", %d")',file,settingsfile,flag)
  ret = zemax(cmd, time=timeout)
  if ret ne 'OK' then begin
    message, string(format='(%"Could not get image from text file %s. return string is %s")',file,ret), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  endif
  header=strarr(18)
  openr, lun, file, /get_lun
  readf, lun, header
  free_lun, lun
  zmxfile = "" 
  config  = 0  
  lambda  = 0.
  hx = 0.
  hy = 0.
  h_unit = ""
  data_spacing = 0.
  ref_x = 0.
  ref_y = 0.
  READS, header[2], zmxfile, FORMAT='(7x,A0)' 
  READS, header[5], config, FORMAT='(14x,I0)' 
  READS, header[8], lambda, hx, hy, h_unit, FORMAT='(F0, 7x, F0, 2x, F0, x, A0)' 
  READS, header[9], data_spacing, FORMAT='(16x, F0)' 
  READS, header[12], ref_x, ref_y, FORMAT='(23x, F0, 2x, F0)' 
  param = {zmxfile:zmxfile, config:config, lambda:lambda*1d-6, h:[hx,hy], h_unit:h_unit, $
      data_spacing:data_spacing*1d-6, ref_coord:[ref_x,ref_y]*1d-3}
  print, 'Reference Coordinates', param.ref_coord
  res = read_ascii(file, count=count, data_start=18)
  ref_px = param.ref_coord/param.data_spacing
  fr = shift(res.(0), -ref_px[0], ref_px[1])
  return,  rotate(fr,5)
end
