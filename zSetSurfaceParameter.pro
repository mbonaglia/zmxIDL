
pro zSetSurfaceParameter, surf, par_number, par_value, timeout=timeout
    ; TODO check surf is inside proper range

    cmd = string(format='(%"SetSurfaceParameter,%d,%d,%f")',surf, par_number, par_value)
    ret = zemax(cmd, time=timeout)

end
