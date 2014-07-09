;
; HPS: Huygens PSF
;
; sr = Strehl Ratio
; center_coord = coordinates of the central pixel in the returned map. Central pixel of a 32,32 map is the pixel 17,17
; pixel_size = size of a pixel of the map [um]
; 
; 
function zHps, timeout=timeout, file=file, settingsfile=settingsfile, $
    sr=sr, center_coord=center_coord, pixel_size=pixel_size

  if n_elements(file) eq 0 then file = getenv('IDL_TMPDIR')+'hps.txt'
  if file_test(file, /regular) eq 1 then file_delete, file
  if n_elements(settingsfile) eq 0 then begin
    settingsfile=''
    flag=0
  endif else begin
    if file_test(settingsfile) eq 0 then message, 'Settingsfile not existing '+settingsfile  
   flag=1
  endelse
  cmd = string(format='(%"GetTextFile, \"%s\", Hps, \"%s\", %d")',file,settingsfile,flag)
  ret = zemax(cmd, time=timeout)
  if ret ne 'OK' then begin
    message, string(format='(%"Could not get image from text file %s. return string is %s")',file,ret), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  endif
  res = read_ascii(file, count=count, header=header, data_start=18)
  sr=double( (strsplit(header[11], ':',/extr))[1])
  dum=strsplit(header[15], ':,',/extr)
  center_coord = [double(dum[1]), double(dum[2])]
  dum=strsplit(header[9], ' ',/extr)
  pixel_size = double(dum[3])
  return, rotate(res.(0),7)
end
