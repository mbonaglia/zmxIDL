
;+
; This item sets field data. 
; The syntax is
; SetField, 0, type, number, normalization
; or
; SetField, n, xf, yf, [wgt, vdx, vdy, vcx, vcy, van]
; or
; SetField, n, fieldstruct
;
; If the value for n is zero, then the field type, total number of fields, 
; and field normalization type is set to the
; new values. The field type is 0 for angle, 1 for object height, 
; 2 for paraxial image height, and 3 for real image
; height. The field normalization type is 0 for radial and 1 for rectangular.
; If n is a valid field number (between 1 and the number of fields, inclusive)
; then the field x and y values, field weight, and vignetting factors are all set.
; See also GetField. 
;-
pro zsetfield, n, xf, yf, wgt, vdx, vdy, vcx, vcy, van, ret=ret
    linefeed = string(10B)
    usage  = "Usage: "+linefeed
    usage += " SetField, 0, type, number, normalization "+linefeed
    usage += " or "+linefeed
    usage += " SetField, n, xf, yf, wgt, vdx, vdy, vcx, vcy, van"

    if test_type(n, /nofloating) ne 0 then  $
        message, string(format='(%"n must be of integer type. %s")',usage), BLOCK='Zemax', NAME='M_ZMX_ZMX' 

    if n eq 0 then begin
        cmd = string(format='(%"SetField, 0, %d, %d, %d")', xf, yf, wgt)
    endif else begin
        if test_type(xf, /struct) eq 0 then begin
            cmd = string(format='(%"SetField, %d, %f, %f, %f, %f, %f, %f, %f, %f")', $
                n, xf.xfield, xf.yfield, xf.weight, xf.vdx, xf.vdy, xf.vcx, xf.vcy, xf.van)
        endif else begin
            if n_elements(wgt) eq 0 then begin
                wgt=1.0 & vdx=0. & vdy=0. & vcx=0. & vcy=0. & van=0.
            endif
            cmd = string(format='(%"SetField, %d, %f, %f, %f, %f, %f, %f, %f, %f")', $
                n, xf, yf, wgt, vdx, vdy, vcx, vcy, van) 
        endelse 
    endelse
    ret = zemax(cmd)
end
