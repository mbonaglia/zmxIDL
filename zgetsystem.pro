
;GetSystem
;This item extracts system data.
;The returned string is formatted as follows:
;"numsurfs, unitcode, stopsurf, nonaxialflag, rayaimingtype, adjust_index, temp, pressure, globalrefsurf,
;need_save"
;This item returns the number of surfaces, the unit code (0, 1, 2, or 3 for mm, cm, in, or M), the stop surf number,
;a flag to indicate if the system is non#axial symmetric (0 for axial, 1 if not axial), the ray aiming (0 for off, 1 for
;paraxial, 2 for real), the adjust index data to environment flag (0 if false, 1 if true), the current temperature and
;pressure, and the global coordinate reference surface number. The need_save value indicates whether the file
;has been modified
;See also SetSystem and GetSystemAper.


function zgetSystem
    ret=zemax('GetSystem')
    str = strsplit(ret, ',', /extr)
    numsurfs = long(str[0])
    unitcode = long(str[1])
    stopsurf = long(str[2])
    nonaxialflag = long(str[3])
    rayaimingtype = long(str[4])
    adjust_index = long(str[5])
    temp = float(str[6])
    pressure = float(str[7])
    globalrefsurf = long(str[8])
    ;need_save = str[9]
    return, {numsurfs:numsurfs, unitcode:unitcode, stopsurf:stopsurf, nonaxialflag:nonaxialflag, $
        rayaimingtype:rayaimingtype, adjust_index:adjust_index, temp:temp, pressure:pressure, $
        globalrefsurf:globalrefsurf}
end

