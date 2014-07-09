pro zSetDLMpath
    print, 'Setting the zemax dlm path...'

    ;SETENV, 'ADOPTHOME=C:\Documents and Settings\lbusoni\Documenti\adopt' 
  
    subdirs = [ 'idl', 'usr_lib', 'oaa_lib', 'zemax_lib', 'zemaxdlm' ]
    zemaxmodule_dir = filepath(ROOT=GETENV('ADOPTHOME'), SUB=subdirs, '')
    
    ; UNIX PREF_SET, 'IDL_DLM_PATH', expand_path('+'+zemaxmodule_dir, /dlm)+':<IDL_DEFAULT>', /COMMIT    
    case !VERSION.OS_FAMILY of
        "Windows": begin
            PREF_SET, 'IDL_DLM_PATH', '+'+expand_path('+'+zemaxmodule_dir, /dlm)+';<IDL_DEFAULT>' 
            PREF_COMMIT 
        end
    else: message, "the zemax dlm for the operative system of the family "+!VERSION.OS_FAMILY $ 
                   +" is not supported."
    endcase
    print, "DLM set (hopefully). Restart IDL and type HELP,/DLM, 'zemaxmodule' to see if the DLM is correctly in the path"
end
