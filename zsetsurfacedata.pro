pro zSetSurfaceData, surf, typename=typename, comment=comment, curvature=curvature, thickness=thickness,$
   glass=glass, semidiameter=semidiameter, conic=conic, coating=coating, tce=tce, timeout=timeout

    ; TODO check surf is inside proper range

    if n_elements(typename) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,0,%s")',surf, typename)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(comment) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,1,%s")',surf,comment)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(curvature) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,2,%s")',surf,curvature)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(thickness) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,3,%f")',surf, thickness)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(glass) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,4,%s")',surf, glass)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(semidiameter) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,5,%f")',surf, semidiameter)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(conic) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,6,%f")',surf, conic)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(coating) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,7,%s")',surf, coating)
        ret = zemax(cmd, time=timeout)
    endif
    if n_elements(tce) ne 0 then begin
        cmd = string(format='(%"SetSurfaceData,%d,8,%f")',surf, tce)
        ret = zemax(cmd, time=timeout)
    endif

end
