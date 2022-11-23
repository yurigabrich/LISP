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
(setq file_name (getvar "dwgname"))			; "GRE.EEC.H.21.ES.P.12787.16.kkk.xx.dwg"

; Create a list with each part of the file name.
(setq list_names (vle-string-split "." file_name))	; ("GRE","EEC","H","21","ES","P","12787","16","kkk","xx","dwg")

; Identify each part of the file with a variable.
(setq caj_group (nth 0 list_names))			; "GRE"
(setq caj_function (nth 1 list_names))			; "EEC"
(setq caj_type (nth 2 list_names))			; "H"
(setq caj_issuer (nth 3 list_names))			; "21"
(setq caj_country (nth 4 list_names))			; "ES"
(setq caj_tec (nth 5 list_names))			; "P"
(setq caj_plant (nth 6 list_names))			; "12787"
(setq caj_system (nth 7 list_names))			; "16"
(setq caj_progressive (nth 8 list_names))		; "kkk"
(setq caj_revision (nth 9 list_names))			; "xx"

; Update those variables that needs to be displayed differently.
(setq caj_issuer (spaced_str caj_issuer))		; "2 1"
(setq caj_country (spaced_str caj_country))		; "E S"
(setq caj_plant (spaced_str caj_plant))			; "1 2 7 8 7"
(setq caj_system (spaced_str caj_system))		; "1 6"
(setq caj_progressive (spaced_str caj_progressive))	; "k k k"
(setq caj_revision (spaced_str caj_revision))		; "x x"

