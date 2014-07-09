
;+
; This item extracts data from the multiconfiguration editor. The syntax is
;
; GetMulticon, config, row
; If the config number is greater than zero and less than or equal to the number of configurations, the returned
; string is formatted as follows:
; "value, num_config, num_row, status, pickuprow, pickupconfig, scale, offset"
; If the config number is zero, the multicon operand type data is returned as follows:
; "operand_type, number1, number2, number3"
; The numbers are used as described in “Summary of multi#configuration operands” on page 539. The status
; integer is 0 for fixed, 1 for variable, 2 for pickup, and 3 for thermal pickup. If status is 2 or 3, the pickuprow and
; pickupconfig values indicate the source data for the pickup solve.
;
; See also SetMulticon.
;
;-

function zGetMulticon, config, row, verbose=verbose, return_struct=return_struct
    ret = zemax(string(format='(%"GetMulticon,%d,%d")',config, row))
    if config gt 0 then begin
        aaa = strsplit(ret, ',', /extr)
        value        = aaa[0]
        num_config   = fix(aaa[1])
        num_row      = fix(aaa[2])
        status       = fix(aaa[3])
        pickuprow    = fix(aaa[4])
        pickupconfig = fix(aaa[5])
        scale        = float(aaa[6])
        offset       = float(aaa[7])
        return_struct = {num_config:num_config, $
            num_row:num_row, $
            status:status, $
            pickuprow:pickuprow, $
            pickupconfig:pickupconfig, $
            scale:scale, $
            offset:offset }
        return, double(value)
    endif
    if config eq 0 then begin
        aaa = strsplit(ret, ',', /extr)
        operand_type  = aaa[0]
        number_1      = aaa[1]
        number_2      = aaa[2]
        number_3      = aaa[3]
        return_struct = {operand_type:operand_type, $
                number_1:number_1,  $
                number_2:number_2, $
                number_3:number_3}
        return, return_struct
    endif
    return, -1L   
end
