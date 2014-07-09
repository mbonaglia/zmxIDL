pro zModifySettings, filename, type, value, timeout=timeout
    cmd = string(format='(%"ModifySettings, \"%s\", \"%s\", %f")',file, type, value)
    ret = zemax(cmd, timeout=timeout)
    if ret eq -1 then begin
        message, string(format='(%"Invalid file %s")',file), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
    endif
    if ret eq -2 then begin
        message, string("Incorrect version number"), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
    endif
    if ret eq -3 then begin
        message, string("File access conflict"), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
    endif
end
