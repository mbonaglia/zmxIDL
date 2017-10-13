;+
; ret = zGetGlobalMatrix()
;
; see GetGlobalMatrix Zemax command
; From the ZEMAX manual:
; This item returns the matrix required to convert any local coordinates
; (such as from a ray trace) into global coordinates. For details on the global
; coordinate matrix, see “Global Coordinate Reference Surface” on page 107.
; The syntax for this item is:
; GetGlobalMatrix,surf
; The returned data string is in the format
; “R11,R12,R13,R21,R22,R23,R31,R32,R33,Xo,Yo,Zo”
;
;
; the function returnes a structure with the fields:
; R
; r0
;
; R is a 3x3 rotation matrix containing:
; [[R11,R12,R13],$
;  [R21,R22,R23],$
;  [R31,R32,R33]]
;
; r0 is a 3-element vector containig:
; [Xo,Yo,Zo]
;  
;
; HISTORY
; 11/Apr/2016  A. Riccardi
;
;-

function zGetGlobalMatrix, surf, timeout=timeout

  cmd = string(format='(%"GetGlobalMatrix,%d")',surf)
  str_ret = zemax(cmd, time=timeout)
  str_vec = strsplit(str_ret, ",", /EXTRACT)

  ret = { $
    R:  reform(float(str_vec[0:8]),3,3) , $
    r0: float(str_vec[9:11]) $
  }
  
  return, ret
end
