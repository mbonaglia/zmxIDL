
;+
;
; Optimize calls the ZEMAX Damped Least Squares optimizer. The syntax is: 
; 
; Optimize,n
; 
; where n is the number of cycles to run. The return value is the final merit function. If the merit function
; value returned is 9.0E+009, the optimization failed, usually because the lens or merit function could not be
; evaluated. If n is zero, the optimization runs in automatic mode. If n is less than zero (for example, n = -1),
; Optimize updates all operands in the merit function and returns the current merit function, 
; and no optimization is performed.
;
;-

function zOptimize, n, timeout=timeout

;  if n GT 0 then print,'Running Optimization of'+string(n, format='(I2)')+' cycles...' $
;  else begin
;    if n EQ 0 then print,'Running automatic Optimization...'
;    if n LT 0 then print,'Updating merit function editor...'
;  endelse
  
  opt = string(format='(%"Optimize,%d")',n)
  ret = double(zemax(opt, time=timeout))
  return, ret
  
end    
