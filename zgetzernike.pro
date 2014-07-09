function zGetZernike, surf
    max_term    = zGetExtra(surf, 1)
    norm_radius = zGetExtra(surf, 2)
    coeff = dblarr(max_term)
    for i=0, max_term-1 do coeff[i] = zGetExtra(surf, i+3)
    str = { $
        max_term  : long(max_term),  $
        norm_radius : norm_radius, $
        coeff : coeff $
        }
    return, str
end

