pro write_bim, frame, file
    openw , lun, file, /get_lun
    nx = long(n_elements(frame[*,0]))
    ny = long(n_elements(frame[0,*]))
    data = double(frame)
    writeu, lun, nx, ny
    writeu, lun, data
    free_lun, lun
end
