function zGetNSCPosition, surf, object, timeout=timeout
    ; TODO check surf is inside proper range

    cmd = string(format='(%"GetNSCPosition,%d,%d")',surf, object)
    return, double( zemax(cmd, time=timeout) )

end