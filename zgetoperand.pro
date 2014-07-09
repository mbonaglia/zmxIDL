
;+
;
; This item gets the operand data from the Merit Function Editor. The syntax is:
;
; GetOperand, row, column
; 
; Row is the operand row number in the Merit Function Editor. Column is 1 for the operand type as a string, 
; such as "EFFL", 2 for int1, 3 for int2, 4#7 for data1#data4, 8 for target, 9 for weight, 10 for value, and
; 11 for percent contribution. The returned string is the numeric or string value of the requested parameter. 
; To update the merit function prior to calling GetOperand, use the Optimize item with the number of cycles 
; set to -1. 
; 
; See also SetOperand and Optimize.
;
;-  

function zgetoperand, row, column=column

  if arg_present(column) EQ 0 then column = 10
  
  ope = string(format='(%"GetOperand, %d, %d")',row, column)
  ret = double( zemax(ope) )
  return, ret
  
end  
