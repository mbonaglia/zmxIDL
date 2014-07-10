
;+
;-
function zGetCoordBreak, surf 
    zGetSurfaceData, surf, type=type
    if type ne "COORDBRK" then message, "Surface "+strtrim(surf,2)+" is not a coord break"  
    dx = zGetSurfaceParameter(surf, 1)
    dy = zGetSurfaceParameter(surf, 2)
    tx = zGetSurfaceParameter(surf, 3)
    ty = zGetSurfaceParameter(surf, 4)
    tz = zGetSurfaceParameter(surf, 5)

    return, {dx:dx, dy:dy, tx:tx, ty:ty, tz:tz }
end
