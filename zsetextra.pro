
;+
;This item sets the extra surface data. The syntax is
;
;SetExtra, surf, column, value
;
;The returned string is formatted as follows:
;"value"
;
;See also GetExtra.
;-
pro zSetExtra, surf, column, value, return=ret
    ret = zemax(string(format='(%"SetExtra,%d,%d,%f")',surf, column, double(value)))
end

