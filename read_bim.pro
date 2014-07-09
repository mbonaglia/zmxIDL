

Function Read_BIM,Filename

Xpix=long(0)
Ypix=long(0)

;***get header

OpenR,1,Filename

readU,1,Xpix,Ypix

Close,1

print,'x,y pixsize',Xpix,Ypix


array=DBLarr(Xpix,Ypix)
Rarray=DBLarr(Xpix*Ypix)

;**Read the array

OpenR,1,Filename

readU,1,Xpix,Ypix
ReadU,1,Rarray

Close,1

help,Rarray

;***Resort in 2D array

M=0.
for k=0.,XPix-1 do begin
for L=0.,YPix-1 do begin

array[L,K]=Rarray[M]

M=M+1

EndFor
ENDfor


Return,Array



END