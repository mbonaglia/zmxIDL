
;+
; Loads a ZEMAX file into the server. The syntax is:
; LoadFile,filename,append
; Note that loading a file does not change the data displayed in the LDE; the server process has a separate copy
; of the lens data. The file name to be loaded is appended to the LoadFile item name, and must include the full
; path. For example: "LoadFile,C:\ZEMAX\SAMPLES\COOKE.ZMX".
; The value append may be omitted. If present and greater than zero, then the new file is appended to the current
; file starting at the surface number defined by the value append. 
; The returned string is the same as for the GetUpdate item; after updating the newly loaded lens file. If a value
; other than 0 is returned, the Update failed, if #999 is returned, the file could not be loaded. See also GetPath,
; SaveFile, and PushLens.
; 
;-

pro zLoadFile, filename, append=append, ret=ret
  if n_elements(append) ne 0 then begin
      cmd = string(format='(%"LoadFile,%s,%d")',filename,append) 
  endif else begin
      cmd = string(format='(%"LoadFile,%s")',filename)
  endelse
  ret = zemax(cmd, time=30)
  if ret ne 0 then message, string(format='(%"Could not load file, %s")',filename), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
end
