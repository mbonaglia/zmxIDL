;+
; This item sets wavelength data.
;
; SYNOPSIS
;   zSetWave, n, wavelenght, weight
;   or
;   zSetWave, 0, primary, number
;
; KEYWORDS
;   ret            returned string
;
; REFERENCES
; From Zemax Manual:
; This item sets wavelength data. The syntax is
; SetWave, 0, primary, number
; or
; SetWave, n, wavelength, weight
; 
; If the value for n is zero, then the primary wavelength number and the total
; number of wavelengths is set to the new integer values. 
; If n is a valid wavelength number (between 1 and the number of wavelengths, inclusive)
; then the wavelength in micrometers and the wavelength weight are both set. 
;
; SEE
;   zGetWave. 
;-
pro zsetwave, n, wavelenght, weight, ret=ret
    
    if test_type(n, /nofloating) ne 0 then  $
        message, string(format='(%"n must be of integer type. %s")',usage), BLOCK='Zemax', NAME='M_ZMX_ZMX' 

    cmd = string(format='(%"SetWave, %d, %f, %f")', n, wavelenght, weight)
    ret = zemax(cmd)
end
