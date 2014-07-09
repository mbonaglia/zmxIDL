function zSim, timeout=timeout, file=file, settingsfile=settingsfile

  if n_elements(file) eq 0 then file = getenv('IDL_TMPDIR')+'sim.txt'
  if file_test(file, /regular) eq 1 then file_delete, file
  if n_elements(settingsfile) eq 0 then begin
    settingsfile=''
    flag=0
  endif else begin
    if file_test(settingsfile) eq 0 then message, 'Settingsfile not existing '+settingsfile  
   flag=1
  endelse
  cmd = string(format='(%"GetTextFile, \"%s\", Sim, \"%s\", %d")',file,settingsfile,flag)
  ret = zemax(cmd, time=timeout)
  if ret ne 'OK' then begin
    message, string(format='(%"Could not get image from text file %s. return string is %s")',file,ret), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  endif

  openr, lun, file, /GET_LUN
  header = strarr(20)
  readf, lun, header
  free_lun, lun
  junk = ""
  data = ""
  aberration = ""
  input_file = ""
  bitmap_height = 0
  bitmap_width  = 0
  object_height = 0.
  fxx = 0.
  fyy = 0.
  imx = 0.
  imy = 0.
  reads, header[7], junk, data, format='(A15,x,A)'
  case data of
    "Simulated Image": begin
        databegin = 17
        reads, header[8],  junk, aberration, format='(A15,x,A)'
        reads, header[9],  junk, input_file, format='(A15,x,A)'
        reads, header[10], junk, bitmap_height, format='(A15,x,I0)' 
        reads, header[11], junk, bitmap_width,  format='(A15,x,I0)' 
        reads, header[12], junk, object_height, format='(A15,x,F0)' 
        reads, header[13], junk, fxx, fyy, format='(A15,x,F0,x,F0)' 
        reads, header[14], junk, imx, junk, imy, format='(A15,x,F0,A4,F0)' 
        end
    "PSF Grid": begin
        databegin = 16
        reads, header[8],  junk, aberration, format='(A15,x,A)'
        reads, header[9],  junk, input_file, format='(A15,x,A)'
        reads, header[10], junk, bitmap_height, format='(A15,x,I0)' 
        reads, header[11], junk, bitmap_width,  format='(A15,x,I0)' 
        reads, header[12], junk, object_height, format='(A15,x,F0)' 
        reads, header[13], junk, fxx, fyy, format='(A15,x,F0,x,F0)' 
        end
    "Image Simulation": begin
        databegin = 13
        reads, header[8],  junk, input_file, format='(A15,x,A)'
        reads, header[9],  junk, bitmap_height, format='(A15,x,I0)' 
        reads, header[10], junk, bitmap_width,  format='(A15,x,I0)' 
        end
  else:  message, string(format='(%"Wrong format in text file %s")',file), BLOCK='Zemax', NAME='M_ZMX_ZMX'
  endcase 

  ;junk="" & www = 0 & hhh = 0 & fff =0. & fxx=0. & fyy=0.
  ;reads, header[10], junk, hhh, format='(A15,x,I0)' 
  ;reads, header[11], junk, www, format='(A15,x,I0)' 
  ;reads, header[12], junk, fff, format='(A15,x,F0)' 
  ;reads, header[13], junk, fxx, fyy, format='(A15,x,F0,x,F0)' 
  res = read_ascii(file, count=count, data_start=databegin, header=header)
  r=rotate(reform(res.(0)[2,*],bitmap_width,bitmap_height),3)
  g=rotate(reform(res.(0)[3,*],bitmap_width,bitmap_height),3)
  b=rotate(reform(res.(0)[4,*],bitmap_width,bitmap_height),3)
  
  return, { $
      data          : data,               $
      aberration    : aberration,         $
      input_file    : input_file,         $      
      bitmap_height : bitmap_height,      $
      bitmap_width  : bitmap_width,       $
      object_height : object_height,      $
      field_position: [fxx,fyy],          $
      image_size:     [imx,imy],          $
      r:r,             $
      g:g,             $ 
      b:b              $
      }
end
