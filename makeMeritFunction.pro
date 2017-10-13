; general Zemax MF inputs

function reax, surf, wave, h, p, target, weight
  return, string(FORMAT='(%"REAX %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf,wave, h[0], h[1], p[0], p[1], 0, 0, target, weight)
end

function reay, surf, wave, h, p, target, weight
  return, string(FORMAT='(%"REAY %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf,wave, h[0], h[1], p[0], p[1], 0, 0, target, weight)
end

function rear, surf, wave, h, p, target, weight
  return, string(FORMAT='(%"REAR %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf,wave, h[0], h[1], p[0], p[1], 0, 0, target, weight)
end

function equa, op1, op2, target, weight
  return, string(FORMAT='(%"EQUA %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op1, op2, 0, 0, 0, 0, 0, 0, target, weight)
end

function conf, nconf
  return, string(FORMAT='(%"CONF %d\t0\t0\t0\t0\t0\t0\t0\t0\t0\n")', nconf)
end

function blnk, msg
  return, string(FORMAT='(%"BLNK %s\n")', msg)
end

function vers, nvers
  return, string(FORMAT='(%"VERS %d\n")', nvers)
end  

function imsf, surf
  return, string(FORMAT='(%"IMSF %d 0\n")', surf)
end

function rang, surf, wave, h, p, target, weight
  return, string(FORMAT='(%"RANG %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, wave, h[0], h[1], p[0], p[1], target, weight)
end  

function opdx, surf, wave, h, p, target, weight
  return, string(FORMAT='(%"OPDX %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, wave, h[0], h[1], p[0], p[1], target, weight)
end

function diff, op1, op2, target, weight 
  return, string(FORMAT='(%"DIFF %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op1, op2, 0, 0, 0, 0, 0, 0, target, weight)
end  

function qsum, op1, op2, target, weight
  return, string(FORMAT='(%"QSUM %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op1, op2, 0, 0, 0, 0, 0, 0, target, weight)
end

function tthi, surf1, surf2, target, weight
  return, string(FORMAT='(%"TTHI %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf1, surf2, 0, 0, 0, 0, 0, 0, target, weight)
end  

function opva, op, target, weight
  return, string(FORMAT='(%"OPVA %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op, 0, 0, 0, 0, 0, 0, 0, target, weight)
end

function oplt, op, target, weight
  return, string(FORMAT='(%"OPLT %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op, 0, 0, 0, 0, 0, 0, 0, target, weight)
end

function opgt, op, target, weight
  return, string(FORMAT='(%"OPGT %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op, 0, 0, 0, 0, 0, 0, 0, target, weight)
end

function cvva, surf, target, weight
  return, string(FORMAT='(%"CVVA %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, 0, 0, 0, 0, 0, 0, 0, target, weight)
end

function abso, op, target, weight
  return, string(FORMAT='(%"ABSO %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op, 0, 0, 0, 0, 0, 0, 0, target, weight)
end  

function rgla, surf1, surf2, Wn, Wa, Wp, target, weight
  return, string(FORMAT='(%"RGLA %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf1, surf2, Wn, Wa, Wp, 0, 0, 0, target, weight)
end

function ttlt, surf, code, target, weight 
  return, string(FORMAT='(%"TTLT %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, code, 0, 0, 0, 0, 0, 0, target, weight)
end  

function etva, surf, code, target, weight  
  return, string(FORMAT='(%"ETVA %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, code, 0, 0, 0, 0, 0, 0, target, weight)
end

function cenx, surf, wave, field, pol, samp, target, weight
  return, string(FORMAT='(%"CENX %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, wave, field, pol, samp, 0, 0, 0, target, weight)
end

function ceny, surf, wave, field, pol, samp, target, weight
  return, string(FORMAT='(%"CENY %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, wave, field, pol, samp, 0, 0, 0, target, weight)
end

function ragx, surf, wave, h, p, target, weight
  return, string(FORMAT='(%"RAGX %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, wave, h, p, target, weight)
end

function ragy, surf, wave, h, p, target, weight
  return, string(FORMAT='(%"RAGY %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf, wave, h, p, target, weight)
end

function glcx, surf, target, weight
  return, string(FORMAT='(%"GLCX %d\t2\t0\t0\t0\t0\t%f\t%f\t0\t0\t0\n")', surf, target, weight)
end

function glcy, surf, target, weight
  return, string(FORMAT='(%"GLCY %d\t2\t0\t0\t0\t0\t%f\t%f\t0\t0\t0\n")', surf, target, weight)
end

function glcz, surf, target, weight
  return, string(FORMAT='(%"GLCZ %d\t2\t0\t0\t0\t0\t%f\t%f\t0\t0\t0\n")', surf, target, weight)
end

function gtce, surf, target, weight
  return, string(FORMAT='(%"GTCE %d\t2\t0\t0\t0\t0\t%f\t%f\t0\t0\t0\n")', surf, target, weight)
end

function cons, target
  return, string(FORMAT='(%"CONS \t0\t0\t0\t0\t0\t0\t0\t0\t%f\t0\t0\n")', target)
end

function maxx, op1, op2, target, weight  
  return, string(FORMAT='(%"MAXX %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op1, op2, 0, 0, 0, 0, 0, 0, target, weight)
end

function minn, op1, op2, target, weight
  return, string(FORMAT='(%"MINN %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', op1, op2, 0, 0, 0, 0, 0, 0, target, weight)
end


;-----------------------------------------------------------------------------------------------------

; Configuration. This operand is used to change the configuration number to the configuration defined
; by Cfg# during merit function evaluation. This permits optimization across multiple configurations
; with a single merit function. This operand does notuse the target or weight columns.
function line_conf, nconf
    common merit_block, merit_struct
    merit_struct.lines += 1
    return, conf(nconf)
end


; Constant value. This is used to enter in constant values for use in other operand computations. The
; value will be identical to the target value.
function line_cons, value
    common merit_block, merit_struct
    merit_struct.lines += 1
    return, cons(value)
end    

; Does nothing. Used for separating portions of the operand list. A comment line may optionally be
; typed in the space to the right of the operand name; this comment will be displayed in the editor as
; well as in the merit function listing.
function line_blank, msg
    common merit_block, merit_struct
    merit_struct.lines += 1
    return, blnk(msg)
end


; Returns  the  version  of  the  ZEMAX  program.
; The  version  is  of  the  form  yymmdd.  For
; example,  the  version  for  the  June  15,  2005
; release of ZEMAX will be 050615.
function line_vers, nvers
    return, vers(nvers)
end

function line_image_surf, surf
    common merit_block, merit_struct
    merit_struct.lines += 1
    return, imsf(surf)
end

function ring, n_arms, radius=radius
  if n_elements(radius) eq 0 then radius = 1.0
  angs   = findgen(n_arms) * 2*!pi/n_arms
  px     = fltarr(n_arms)
  py     = fltarr(n_arms)
  weight = fltarr(n_arms) + 1./n_arms
  px = radius * cos(angs)
  py = radius * sin(angs)
  return , {px:px, py:py, weight:weight}
end

;function line_rang, surf, wave, campo, px, py, target, weight
;    common merit_block, merit_struct
;    merit_struct.lines += n_elements(px)
;    str = strarr(n_elements(px))
;    for i=0, n_elements(px)-1 do str[i] = rang(surf, wave, campo, [px[i], py[i]], target, weight) 
;    return, transpose(str)
;end
function line_rang, surf, wave, h, p, target, weight
  common merit_block, merit_struct
  merit_struct.lines += 1
  return, rang(surf, wave, h, p, target, weight)
end

;function line_rms_wf, surf, wave, campo, px, py, target, weight
;    common merit_block, merit_struct
;    merit_struct.lines += n_elements(px)
;    str = strarr(n_elements(px))
;    for i=0, n_elements(px)-1 do $
;        str[i] = string(FORMAT='(%"OPDX %d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t0\t0\n")', surf,wave,campo[0],campo[1],px[i],py[i],target,weight[i])
;    return, transpose(str)
;end
function line_rms_wf, surf, wave, h, p, target, weight
  common merit_block, merit_struct
  merit_struct.lines += 1
  return, opdx(surf, wave, h, p, target, weight)
end

function footprint_size, surf, wave, h, p, footprint_radius, weight
    common merit_block, merit_struct
    str = strarr(8)
    str[0] = reax(surf, wave, h, p, 0, 0)
    str[1] = reax(surf, wave, h, -1*p, 0, 0)        
    str[2] = reay(surf, wave, h, p, 0, 0)        
    str[3] = reay(surf, wave, h, -1*p, 0, 0)
    str[4] = diff(merit_struct.lines+1, merit_struct.lines+2, 0, 0) 
    str[5] = diff(merit_struct.lines+3, merit_struct.lines+4, 0, 0) 
    str[6] = qsum(merit_struct.lines+5, merit_struct.lines+6, 0, 0) 
    str[7] = opva(merit_struct.lines+7, footprint_radius, weight) 
    merit_struct.lines += 8
    return, transpose(str)
end

function rays_distance, surf, wave, ha, hb, pa, pb, wanted_distance, weight
    common merit_block, merit_struct
    str = strarr(8)
    str[0] = reax(surf, wave, ha, pa, 0, 0)
    str[1] = reax(surf, wave, hb, pb, 0, 0)
    str[2] = reay(surf, wave, ha, pa, 0, 0)
    str[3] = reay(surf, wave, hb, pb, 0, 0)
    str[4] = diff(merit_struct.lines+1, merit_struct.lines+2, 0, 0) 
    str[5] = diff(merit_struct.lines+3, merit_struct.lines+4, 0, 0) 
    str[6] = qsum(merit_struct.lines+5, merit_struct.lines+6, 0, 0) 
    str[7] = opva(merit_struct.lines+7, wanted_distance, weight) 
    merit_struct.lines += 8
    return, transpose(str)
end

function chief_rays_distance, surf, wave, ha, hb, wanted_distance, weight
  str= rays_distance(surf, wave, ha, hb, [0., 0.], [0., 0.], wanted_distance, weight)
  return, transpose(str)
end

function centra_chief_ray, surf, wave, campo, weight, pos=pos
    common merit_block, merit_struct
    if n_elements(pos) eq 0 then pos=[0.,0.]
    merit_struct.lines += 2
    str = strarr(2)
    str[0] = reax(surf, wave, campo, [0, 0], pos[0], weight) 
    str[1] = reay(surf, wave, campo, [0, 0], pos[1], weight)
    return, transpose(str)
end

function rayXYPosition, surf, wave, h, p, target
    common merit_block, merit_struct
    str= strarr(2)
    str[0]= reax(surf, wave, h, p, target[0], 0.)
    str[1]= reay(surf, wave, h, p, target[1], 0.)
    merit_struct.lines += 2
    return, transpose(str)
end

function rayRadialPosition, surf, wave, h, p, target, weight
  common merit_block, merit_struct
  str= rear(surf, wave, h, p, target, weight)
  merit_struct.lines += 1
  return, str
end

function rayToTargetDifference, surf, wave, h, p, target
    common merit_block, merit_struct
    str= strarr(7)
    str[0:1]= transpose(rayXYPosition(surf, wave, h, p, [0.0, 0.0]))
    str[2]= cons(target[0])
    str[3]= cons(target[1])
    str[4]= diff(merit_struct.lines-1, merit_struct.lines+1, 0., 0.)
    str[5]= diff(merit_struct.lines, merit_struct.lines+2, 0., 0.)
    str[6]= qsum(merit_struct.lines+3, merit_struct.lines+4, 0., 0.)
    merit_struct.lines += 5
    return, transpose(str)
end

function twoRaysDistance, surf, wave, h1, p1, h2, p2, target
  common merit_block, merit_struct
  str= strarr(9)
  str[0:1]= transpose(rayXYPosition(surf, wave, h1, p1, [0.0, 0.0]))
  str[2:3]= transpose(rayXYPosition(surf, wave, h2, p2, [0.0, 0.0]))
  str[4]= diff(merit_struct.lines-3, merit_struct.lines-1, 0., 0.)
  str[5]= diff(merit_struct.lines-2, merit_struct.lines, 0., 0.)
  str[6]= qsum(merit_struct.lines+1, merit_struct.lines+2, 0., 0.)
  str[7]= cons(target)
  str[8]= diff(merit_struct.lines+3, merit_struct.lines+4, 0., 0.)
  merit_struct.lines += 5
  return, transpose(str)
end

function surf_radius, surf, min_radius, weight
    common merit_block, merit_struct
    str = strarr(3*n_elements(surf))
    for i=0, n_elements(surf)-1 do begin
        str[3*i]   = cvva(surf[i], 0, 0) 
        str[3*i+1] = abso(merit_struct.lines+1, 0, 0) 
        str[3*i+2] = oplt(merit_struct.lines+2, 1./min_radius, weight) 
        merit_struct.lines += 3
    endfor
    return, transpose(str)
end


;Reasonable glass. This operand restricts the deviation the index, Abbe, and deviation of the partial
;dispersion  values  may  take  from  actual  glasses  in  the  currently  loaded  glass  catalogs.  See
;“Optimizing glass selection” on page 499 for a complete discussion including a description of Wn,
;Waand Wp. The constraint is active over the surface range specified by Surf1and Surf2.
function reasonable_glass, surf1, surf2, weight, target=target, Wn=Wn, Wa=Wa, Wp=Wp
    common merit_block, merit_struct
    if n_elements(target) eq 0 then target=0.05
    if n_elements(Wn) eq 0 then Wn=0
    if n_elements(Wa) eq 0 then Wa=0
    if n_elements(Wp) eq 0 then Wp=0
    merit_struct.lines += 1
    return, rgla(surf1, surf2, Wn, Wa, Wp, target, weight)
end    

function ray_angle, surf, wave, campo, px, py, max_angle, weight
    common merit_block, merit_struct
    str = strarr(2)
    str[0] = rang(surf, wave, campo, [px, py], 0, 0) 
    str[1] = oplt(merit_struct.lines+1, max_angle, 1000*weight) 
    merit_struct.lines += 2
    return, transpose(str)
end

function thickness, surf, max_thick, weight
    common merit_block, merit_struct
    str = strarr(n_elements(surf))
    for i=0, n_elements(surf)-1 do begin
        str[i] = ttlt(surf, 0, max_thick, weight) 
        merit_struct.lines += 1
    endfor
    return, transpose(str)
end

function edge_thickness, surf, min_thick, max_thick, weight
  common merit_block, merit_struct
  str = strarr(3)
  str[0] = etva(surf, 0, 0, 0) 
  ;str[1] = string(FORMAT='(%"ABSO %d\t0\t0\t0\t0\t0\t%f\t%f\t%f\t%f")', merit_struct.lines+1, 0, 0, 0)
  str[1] = oplt(merit_struct.lines+1, max_thick, weight)
  str[2] = opgt(merit_struct.lines+1, min_thick, weight)
  merit_struct.lines += 3
  return, transpose(str)
end

function total_thickness, surf1, surf2, min_thick, max_thick, weight
    common merit_block, merit_struct
    str = strarr(3)
    str[0] = tthi(surf1, surf2-1, 0, 0) 
    ;str[1] = string(FORMAT='(%"ABSO %d\t0\t0\t0\t0\t0\t%f\t%f\t%f\t%f")', merit_struct.lines+1, 0, 0, 0)
    str[1] = oplt(merit_struct.lines+1, max_thick, weight) 
    str[2] = opgt(merit_struct.lines+1, min_thick, weight) 
    merit_struct.lines += 3
    return, transpose(str)
end

function place_pupil_on_surf, surf, wave, h1, h2, p, weight 
    common merit_block, merit_struct
    str = strarr(7)
    str[0] = reax(surf, wave, h1, p, 0, 0)
    str[1] = reax(surf, wave, h2, p, 0, 0)
    str[2] = reay(surf, wave, h1, p, 0, 0)
    str[3] = reay(surf, wave, h2, p, 0,0)
    str[4] = diff(merit_struct.lines+1, merit_struct.lines+2, 0, 0) 
    str[5] = diff(merit_struct.lines+3, merit_struct.lines+4, 0, 0) 
    str[6] = qsum(merit_struct.lines+5, merit_struct.lines+6, 0, weight) 
    merit_struct.lines += 7
    return, transpose(str)
end

function pupil_color, surf, wave, h1, h2, p
    common merit_block, merit_struct
    n_wave= n_elements(wave)
    str = strarr(4*n_wave+8)
    for i=0, n_wave-1 do str[i] = reax(surf, wave[i], h1, p, 0, 0) 
    for i=0, n_wave-1 do str[n_wave+i] = reax(surf, wave[i], h2, p, 0, 0) 
    str[2*n_wave] = maxx(merit_struct.lines+1, merit_struct.lines+(2*n_wave), 0, 0)
    str[2*n_wave+1] = minn(merit_struct.lines+1, merit_struct.lines+(2*n_wave), 0, 0)
    for i=0, n_wave-1 do str[2*n_wave+2+i] = reay(surf, wave[i], h1, p, 0, 0) 
    for i=0, n_wave-1 do str[3*n_wave+2+i] = reay(surf, wave[i], h2, p, 0, 0)
    str[4*n_wave+3] = maxx(merit_struct.lines+(2*n_wave+3), merit_struct.lines+(4*n_wave+2), 0, 0)
    str[4*n_wave+4] = minn(merit_struct.lines+(2*n_wave+3), merit_struct.lines+(4*n_wave+2), 0, 0)
    str[4*n_wave+5] = diff(merit_struct.lines+(2*n_wave+1), merit_struct.lines+(2*n_wave+2), 0, 0)
    str[4*n_wave+6] = diff(merit_struct.lines+(4*n_wave+3), merit_struct.lines+(4*n_wave+4), 0, 0)
    str[4*n_wave+7] = qsum(merit_struct.lines+(4*n_wave+5), merit_struct.lines+(4*n_wave+6), 0, 0)
    merit_struct.lines += 4*n_wave + 7                        
    return, transpose(str)
end    

function quadrature, n_rings, n_arms 
    angs   = findgen(n_arms) * 2*!pi/n_arms
    px = fltarr(n_rings,n_arms)
    py = fltarr(n_rings,n_arms)
    weight = fltarr(n_rings,n_arms) + 1./(n_rings*n_arms)
    for i = 0, n_rings-1 do begin
        raggio = sqrt( (double(i)+1) /(n_rings+1) )
        px[i,*] = raggio * cos(angs) 
        py[i,*] = raggio * sin(angs) 
    endfor
    return , {px:reform(px,n_rings*n_arms), py:reform(py, n_rings*n_arms), weight:reform(weight, n_rings*n_arms)}
end

function pupilGrid, n_points
    gridVector= mk_vector(n_points, -1, 1)
    px= fltarr(n_points * n_points)
    py= fltarr(n_points * n_points)
    counter= 0
    for i=0, n_points - 1 do $
      for j=0, n_points - 1 do begin
        px[counter]= gridVector[i] 
        py[counter]= gridVector[j] 
        counter++
      endfor
    distance= [sqrt(px^2. + py^2.)]
    pupilIdx= where(distance LE 1.0)
    weight= fltarr(n_elements(pupilIdx)) + 1. / (n_elements(pupilIdx))
    return, {px: px[pupilIdx], py: py[pupilIdx], weight: weight}  
end

function posizione_centroid, surf, wave, campo, polar=polar, samp=samp, weight, pos=pos
    common merit_block, merit_struct
    if n_elements(pos) eq 0 then pos=[0.,0.]
    if n_elements(polar) eq 0 then polar=0.
    if n_elements(samp) eq 0 then samp=5.
    merit_struct.lines += 2
    str = strarr(2)
    str[0] = cenx(surf, wave, campo, polar, samp, pos[0], weight) 
    str[1] = ceny(surf, wave, campo, polar, samp,pos[1], weight)
    return, transpose(str)
end

function rag, surf, wave, campo, weight, pos=pos
    common merit_block, merit_struct
    if n_elements(pos) eq 0 then pos=[0.,0.]
    str = strarr(2)
    str[0] = ragx(surf, wave, campo, pos, 0, weight) 
    str[1] = ragy(surf, wave, campo, pos, 0, weight)
    return, transpose(str)
end

function tolerance_well, min_value, max_value, weight
    common merit_block, merit_struct
    str = strarr(3)
    str[0] = abso(merit_struct.lines, 0, 0)
    str[1] = opgt(merit_struct.lines+1, min_value, weight)
    str[2] = oplt(merit_struct.lines+1, max_value, weight)
    merit_struct.lines += 3
    return, transpose(str)
end

function setTolerance, target, weight
    common merit_block, merit_struct
    str = strarr(2)
    str[0] = abso(merit_struct.lines, 0, 0)
    str[1] = oplt(merit_struct.lines+1, target, weight)
    merit_struct.lines += 2
    return, transpose(str)
end

function minimize, weight
    common merit_block, merit_struct
    str = opva(merit_struct.lines, 0, weight)
    merit_struct.lines ++
    return, str
end 

function setToZero, weight
    common merit_block, merit_struct
    str = opva(merit_struct.lines, 0, weight)
    merit_struct.lines ++
    return, str
end
 
;function rays_color, surf, wave, ha, pa, max_color, weight
;  common merit_block, merit_struct
;  str = strarr(10)
;  str[0] = reax(surf, wave[0], ha, pa, 0, 0)
;  str[1] = reax(surf, wave[-1], ha, pa, 0, 0)
;  str[2] = diff(merit_struct.lines+1, merit_struct.lines+2, 0, 0)
;  str[3] = abso(merit_struct.lines+3, 0, 0)
;  str[4] = oplt(merit_struct.lines+4, max_color, weight)
;  str[5] = reay(surf, wave[0], ha, pa, 0, 0)
;  str[6] = reay(surf, wave[-1], ha, pa, 0, 0)
;  str[7] = diff(merit_struct.lines+6, merit_struct.lines+7, 0, 0)
;  str[8] = abso(merit_struct.lines+8, 0, 0)
;  str[9] = oplt(merit_struct.lines+9, max_color, weight)
;  merit_struct.lines += 10
;  return, transpose(str)
;end
function rays_color, surf, wave, ha, pa
  common merit_block, merit_struct
  str = strarr(7)
  str[0] = reax(surf, wave[0], ha, pa, 0, 0)
  str[1] = reax(surf, wave[-1], ha, pa, 0, 0)
  str[2] = diff(merit_struct.lines+1, merit_struct.lines+2, 0, 0)
  str[3] = reay(surf, wave[0], ha, pa, 0, 0)
  str[4] = reay(surf, wave[-1], ha, pa, 0, 0)
  str[5] = diff(merit_struct.lines+4, merit_struct.lines+5, 0, 0)
  str[6] = qsum(merit_struct.lines+3, merit_struct.lines+6, 0, 0)
  merit_struct.lines += 7
  return, transpose(str)
end

function reasonable_lens, surfaces, edge_thick, central_thick, CTE, weight
  common merit_block, merit_struct
  n_surf= surfaces[1]-surfaces[0]
  str= strarr(4*2*n_surf+1 + n_surf+1)
  str[0]= reasonable_glass(surfaces[0], surfaces[1]-1, 1000*weight)
  for i=0, n_surf-1 do begin
    str[1+3*2*i: 1+3*2*(i+1)-4]= reform(total_thickness(surfaces[0] + i, surfaces[0] + i + 1, central_thick[0], central_thick[1], weight), 3)
    str[1+3*2*(i+1)-3: 1+3*2*(i+1)-1]= reform(edge_thickness(surfaces[0] + i, edge_thick[0], edge_thick[1], weight), 3)
  endfor
  str[-1*(n_surf+1):-1]= glasses_CTE(surfaces, CTE, weight)
  return, str
end

function global_coords, surf, xyz_pos, weight
   common merit_block, merit_struct
   str= strarr(3)
   str[0] = glcx(surf, xyz_pos[0], weight)
   str[1] = glcy(surf, xyz_pos[1], weight)
   str[2] = glcz(surf, xyz_pos[2], weight)
   merit_struct.lines += 3
   return, transpose(str)
end

function glasses_CTE, surfaces, target, weight
   common merit_block, merit_struct
   n_surf= surfaces[1]-surfaces[0]
   str= strarr(n_surf+1)
   for i=0, n_surf-1 do str[i]= gtce(surfaces[0]+i, 0, 0)
   str[-1]= equa(merit_struct.lines+1, merit_struct.lines+n_surf, target, weight)
   merit_struct.lines+= n_surf+1
   return, transpose (str) 
end   


; This program generates a dummy MF, it can be used as example...
pro dummy_merit_function

    common merit_block, merit_struct

    merit_struct = { $
        lines: 0 $
    }

    filename = 'Dummy.mf'
    openw, fd, filename, /get_lun

    wave = 1
    n_rings = 2
    n_arms  = 6
    qua = quadrature(n_rings, n_arms)
    anello = ring(n_arms)

    obj_surf= 1.
    lens_surf= 2.
    ima_surf = 3.       
    pupil_radius = 3.    ; pupil radius @ lens [mm]
    campo = [1.0, 0.0]


    printf, fd, line_vers('90609')

    printf, fd, line_blank('Object distance between 50 and 100 mm')
    printf, fd, total_thickness(obj_surf, lens_surf, 50., 100., 1.0)
   
    printf, fd, line_blank('Image distance between 0 and 50 mm')
    printf, fd, total_thickness(lens_surf, ima_surf, 0., 50., 1.0)
      
    free_lun, fd
end
