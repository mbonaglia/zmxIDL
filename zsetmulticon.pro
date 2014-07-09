
;+
; This item sets data in the multi-configuration editor. 
; To set multi-configuration data, the syntax is
;    SetMulticon, config, row, value, status, pickuprow, pickupconfig, scale, offset
;
; If the config number is zero, SetMulticon may be used to set the operand type and number data using this syntax:
;    SetMulticon, 0, row, operand_type, number1, number2, number3
;
; The returned string is formatted as defined for "GetMulticon". The numbers are used as described in “Summary
; of multi#configuration operands” on page 539.
; 
; See also GetMulticon
;-
pro zSetMulticon,  config, row, value, status, pickuprow, pickupconfig, scale, offset, return=ret
    if config eq 0 then begin
        ret = zemax(string(format='(%"SetMulticon, 0, %d, %s, %f, %f, %f")', $
            row, value, status, pickuprow, pickupconfig))
    endif else begin
        ret = zemax(string(format='(%"SetMulticon, %d, %d, %0.9f, %d, %d, %d, %f, %0.9f")', $
            config, row, value, status, pickuprow, pickupconfig, scale, offset))
    endelse
end
