;+
; ret = zGetFirst()
;
; see GetFirst Zemax command
;
; the function returns first order data about the lens. The returned structure has the following fields:
; focal
; pwfn
; rwfn
; pima
; pmag
; 
; The fields contain the EFL, paraxial working F/#, real working F/#, paraxial image height, 
; and paraxial magnification.
; 
; HISTORY
; 09/Apr/2016  A. Riccardi
;
;-

function zGetFirst, timeout=timeout

  cmd = "GetFirst"
  str_ret = zemax(cmd, time=timeout)
  str_vec = strsplit(str_ret, ",", /EXTRACT)

  ret = { $
    focal:float(str_vec[0]) , $
    pwfn: float(str_vec[1]) , $
    rwfn: float(str_vec[2]) , $
    pima: float(str_vec[3]) , $
    pmag: float(str_vec[4])   $
  }
  
  return, ret
end
