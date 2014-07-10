function zGetNSCObjectData, surf, object, code

    ; TODO check surf is inside proper range
    cmd = string(format='(%"GetNSCObjectData,%d,%d,%d")',surf,object,code)
    return,  zemax(cmd, time=timeout)

end