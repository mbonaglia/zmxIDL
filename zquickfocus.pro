;+
; zQuickFocus, mode, use_cenroid
;
; see QuickFocus Zemax command
;
; this procedure performs a quick best focus adjustment of the optical system. 
; The value mode should be 0, 1, 2, or 3 for RMS spot radius, spot x, spot y, or wavefront OPD.
; The value for use_centroid should be 0 or 1 to indicate the RMS should be referenced to the chief ray
; or image centroid, respectively. The "best" focus is chosen as a wavelength weighted average over
; all fields. The return value is always "OK".
; 
; HISTORY
; 09/Apr/2016  A. Riccardi
;
;-

pro zQuickFocus, mode, use_centroid, timeout=timeout

  cmd = string(format='(%"QuickFocus,%d,%d")',mode,use_centroid)
  str_ret = zemax(cmd, time=timeout)
  
end
