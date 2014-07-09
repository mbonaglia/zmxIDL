
;+
; Loads a ZEMAX .MF or .ZMX file and extracts the merit function and places it in the lens loaded in the server.
;
; SYNOPSIS
; zLoadMerit, filename, number=number, merit=merit
;
;
; KEYWORD
;   number              (output)   number of operands in the merit function
;   merit               (output)   value of the merit function. 9e9 if the merit function cannot be evaluated
;
; REFERENCES
; From Zemax Manual:
; Loads a ZEMAX .MF or .ZMX file and extracts the merit function and places it in the lens loaded in the server.
; Note that loading a merit function file does not change the data displayed in the LDE; the server process has a
; separate copy of the lens data. The file name to be loaded is appended to the LoadMerit item name, and must
; include the full path. For example: "LoadMerit,C:\ZEMAX\SAMPLES\MyMerit.MF". The returned string is format#
; ted as follows:
; "number, merit"
; where number is the number of operands in the merit function and merit is the value of the merit function. If
; the merit function value is 9.00e+009, the merit function cannot be evaluated.
;
;-
pro zLoadMerit, filename, number=number, merit=merit
  cmd = string(format='(%"LoadMerit,%s")',filename)
  ret = zemax(cmd, time=timeout)
;  if ret ne 0 then message, string(format='(%"Could not load merit function file %s ")',mffilename), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
  aaa = strsplit(ret, ',', /extr)
  number=fix(aaa[0])
  merit=float(aaa[1])
end
