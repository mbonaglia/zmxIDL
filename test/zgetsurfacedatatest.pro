
function zemax, cmd, time=timeout
  if strmatch(cmd, 'GetSurfaceData,*,1') eq 1 then begin
    return, 'commento'
  endif
end

function zGetSurfaceDataTestClass::test_one
  compile_opt strictarr
  assert, 3.5 eq 3.5, 'why 3.5 != 3.5?'
  return, 1
end

function zGetSurfaceDataTestClass::test_getcomment
  surfID=0
  zGetSurfaceData, surfID, comment=comment
  assert, comment eq 'commento'
  return, 1
end

pro zGetSurfaceDataTestClass__define
  compile_opt strictarr
  define= {zGetSurfaceDataTestClass, $
    inherits MGutTestCase}
end

pro zGetSurfaceDataTest
  mgunit, 'zGetSurfaceDataTestClass'
end