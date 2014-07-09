
;+
;SetOperand
;This item sets the operand data in the Merit Function Editor. The syntax is:
;
;SetOperand, row, column, value
;
;Row is the operand row number in the Merit Function Editor. Column is 1 for type, 2 for int1, 3 for int2, 4#7 for
;data1#data4, 8 for target, and 9 for weight. The returned string is the same as for GetOperand. To set the operand
;type, use column = 1, and for the value use the name of the operand, such as "EFFL".
;To update the merit function after calling SetOperand, use the Optimize item with the number of cycles set to
;#1. See also GetOperand and Optimize.
;-

pro zsetoperand, row, column, value
    ret = zemax(string(format='(%"SetOperand, %d, %d, %f")',row, column, double(value)))
end
