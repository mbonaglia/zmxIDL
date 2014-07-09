;+
; Extract field data
;
; SYNOPSIS
; field_data = zGetField(field_number) 
;
; RETURN 
;   field_data       If n is zero, the returned structure is  as follows:
;                    "type, number, max_x_field, max_y_field, normalization_method"
;                    If n is not zero, but corresponds to a valid field number, the returned struct as follows:
;                    "xfield, yfield, weight, vdx, vdy, vcx, vcy, van"
;                
;
; INPUT 
;   field_number         zero or the field number
;
; KEYWORD
;   numberconfig         number of configurations
;   currentconfig        current configuration
;
; REFERENCES
; From Zemax Manual:
; This item extracts field data. 
; The syntax is GetField, n where n is zero or the field number. 
; If n is zero, the returned string is formatted as follows:
; "type, number, max_x_field, max_y_field, normalization_method"
; The parameter type is an integer; either 0, 1, 2, or 3 for angles in degrees, object height, paraxial image height,
; or real image height, respectively. The parameter number is the number of fields currently defined.
; The max_x_field and max_y_field values are used to normalize field coordinates, see “Normalized field coordinates”
; on page 53. The field normalization method is 0 for radial and 1 for rectangular.
; If n is not zero, but corresponds to a valid field number, the returned string is formatted as follows:
; "xfield, yfield, weight, vdx, vdy, vcx, vcy, van"
; These 8 values are exponential format floating point numbers for the various field data. See also SetField.
;
; SEE 
;   zSetField
; 
;-
function zGetField, nfield
    cmd = string(format='(%"GetField, %d")', nfield)
    ret = zemax(cmd)
    if nfield gt 0 then begin 
        data = fltarr(8)
        reads, ret, data
        struct = { $
            xfield: data[0], $
            yfield: data[1], $
            weight: data[2], $
            vdx:    data[3], $
            vdy:    data[4], $
            vcx:    data[5], $
            vcy:    data[6], $
            van:    data[7]  $
        }
        return, struct
    endif else begin
        data = fltarr(5)
        reads, ret, data
        struct = { $
            type:                    data[0], $
            number:                  data[1], $
            max_x_field:             data[2], $
            max_y_field:             data[3], $
            normalization_method:    data[4] $
        }
        return, struct
    endelse
end
