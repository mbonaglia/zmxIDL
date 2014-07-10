
function zGetNSCData, surf, code
    ; TODO check surf is inside proper range

    cmd = string(format='(%"GetNSCData,%d,%d")',surf,code)
    return, zemax(cmd, time=timeout)

end