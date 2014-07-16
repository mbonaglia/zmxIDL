pro install
  
  if !version.os_family ne 'Windows' then begin
    message, 'unsupported O.S. - zmxIDL runs only on Windows OS'
  endif
  
  if !version.memory_bits ne 32 and !version.memory_bits ne 64 then begin
    message, 'unable to determine 32bit or 64bit architecture - weird!'
  endif
  
  cd, curr=currdir
  destFile= filepath(root=currdir, sub=['zemaxdlm'], 'zemaxmodule.dll')
  if !version.memory_bits eq 32 then $
    dllFileName= filepath(root=currdir, sub=['zemaxdlm'], 'zemaxmodule32bitWinXP.dll')
  if !version.memory_bits eq 64 then $
    dllFileName= filepath(root=currdir, sub=['zemaxdlm'], 'zemaxmodule64bitWin7.dll')   
  if file_test(dllFileName) ne 1 then begin
    message, 'missing file '+dllFileName+' - Installation aborted '
  endif
  file_copy, dllFileName, destFile, /overwrite
  
  dlmPath = filepath(ROOT=currdir, 'zemaxdlm')
  print, 'adding '+dlmPath+' to IDL_DLM_PATH'
  PREF_SET, 'IDL_DLM_PATH', dlmPath + PATH_SEP(/SEARCH_PATH) + '<IDL_DEFAULT>', /commit
  proPath = filepath(ROOT=currdir, '')
  print, 'adding '+proPath+' to IDL_PATH'
  PREF_SET, 'IDL_PATH', proPath + PATH_SEP(/SEARCH_PATH) + '<IDL_DEFAULT>', /commit
  
  print, 'Installation completed. Exit IDL and restart. Run test_install to check configuration'
end