
;+
; This item extracts the extra surface data. The syntax is
;
; GetExtra, surf, column
;
; The returned string is formatted as follows:
; "value"
; See also SetExtra.
;-

function zGetExtra, surf, column
    ret = zemax(string(format='(%"GetExtra,%d,%d")',surf, column))
    return, double(ret)   
end
