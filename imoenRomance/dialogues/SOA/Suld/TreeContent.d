

APPEND PLAYER1 //// This file was overlooked and the proofreading was never applied.
    IF ~~ THEN BEGIN MRTOL
		SAY @0
	      IF ~IsValidForPartyDialog("Imoen2")  Global("ImoenRomanceActive","GLOBAL",3) ~ THEN GOTO MRToL1
		  IF ~IsValidForPartyDialog("Imoen2") !Global("ImoenRomanceActive","GLOBAL",2) !Global("ImoenRomanceActive","GLOBAL",3) ~ THEN GOTO 34
		  IF ~IsValidForPartyDialog("Imoen2") Global("ImoenRomanceActive","GLOBAL",2)~ THEN GOTO MRToL2
	END
	
	IF ~~ THEN BEGIN MRToL1
	SAY @1
	IF ~~ THEN REPLY @2 DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXTERN IMOEN2J MRToL1Good
	IF ~~ THEN REPLY @3 EXTERN IMOEN2J MRToL1Doubt
	IF ~~ THEN REPLY @4 EXTERN IMOEN2J MRToL1Evil
	END

	IF ~~ THEN BEGIN MRToL2
	SAY @5


	=

	@6
	=

	@7
	=
	@8
	=
	@9
	IF ~~ THEN REPLY @10 EXTERN IMOEN2J MRToL2Love
	IF ~~ THEN REPLY @11 EXTERN IMOEN2J MRToL2Love
	IF ~~ THEN REPLY @12 EXTERN IMOEN2J MRToL2Kiss
	IF ~~ THEN REPLY @13 DO ~ActionOverride(Player1,SetDialog("Player1"))~ EXTERN IMOEN2J MRToL2Scare
	IF ~~ THEN REPLY @14 EXTERN IMOEN2J MRToL2Kiss
	END

	IF ~~ THEN BEGIN MRToL2Scare2
	SAY @15
	=
	@16
	IF ~~ THEN EXTERN IMOEN2J MRToL2Scare3
	END
END


APPEND IMOEN2J
	IF ~~ THEN BEGIN MRToL2Kiss
	SAY @17
	COPY_TRANS IMOEN2J 38
	END

	IF ~~ THEN BEGIN MRToL2Love
	SAY @18
	=
	@19
	=
	@20
	COPY_TRANS IMOEN2J 38
	END

	IF ~~ THEN BEGIN MRToL2Scare
	SAY @21
	IF ~~ THEN REPLY @22 EXTERN IMOEN2J MRToL2Love
	IF ~~ THEN REPLY @23 EXTERN PLAYER1 MRToL2Scare2
	END

	IF ~~ THEN BEGIN MRToL2Scare3

	SAY @24
	=

	@25
	=

	@19
	=
	@20
	COPY_TRANS IMOEN2J 38
	END

	
	IF ~~ THEN BEGIN MRToL1Evil
	SAY @26
	IF ~~ THEN REPLY @27 GOTO MRToL1Evil2
	END

	IF ~~ THEN BEGIN MRToL1Evil2
	SAY @28
	=
	@29
	COPY_TRANS IMOEN2J 38
	END

	IF ~~ THEN BEGIN MRToL1Doubt
	SAY @26
	IF ~~ THEN REPLY @30 GOTO MRToL1Doubt2
	END

	IF ~~ THEN BEGIN MRToL1Doubt2
	SAY @31
	=
	@32
	COPY_TRANS IMOEN2J 38
	END

	IF ~~ THEN BEGIN MRToL1Good
	SAY @26
	IF ~~ THEN REPLY @33 GOTO MRToL1Good1
	IF ~~ THEN REPLY @34 GOTO MRToL1Good2
	END

	IF ~~ THEN BEGIN MRToL1Good1
	SAY @35
	=
	@36
        = @37
	COPY_TRANS IMOEN2J 38
	END

	IF ~~ THEN BEGIN MRToL1Good2
	SAY @38
	=
	@36
        = @39
	COPY_TRANS IMOEN2J 38
	END
END
