pro zGetRefresh,status=status,nostop=nostop
on_error,0
; /nostop : to avoid automatic stop if error
; status: if nostop is set, contains the error code (0=OK, -1=error)
  cmd='GetRefresh'
  status = zemax(cmd)
  if status eq '' then status = '0' ;; there seems to be a bug in getrefresh doc?
  if (status eq "-1") and ~keyword_set(nostop) then message,'Error loading new config'
end

;; main of test
zgetrefresh
end
