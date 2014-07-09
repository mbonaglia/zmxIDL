
;+
; This item requires that the client provide additional data. In order to trace a ray, ZEMAX needs to know the
; relative field and pupil coordinates, the wavelength, the mode (either real, mode = 0 or paraxial, mode = 1) as
; well  as  the  surface  to  trace  the  ray  to. All  of  this  data  is  encoded  and  appended  to  the  item  name. This  is
; accomplished by delimiting the various parameters with commas as follows:
; GetTrace, wave, mode, surf, hx, hy, px, py
; For example, to trace the real chief ray to surface 5 at wavelength 3, the item string would be
; GetTrace,3,0,5,0.0,1.0,0.0,0.0
; Note 0 is reserved for the object surface.
; The data message comes back in the following format:
; "error, vigcode, x, y, z, l, m, n, l2, m2, n2, intensity"
; The integer error will be zero if the ray traced successfully, otherwise it will be a positive or negative number.
; If positive,  then  the  ray missed  the surface number  indicated by error.  If negative,  then  the  ray  total  internal
; reflected (TIR) at the surface given by the absolute value of the error number. Always check to verify the ray data
; is valid before using the rest of the string!
; The parameter vigcode is the first surface where the ray was vignetted. Unless an error occurs at that surface
; or subsequent to that surface, the ray will continue to trace to the requested surface.
; The x, y, and z values are the coordinates on the requested surface.
; The l, m, and n values are the direction cosines after refraction into the media following the requested surface.
; The l2, m2, and n2 values are the surface intercept direction normals at the requested surface.
; The intensity is the relative transmitted intensity of the ray, including any pupil or surface apodization defined.
; Although GetTrace is easy to program and use, there is a significant disadvantage to using GetTrace: only
; one ray per DDE call is traced. The overhead of passing data via DDE can be quite large compared to tracing the
; ray,  and  so  if  a  large  number  of  rays  are  required  to  be  traced,  the  execution may  be  relatively  slow.  For
; information on tracing large numbers of rays, see the discussion "Tracing large numbers of rays" elsewhere in
; this chapter. See also GetTraceDirect.
;-
function zGetTrace, wave, mode, surf, hx, hy, px, py, timeout=timeout

    cmd = string(format='(%"GetTrace,%d,%d,%d,%f,%f,%f,%f")',wave, mode, surf, hx, hy, px, py)
    ret = zemax(cmd, time=timeout) 
    aaa = strsplit(ret, ',', /extr)
    error   = fix(aaa[0])
    vigcode = fix(aaa[1])
    x       = double(aaa[2])
    y       = double(aaa[3])
    z       = double(aaa[4])
    l       = double(aaa[5])
    m       = double(aaa[6])
    n       = double(aaa[7])
    l2      = double(aaa[8])
    m2      = double(aaa[9])
    n2      = double(aaa[10])
    intensity = double(aaa[11])
    
    out = { error:error, vigcode:vigcode, x:x, y:y, z:z, l:l, m:m, n:n, l2:l2, m2:m2, n2:n2, intensity:intensity }
    return, out   

end

