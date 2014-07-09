;
; zcoeff in lens unit (mm) starting from tip/tilt, i.e. zcoeff[0]=tip, .... 
; 
pro zSetZernike, surf, norm_radius, zcoeff
  if n_elements(zcoeff) eq 1 then begin
      zSetExtra, surf, 1, 0
      ;ret = zemax(string(format='(%"SetExtra,%d,1,0")',surf))
  endif else begin
      zsetExtra, surf, 1, n_elements(zcoeff)
      zsetExtra, surf, 2, norm_radius
      for i=0, n_elements(zcoeff)-1 do zSetExtra, surf, i+3, zcoeff[i]
      ;ret = zemax(string(format='(%"SetExtra,%d,1,%d")',surf,n_elements(zcoeff)+1))
      ;for i=0,n_elements(zcoeff)-1 do ret= zemax(string(format='(%"SetExtra,%d,%d,%f")',surf, i+4, zcoeff[i]))
  endelse
end
