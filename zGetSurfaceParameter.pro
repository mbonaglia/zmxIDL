
function zGetSurfaceParameter, surf, par_number, timeout=timeout
    ; TODO check surf is inside proper range

    cmd = string(format='(%"GetSurfaceParameter,%d,%d")',surf, par_number)
    return, double( zemax(cmd, time=timeout) )

end
