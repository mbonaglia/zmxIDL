
;From ZEMAX manual Grid Sag surface type
;
;nx ny delx dely unitflag xdec ydec
;z dz/dx dz/dy d2z/dxdy nodata
;...
;The first line in the file contains seven values, which define the (integer) number of points in the x and y
;directions, the (floating point) increment in the x and y directions, an (integer) flag indicating the units of the data:
;0 for mm, 1 for cm, 2 for in, and 3 for meters, and the (floating point) decenter of the grid points relative to the
;base surface in x and y. Any required scaling to the current lens units will be performed. Note that sag and cross
;derivative values have dimensions, and are therefore scaled, but first derivative values are dimensionless, and
;are not scaled.
;The remaining nx*ny lines of the file contain four (floating point) numbers and (optionally) one integer each.
;The four floating point values are the sag, the x derivative of the sag, the y derivative of the sag, and the cross
;derivative d/dxdy. The optional fifth data entry is an integer flag that indicates if the data is invalid. Valid measured
;data should either have a zero or blank space for the nodata flag. Points for which the data is not valid should
;have a nodata value of unity. Currently, ZEMAX reads in the nodata flag value but does not use it; therefore, the
;sag data and derivatives should be set to zero or some other suitable value for points with no valid data.
;The first data line in the file corresponds to the upper left corner of the surface, that is, the corner defined by
;-x and +y limits. Each point that follows is read across the face of the surface from left to right. After nx points,
;the nx+1 point is read in as the first value in row 2, and so on until nx*ny points have been read in. The file must
;be in ASCII and end in the extension .DAT.
;The derivative values are required for smooth bicubic interpolation of the sag between the data points. The
;derivative values are not used by the linear interpolation algorithm. If all of the derivative values (dz/dx, dz/dy, and
;d2z/dxdy) are zero for every point in the file, then ZEMAX will automatically estimate the derivatives using a finite
;difference method.

; frame [nx,ny] can be thickness [mm] to use with GridSag surfaces or phase [rad] to use with GridPhase surfaces
; pxscale [mm/px]
pro zCreateGridSurface, frame, pxscale, basename
  openw, unit, basename+'.DAT', /get_lun
  
  ; test frame is 2D
  
  nx = (size(frame))[1]
  ny = (size(frame))[2]
  delx = pxscale
  dely = pxscale
  unitflag = 0
  if n_elements(xdec) eq 0 then xdec = 0
  if n_elements(ydec) eq 0 then ydec = 0
  
  printf, unit, string(format='(%"%d %d %g %g %d %g %g\n")', nx,ny,delx,dely,unitflag,xdec,ydec)
  for iy=0,ny-1 do begin
    for ix=0,nx-1 do begin
      z = frame[ix,iy]
      dx=0
      dy=0
      dxdy=0
      invalid = 0
      printf, unit, string(format='(%"%g %g %g %g %d\n")', z, dx, dy, dxdy, invalid )
    endfor
  endfor
  
  free_lun, unit 
  
end
