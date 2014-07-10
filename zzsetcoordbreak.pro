
;+
; INPUT
;    dx,dy,                       decenter x/y [mm]
;    tilt_x,tilt_y,tilt_z         tilt around x/y/z [deg]
;-
pro zSetCoordBreak, surf, dx,dy,tilt_x,tilt_y,tilt_z
    zGetSurfaceData, surf, type=type
    if type ne "COORDBRK" then message, "Surface "+strtrim(surf,2)+" is not a coord break"  
    zSetSurfaceParameter, surf, 1, dx
    zSetSurfaceParameter, surf, 2, dy
    zSetSurfaceParameter, surf, 3, tilt_x
    zSetSurfaceParameter, surf, 4, tilt_y
    zSetSurfaceParameter, surf, 5, tilt_z
end
