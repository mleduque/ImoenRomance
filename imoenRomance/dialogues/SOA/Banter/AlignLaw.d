APPEND BIMOEN2
	IF ~Global("MRAlignLaw","LOCALS",0)
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		GlobalGT("Chapter","GLOBAL",%bg2_chapter_3%)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()~ THEN BEGIN MRLawChaAlignTalk
		SAY @0
		IF ~OR(3)
			Alignment(Player1,LAWFUL_GOOD)
			Alignment(Player1,LAWFUL_NEUTRAL)
			Alignment(Player1,LAWFUL_EVIL)~
		DO ~SetGlobal("MRAlignLaw","LOCALS",1)~ GOTO MRLawChaLaw
		IF ~OR(3)
			Alignment(Player1,NEUTRAL_GOOD)
			Alignment(Player1,NEUTRAL)
			Alignment(Player1,NEUTRAL_EVIL)~
		DO ~SetGlobal("MRAlignLaw","LOCALS",1)~ GOTO MRLawChaNeu
		IF ~OR(3)
			Alignment(Player1,CHAOTIC_GOOD)
			Alignment(Player1,CHAOTIC_NEUTRAL)
			Alignment(Player1,CHAOTIC_EVIL)~
		DO ~SetGlobal("MRAlignLaw","LOCALS",1)~ GOTO MRLawChaCha
	END

	IF ~~ THEN BEGIN MRLawChaLaw
		SAY @1
		IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @2 GOTO MRLawChaLawGood
		IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @3 GOTO MRLawChaLawNeu
		IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @4 GOTO MRLawChaLawEvil
		++ @5 GOTO MRLawChaLawDumb
	END
END

CHAIN BIMOEN2 MRLawChaNeu
@6
==BIMOEN2 IF ~IsValidForPartyDialog("Keldorn")~ THEN @7
==BIMOEN2 IF ~!IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Korgan")~ THEN @8
==BIMOEN2 IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Nalia")~ THEN @9
==BIMOEN2 IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Nalia")~ THEN @10
END BIMOEN2 MRLawChaNeuNext

APPEND BIMOEN2
IF ~~ THEN BEGIN MRLawChaNeuNext
 SAY @11
	IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @2 GOTO MRLawChaLawGood
	IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @3 GOTO MRLawChaLawNeu
	IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @4 GOTO MRLawChaLawEvil
	++ @5 GOTO MRLawChaLawDumb
	IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @12 GOTO MRLawChaChaGood
	IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @13 GOTO MRLawChaChaNeu
	IF ~ CheckStatGT(Player1,10,WIS)~ THEN REPLY @14 GOTO MRLawChaChaNeu2
	IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @15 GOTO MRLawChaChaEvil1
	IF ~ Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @15 GOTO MRLawChaChaEvil2
	IF ~~ THEN REPLY @16 GOTO MRLawChaChaDumb
END

IF ~~ THEN BEGIN MRLawChaCha
		SAY @17
		IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @12 GOTO MRLawChaChaGood
		IF ~CheckStatGT(Player1,10,WIS)~ THEN REPLY @13 GOTO MRLawChaChaNeu
		IF ~ CheckStatGT(Player1,10,WIS)~ THEN REPLY @14 GOTO MRLawChaChaNeu2
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @15 GOTO MRLawChaChaEvil1
		IF ~ Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @15 GOTO MRLawChaChaEvil2
		++ @18 GOTO MRLawChaChaDumb
	END

	IF ~~ THEN BEGIN MRLawChaLawGood
		SAY @19
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaLawNeu
		SAY @20
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaLawEvil
		SAY @21
	IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaLawDumb
		SAY @22 
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaChaGood
		SAY @23
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaChaNeu
		SAY @24
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaChaEvil1
		SAY @25
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaChaEvil2
		SAY @26
		IF ~~ THEN GOTO MRLawChaLaw2
	END


	IF ~~ THEN BEGIN MRLawChaChaGood2
		SAY @27
		=
		@28 
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaChaNeu2
		SAY @29
		=
		@30
		=
		@31
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaChaEvil
		SAY @32
		=
		@33
		=
		@30
		=
		@31
		IF ~~ THEN GOTO MRLawChaLaw2
	END

	IF ~~ THEN BEGIN MRLawChaChaDumb
		SAY @34
		IF ~~ THEN GOTO MRLawChaLaw2
	END


	IF ~~ THEN BEGIN MRLawChaLaw2
		SAY @35
		=
		@36
		++ @37 + MRLawChaLawStuffy
		++ @38 + MRLawChaLawPlay
		IF ~OR(3)
			!Alignment(Player1,CHAOTIC_GOOD)
			!Alignment(Player1,CHAOTIC_NEUTRAL)
			!Alignment(Player1,CHAOTIC_EVIL)
			~ THEN REPLY @39 GOTO MRLawChaLawStuffy
		IF ~Gender(Player1,MALE) Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @40 GOTO MRLawChaLawOtherRom
		IF ~Gender(Player1,MALE) !Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @40 GOTO MRLawChaLawOtherNonRom
		IF ~Gender(Player1,FEMALE) !Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @41 GOTO MRLawChaLawOtherNonRom
		IF ~Gender(Player1,FEMALE) Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @41 GOTO MRLawChaLawOtherRom
		IF ~OR(3)
			!Alignment(Player1,LAWFUL_GOOD)
			!Alignment(Player1,LAWFUL_NEUTRAL)
			!Alignment(Player1,LAWFUL_EVIL)
		~ THEN REPLY @42 GOTO MRLawChaChaPlay
	END
	
	IF ~~ THEN BEGIN MRLawChaLawOtherRom
		SAY @43
		IF ~~ THEN GOTO MRLawChaLawEnd
	END

	IF ~~ THEN BEGIN MRLawChaLawOtherNonRom
		SAY @44
		IF ~~ THEN GOTO MRLawChaLawEnd
	END
END

CHAIN BIMOEN2 MRLawChaLawStuffy
@45
==BIMOEN2 IF ~Gender(Player1,MALE)~ THEN @46
=@47
==BIMOEN2 IF ~Gender(Player1,FEMALE)~ THEN @48
EXIT


APPEND BIMOEN2
	IF ~~ THEN BEGIN MRLawChaLawPlay
		SAY @49
		IF ~~ THEN GOTO MRLawChaLawEnd
	END

	IF ~~ THEN BEGIN MRLawChaChaPlay
		SAY @50
		=
		@51
		IF ~~ THEN GOTO MRLawChaLawEnd
	END

	IF ~~ THEN BEGIN MRLawChaLawEnd
		SAY @52
		=
		@53
		IF ~~ THEN EXIT
	END
END
