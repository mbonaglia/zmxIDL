PRO zSetNSCParameter, surf, object, parameter, data, timeout=timeout
    ; TODO check surf is inside proper range

    cmd = string(format='(%"SetNSCParameter,%d,%d,%d,%f")',surf, object, parameter, data)
    ret = zemax(cmd, time=timeout)

end