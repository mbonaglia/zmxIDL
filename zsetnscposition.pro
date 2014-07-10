PRO zSetNSCPosition, surf, object, code, data, timeout=timeout
    ; TODO check surf is inside proper range

    cmd = string(format='(%"SetNSCPosition,%d,%d,%d,%f")',surf, object,code, data)
    ret = zemax(cmd, time=timeout)

end