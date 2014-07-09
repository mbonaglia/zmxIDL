

;+
;
;-
pro build_zemaxmodule, VERBOSE=verbose
  
  ; Locate the zemaxmodule files
  thisfile = routine_info("build_zemaxmodule", /source)
  zemaxmodule_dir = file_dirname(thisfile.path)
  
  ; Build the testmodule DLM in the !MAKE_DLL.COMPILE_DIRECTORY directory.
  MAKE_DLL, ['zemaxmodule'],'zemaxmodule','IDL_Load', INPUT_DIR=zemaxmodule_dir, $
    VERBOSE=verbose, SHOW_ALL_OUTPUT=verbose, EXTRA_LFLAGS='kernel32.lib user32.lib', $  ;, CC='cl'  ;, 
    COMPILE_DIR=zemaxmodule_dir 

  print, 'If you believe it was successfully compiled, then add '+zemaxmodule_dir +' to the IDL_DLM_PATH and restart IDL'
 
end
