// If Imoen's soul hasn't been retrieved and you are not at the Elven Glade already

CHAIN IMOEN2J MRLetsCampN
	@0
	== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @1
	== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @2
	== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @3
	== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @4
	== IMOEN2J IF ~IsValidForPartyDialog("Korgan")~ THEN @5
END 
  IF ~!Global("BodhiDead","GLOBAL",1)~ EXTERN IMOEN2J MRLetsCampQ
   IF ~Global("BodhiDead","GLOBAL",1)~EXTERN IMOEN2J MRLetsCampQ2
  
APPEND IMOEN2J
	IF  ~Global("MRCampPrompt","GLOBAL",1) !Global("BodhiDead","GLOBAL",1)~ THEN MRLetsCamp
		SAY @6
		IF ~~ THEN DO ~SetGlobal("MRCampPrompt","GLOBAL",2)~ GOTO MRLetsCampN
	END
END


APPEND IMOEN2J
	IF ~~ THEN MRLetsCampQ
		SAY @7
		++ @8 + MRLetsCampYes
		++ @9 + MRLetsCampMaybe 
		++ @10 + MRLetsCampAfter
		++ @11 + MRLetsCampAfter2
		++ @12 + MRLetsCampNo
	END	
		
	IF ~~ THEN MRLetsCampYes
		SAY @13
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~  EXIT
	END

	IF ~~ THEN MRLetsCampMaybe
		SAY @14
		= @15
		= @16
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~   EXIT
	END

	IF ~~ THEN MRLetsCampAfter
		SAY @17
		= @18
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~  EXIT
	END

	IF ~~ THEN MRLetsCampAfter2
		SAY @19
		= @20
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~   EXIT
	END

	IF ~~ THEN MRLetsCampNo
		SAY @21
		= @22
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~  EXIT
	END
END


APPEND IMOEN2J
	IF  ~Global("MRCampPrompt","GLOBAL",1) Global("BodhiDead","GLOBAL",1)~   THEN MRLetsCamp2
		SAY @23
			IF ~~ THEN DO ~SetGlobal("MRCampPrompt","GLOBAL",2)~ GOTO MRLetsCampN
	END
END


APPEND IMOEN2J
	IF ~~ THEN MRLetsCampQ2
		SAY @7
		++ @8 + MRLetsCampYes
		++ @24 + MRLetsCampMaybe
		++ @25 + MRLetsCampAss2
		++ @11 + MRLetsCamp2After2
		++ @12 + MRLetsCampNo
	END	
		

	IF ~~ THEN MRLetsCampAss2
		SAY @26
		= @27
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~  EXIT
	END

	IF ~~ THEN MRLetsCamp2After2
		SAY @28
		= @29
		IF ~~ THEN DO ~SetGlobal("MRCampfire","GLOBAL",1)~  EXIT
	END
END