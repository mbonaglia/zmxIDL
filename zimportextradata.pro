pro zImportExtraData, surf, filename, timeout=timeout, ret=ret
  cmd = string(format='(%"ImportExtraData,%d,%s")',surf, filename)
  ret = zemax(cmd, time=timeout)
  if ret ne 0 then message, string(format='(%"Could not import extra data %s on surf %d")',filename, surf), BLOCK='Zemax', NAME='M_ZMX_ZMX' 
end 