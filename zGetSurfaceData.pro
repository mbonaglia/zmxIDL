pro zGetSurfaceData, surf, typename=typename, comment=comment, curvature=curvature, thickness=thickness,$
   glass=glass, semidiameter=semidiameter, conic=conic, coating=coating, tce=tce, timeout=timeout

    ; TODO check surf is inside proper range

    if arg_present(typename) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,0")',surf)
        typename = zemax(cmd, time=timeout)
    endif
    if arg_present(comment) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,1")',surf)
        comment = zemax(cmd, time=timeout)
    endif
    if arg_present(curvature) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,2")',surf)
        curvature = double( zemax(cmd, time=timeout) )
    endif
    if arg_present(thickness) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,3")',surf)
        thickness = double( zemax(cmd, time=timeout) )
    endif
    if arg_present(glass) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,4")',surf)
        glass = zemax(cmd, time=timeout) 
    endif
    if arg_present(semidiameter) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,5")',surf)
        semidiameter = double( zemax(cmd, time=timeout) )
    endif
    if arg_present(conic) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,6")',surf)
        conic = double( zemax(cmd, time=timeout) )
    endif
    if arg_present(coating) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,7")',surf)
        coating = zemax(cmd, time=timeout) 
    endif
    if arg_present(tce) ne 0 then begin
        cmd = string(format='(%"GetSurfaceData,%d,8")',surf)
        tce = double( zemax(cmd, time=timeout) )
    endif

end
