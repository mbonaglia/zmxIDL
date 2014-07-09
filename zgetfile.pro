
;+
; GetFile
; This item extracts the full name of the lens, including the drive and path.
; Extreme caution should be used if the file is to be tampered with; 
; since at any time ZEMAX may read or write from/to this file.
;-

function zGetFile
    file = zemax('GetFile')
    return, file
end
