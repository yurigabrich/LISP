; ==========================================
; SPDX-License-Identifier: MIT License
; 
; Copyright (C) 2022, Yuri Bastos Gabrich.
;                     yurigabrich.github.io
; ==========================================

; ===========
;  FUNCTIONS
; ===========

(defun spaced_str ( input_str)
	; ---------------------------------------
	; A function to separate characters of a
	; string by blank spaces.
	; ---------------------------------------

	(setq var_len (strlen input_str))
	(setq temp "")
	(setq spacer " ")
	(setq var_pos 1)
	
	(while (> var_len 1)
		(setq temp (strcat temp (substr input_str var_pos 1)))
		(setq temp (strcat temp spacer))
		
		(setq var_pos (+ 1 var_pos))
		(setq var_len (- var_len 1))
	)
	
	(setq input_str (strcat temp (substr input_str var_pos 1)))
)

; =============
;  EXPRESSIONS
; =============

; Get the name of the file.
(setq file_name (getvar "dwgname"))			; "AAA.BBB.C.DD.EE.F.GGGGG.HH.III.JJ.dwg"

; Create a list with each part of the file name.
(setq list_names (vle-string-split "." file_name))	; ("AAA","BBB","C","DD","EE","F","GGGGG","HH","III","JJ","dwg")

; Identify each part of the file with a variable.
(setq caj_group (nth 0 list_names))			; "AAA"
(setq caj_function (nth 1 list_names))			; "BBB"
(setq caj_type (nth 2 list_names))			; "C"
(setq caj_issuer (nth 3 list_names))			; "DD"
(setq caj_country (nth 4 list_names))			; "EE"
(setq caj_tec (nth 5 list_names))			; "F"
(setq caj_plant (nth 6 list_names))			; "GGGGG"
(setq caj_system (nth 7 list_names))			; "HH"
(setq caj_progressive (nth 8 list_names))		; "III"
(setq caj_revision (nth 9 list_names))			; "JJ"

; Update those variables that needs to be displayed differently.
(setq caj_issuer (spaced_str caj_issuer))		; "D D"
(setq caj_country (spaced_str caj_country))		; "E E"
(setq caj_plant (spaced_str caj_plant))			; "G G G G G"
(setq caj_system (spaced_str caj_system))		; "H H"
(setq caj_progressive (spaced_str caj_progressive))	; "I I I"
(setq caj_revision (spaced_str caj_revision))		; "J J"

