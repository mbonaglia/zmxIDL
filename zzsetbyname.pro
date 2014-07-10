
;+
;PREREQUIS :
;   Library contenant la Dll de communication zemax/idl (Z:\jlisowsk\IDLZEMAX\zemax_lib)

;NOM :
;	zzSetByName
;
;CATEGORIE :
;	Remplissage donnees zemax
;
;SYNTAXE : zzSetByName,surfId,CellId,value
;
;DESCRIPTION :
;   Cette fonction permet de remplir des cellules comme le radius, la conic ... en sequentiel et non sequentiel a partir des
;   commentaire d'une surface. Pour l'utiliser il suffit sous Zemax d'ecrire par exemple le commentaire 'Primaire' dans le champ comment d'une surface.
;   On peut ensuite changer les parametres de cette surface en utilisant zSetSurfaceCell,'Primaire',le parametre a changer(ex 'Conic'...), sa valeur
;
;ARGUMENT :
;   surfId : chaine contenant le commentaire permettant d'identifier la surface
;   CellId : chaine contenant le nom du parametre a changer
;   value : nouvelle valeur a affecter (double ou string par exemple (BK7))
;+



PRO zzSetByName,surfId,CellId,value,debug=debug

if n_elements(debug) eq 0 then debug=0

; Tableau contenant les references d'appel des fonctions DDE de Zemax
;'S' pour sequentiel,'Type de surface','CellId','NumParametre sous fonction DDE, Fonction DDE
tab=[['S','STANDARD','Curvature','2','SurfaceData'], $
     ['S','STANDARD','Thickness','3','SurfaceData'], $
     ['S','STANDARD','Glass','4','SurfaceData'], $
     ['S','STANDARD','Semi-Diameter','5','SurfaceData'], $
     ['S','STANDARD','Conic','6','SurfaceData'], $
     ['S','STANDARD','Coating','7','SurfaceData'], $
     ['S','STANDARD','TCE','8','SurfaceData'], $
     ['S','COORDBRK','Decenter X','1','SurfaceParameter'], $
     ['S','COORDBRK','Decenter Y','2','SurfaceParameter'], $
     ['S','COORDBRK','Tilt About X','3','SurfaceParameter'], $
     ['S','COORDBRK','Tilt About Y','4','SurfaceParameter'], $
     ['S','COORDBRK','Tilt About Z','5','SurfaceParameter'], $
     ['S','NONSEQCO','Exit Loc Y','2','SurfaceParameter'],$
     ['N','NSC_SSUR','X Position','1','NSCPosition'], $
     ['N','NSC_SSUR','Y Position','2','NSCPosition'], $
     ['N','NSC_SSUR','Z Position','3','NSCPosition'], $
     ['N','NSC_SSUR','Tilt About X','4','NSCPosition'], $
     ['N','NSC_SSUR','Tilt About Y','5','NSCPosition'], $
     ['N','NSC_SSUR','Tilt About Z','6','NSCPosition'], $
     ['N','NSC_SSUR','Material','7','NSCPosition'], $
     ['N','NSC_SSUR','Curvature','1','NSCParameter'], $
     ['N','NSC_SSUR','Conic', '2','NSCParameter'],$
     ['N','NSC_SSUR','Max Aper', '3','NSCParameter'],$
     ['N','NSC_NULL','X Position','1','NSCPosition'], $
     ['N','NSC_NULL','Y Position','2','NSCPosition'], $
     ['N','NSC_NULL','Z Position','3','NSCPosition'], $
     ['N','NSC_NULL','Tilt About X','4','NSCPosition'], $
     ['N','NSC_NULL','Tilt About Y','5','NSCPosition'], $
     ['N','NSC_NULL','Tilt About Z','6','NSCPosition'], $
     ['N','NSC_NULL','Material','7','NSCPosition'], $
     ['N','NSC_NULL','Curvature','1','NSCParameter'], $
     ['N','NSC_NULL','Conic', '2','NSCParameter'],$
     ['N','NSC_NULL','Max Aper', '3','NSCParameter'],$
     ['N','NSC_SSU2','X Position','1','NSCPosition'], $
     ['N','NSC_SSU2','Y Position','2','NSCPosition'], $
     ['N','NSC_SSU2','Z Position','3','NSCPosition'], $
     ['N','NSC_SSU2','Tilt About X','4','NSCPosition'], $
     ['N','NSC_SSU2','Tilt About Y','5','NSCPosition'], $
     ['N','NSC_SSU2','Tilt About Z','6','NSCPosition'], $
     ['N','NSC_SSU2','Material','7','NSCPosition'], $
     ['N','NSC_SSU2','Curvature','1','NSCParameter'], $
     ['N','NSC_SSU2','Conic', '2','NSCParameter'],$
     ['N','NSC_SSU2','Max X', '3','NSCParameter'],$
     ['N','NSC_SSU2','Max Y', '4','NSCParameter'],$
     ['N','NSC_SSU2','Decenter X', '7','NSCParameter'],$
     ['N','NSC_SSU2','Decenter Y', '8','NSCParameter'],$
     ['N','NSC_ANNU','Material', '7','NSCPosition']]
; On recupere l'indice des surfaces sequentiel 'S' dans tab
indS=where(tab[0,*] eq 'S',count)
if count LT 1 then message,'No seq parameters'
; On recupere l'indice des surfaces sequentiel 'N' dans tab
indN=where(tab[0,*] eq 'N',count)
if count LT 1 then message,'No NSC parameters'

; Permet de recuperer le nombre de surface d'un fichier zemax
data=zgetsystem()
; On recupere la chaine
res=strsplit(data,',',count=count,/extract)
; on recupere la sous chaine
nbsurf=res[0]
;print,nbsurf

SurfOK=-1
; On parcours les surfaces sequentiel
For isurf=0,nbsurf-1 DO BEGIN
    ;On recupere le commentaire d'une surface sequentiel
	commentS=zGetComment(isurf)
	; On recupere le type de surface
	zGetSurfaceData, isurf, typename=typeS
	if keyword_set(debug) then print,'SURF=',isurf,'TYPE=',typeS,'NOM=',commentS
	; Si le commentaire est celui de tab alors
	if typeS eq 'NONSEQCO' then begin
		; Recupere le nombre de surfaces non sequentiel
  		nbnsc=zGetNSCData(isurf,0)
  		;print,nbnsc
  		; On parcours les surfaces non sequentiel
		for iobj=1,nbnsc do begin
		    ;On recupere le commentaire d'une surface  non sequentiel
		    commentO=zGetNSCObjectData(isurf,iobj,1)
		    ;On recupere le type de surface non sequentiel
		    typeN= zGetNSCObjectData(isurf,iobj,0)
		    if commentO eq surfId then begin
		    	SurfOK=isurf & ObjOK=iobj
		    	lignesSurfN=where(tab[1,indN] eq typeN,count)
		    	if count LT 1 then message,'No internal data for type '+typeN+' => modify IDL code or Id input'
		    	tmpParamN=where(tab[2,indN[lignesSurfN]] eq CellId,count)
		    	if count LT 1 then message,'No internal data for parameter '+CellId+' => modify IDL code'
		    	if count GT 1 then message,'There should be only 1 line'
		    	ligneParamN=indN[lignesSurfN[tmpParamN[0]]]
		    	numParamN=tab[3,ligneParamN] & cmd='Set'+tab[4,ligneParamN]
		    	if debug then print, 'Cest le param ',numParamN ,' et la cmde ',cmd
				goto,fin
			endif
    	endfor
	endif else begin  ;; cas d'une surf sequentielle
		if commentS eq surfId then begin
			SurfOK=isurf
			; On recupere l'indice de la surface dans tab
			lignesSurf=where(tab[1,indS] eq typeS,count)
			if count LT 1 then message,'No internal data for type '+typeS+' => modify IDL code or Id input'
			tmpParam=where(tab[2,indS[lignesSurf]] eq CellId,count)
			if count LT 1 then message,'No internal data for parameter '+CellId+' => modify IDL code'
			if count GT 1 then message,'There should be only 1 line'
			; On recupere l'indice du parametre dans tab
			ligneParam=indS[lignesSurf[tmpParam[0]]]
			; On recupere le num du parametre et on creer la commande zemax a envoyer
			numParam=tab[3,ligneParam] & cmd='Set'+tab[4,ligneParam]
			if debug then print, 'Cest le param ',numParam ,' et la cmde ',cmd
			goto,fin
		endif
	endelse
endfor
fin:

if Surfok eq -1 then message,'Surface not found: '+surfId
if debug then print,isurf,commentS,typeS
	; Formatage de la commande zemax en sequentiel
if typeS ne 'NONSEQCO' then begin
	if size(value,/type) eq 7  then begin mycmd=string(format='(%"%s,%d,%d,%s")',cmd,SurfOK,numParam,value)
   	endif  else begin  mycmd=string(format='(%"%s,%d,%d,%f")',cmd,SurfOK,numParam,value)
   	endelse
endif

   ; Formatage de la commande zemax en non sequentiel
if typeS eq 'NONSEQCO' then begin
   if size(value,/type) eq 7 then begin mycmd=string(format='(%"%s,%d,%d,%d,%s")',cmd,SurfOK,ObjOK,numParamN,value)
   endif  else begin  mycmd=string(format='(%"%s,%d,%d,%d,%f")',cmd,SurfOK,ObjOK,numParamN,value)
   endelse
endif

	;print,mycmd
	; On envoye a zemax la commande
ret=zemax(mycmd)
	;print,ret
end

; Main de test
; On rafraichit le fichier zemax
zGetRefresh
zzSetByName,'Secondaire','Y Position',10
; On transfert les donnees vers zemax
zpushlens
end
