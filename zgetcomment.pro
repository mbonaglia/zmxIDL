function zgetcomment,surf

cmd = string(format='(%"GetComment,%d")',surf)
return,  zemax(cmd, time=timeout)

end
