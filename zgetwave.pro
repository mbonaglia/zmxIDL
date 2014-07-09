
;+
; This item extracts wavelength data. 
;
; SYNOPSIS
;   wave_data = zGetWave(n)
;
; RETURN 
;   wave_data       wavelenght data
;                   If n is zero, the returned struct is as follows: "primary, number"
;                   where primary is an integer which indicates which of the wavelengths 
;                   is the primary one, and number is the number of wavelengths currently defined. 
;
;                   If n is not zero, but corresponds to a valid wavelength number, the returned
;                   struct is as follows: "wavelength, weight"
;                   These 2 values are exponential format floating point numbers which correspond
;                   to the value and weight for the specified wavelength. 
; 
;
; REFERENCES
; From Zemax Manual:
; This item extracts wavelength data. 
; The syntax is
; GetWave, n
; where n is zero or the wavelength number. 
;
; If n is zero, the returned string is formatted as follows: "primary, number"
; The parameter primary is an integer which indicates which of the wavelengths 
; is the primary one. The parameter number is the number of wavelengths currently defined. 
;
; If n is not zero, but corresponds to a valid wavelength number, the returned
; string is formatted as follows: "wavelength, weight"
; These 2 values are exponential format floating point numbers which correspond
; to the value and weight for the specified wavelength. 
;
; See also SetWave.
;
; SEE
;   zSetWave. 
;-
function zgetwave, n
    cmd = string(format='(%"GetWave, %d")', n)
    ret = zemax(cmd)
    if n gt 0 then begin 
        data = fltarr(2)
        reads, ret, data
        struct = { $
            wavelength: data[0], $
            weight:     data[1]  $
        }
        return, struct
    endif else begin
        data = intarr(2)
        reads, ret, data
        struct = { $
            primary:                 data[0], $
            number:                  data[1]  $
        }
        return, struct
    endelse
    
end
