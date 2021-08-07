/* Reputation High/Low Dialogs - COMPLETED */

APPEND BIMOEN2
	IF ~ReputationGT(Player1,14) 
		Global("MRRepTalk","LOCALS",0)
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()
		GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%) 
		AreaType(CITY)~ THEN BEGIN MRRepHigh
		SAY @0
		IF ~~ THEN REPLY @1 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHigh1
		IF ~~ THEN REPLY @2 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHighEnd
		IF ~IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Keldorn")~ THEN REPLY @3 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHighNPCGood
		IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Viconia")~ THEN REPLY @3DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepHighNPCEvil
		IF ~OR(2) !IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Keldorn") OR(2) !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Viconia")~ THEN REPLY @3 
			DO ~SetGlobal("MRRepTalk","LOCALS",1)~ EXIT
	END

	IF ~~ THEN BEGIN MRRepHighEnd
		SAY @4
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepHigh1
		SAY @5
		++ @6 GOTO MRRepHighJealous1
		IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @7 GOTO MRRepHighEvil
		IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @7 EXTERN BNALIA MRRepHighEvil
		IF ~!IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Aerie")~ THEN REPLY @7 EXTERN BAERIE MRRepHighEvil
		IF ~IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Aerie")~ THEN REPLY @7 EXTERN BAERIE MRRepHighEvil
		++ @8 GOTO MRRepHighGreedy
		++ @9 GOTO MRRepHighGood
	END

END

CHAIN BIMOEN2 MRRepHighJealous1
 @10 
==BIMOEN2 IF ~CheckStatLT(Player1,8,CHR)~ THEN @11
	= @12
==BIMOEN2 IF ~CheckStatGT(Player1,13,CHR) Global("ImoenRomanceActive","GLOBAL",2)~THEN @13
==BIMOEN2 IF ~CheckStatGT(Player1,13,CHR) !Global("ImoenRomanceActive","GLOBAL",2) ~ THEN @14
	= @15
==BIMOEN2 IF ~CheckStatGT(Player1,7,CHR) CheckStatLT(Player1,14,CHR)~ THEN @16
END
	IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @7 GOTO MRRepHighEvil
	IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @17 EXTERN BNALIA MRRepHighEvil
	IF ~IsValidForPartyDialog("Aerie")~ THEN REPLY @17 EXTERN BAERIE MRRepHighEvil
	IF ~Gender(Player1,FEMALE)~ THEN REPLY @18 GOTO MRRepHighGood
	IF ~Gender(Player1,MALE)~ THEN REPLY @19 GOTO MRRepHighGood

APPEND BNALIA
	IF ~~ THEN BEGIN MRRepHighEvil
		SAY @20 
	IF ~~ THEN EXTERN BIMOEN2 MRRepHighEvil2
	END
END

APPEND BAERIE
	IF ~~ THEN BEGIN MRRepHighEvil
		SAY @21
	IF ~~ THEN EXTERN BIMOEN2 MRRepHighEvil2
	END
END


APPEND BIMOEN2
	IF ~~ THEN BEGIN MRRepHighGreedy
		SAY @22
		IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @23 GOTO MRRepHighEvil
		IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN REPLY @23 EXTERN BNALIA MRRepHighEvil
		IF ~IsValidForPartyDialog("Aerie")~ THEN REPLY @23 EXTERN BAERIE MRRepHighEvil
		++ @24 GOTO MRRepHighGood
	END 

	IF ~~ THEN BEGIN MRRepHighGood
		SAY @25
		++ @26 GOTO MRRepHighGoodLittle
		++ @27 GOTO MRRepHighGoodBad
	END

	IF ~~ THEN BEGIN MRRepHighGoodLittle
		SAY @28
	=
	@29
	++ @30 GOTO MRRepHighGoodEnd1
	++ @31 GOTO MRRepHighGoodEndVolo
	++ @32 GOTO MRRepHighGoodEnd1
	END

	IF ~~ THEN BEGIN MRRepHighGoodEnd1
		SAY @33
		=
		@34
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepHighGoodEndVolo
		SAY @35
		=
		@36
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepHighGoodBad
		SAY @37
		=
		@38
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRRepHighEvil
		SAY @39
		=
		@40
		IF ~~ THEN EXIT
	END
END

CHAIN BIMOEN2 MRRepHighNPCGood
@41
== BKELDOR
@42
== BIMOEN2
@43
== BKELDOR
@44
==BIMOEN2
@45
==BKELDOR
@46
==BNALIA
@47
==BKELDOR
@48
==BNALIA
@49
==BIMOEN2
@50
==BNALIA
@51
==BKELDOR
@52
==BIMOEN2
@53
==BNALIA
@54
==BIMOEN2
@55
==BKELDOR
@56
EXIT

CHAIN BIMOEN2 MRRepHighNPCEvil
@57
== BKORGAN
@58
==BVICONI
@59
==BKORGAN
@60
==BIMOEN2
@61
==VICONI
@62
==BKORGAN
@63
==BIMOEN2
@64
EXIT

CHAIN BIMOEN2 MRRepHighEvil2
@65
==BIMOEN2 IF ~IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Nalia")~ THEN @66
= @67
==BIMOEN2 IF ~!IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Nalia")~ THEN @68
= @67
==BIMOEN2 IF ~IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Nalia")~ THEN @69
= @67
EXIT

APPEND BIMOEN2
	IF ~ReputationLT(Player1,6) 
	    Global("MRRepTalk","LOCALS",0)
		!StateCheck(Player1,CD_STATE_NOTVALID)
		!StateCheck(Myself,CD_STATE_NOTVALID)
		InParty("Imoen2")
		See(Player1)
		!ActuallyInCombat()
		GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%) 
		AreaType(CITY)
		~ THEN BEGIN MRRepLow
		SAY @70
		++ @71 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepLow1
		IF ~!NumInPartyGT(2)~ THEN REPLY @72 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepLowEnd1
		IF ~NumInPartyGT(2)~ THEN REPLY @72 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ GOTO MRRepLowEnd2
		IF ~~ THEN REPLY @3 DO ~SetGlobal("MRRepTalk","LOCALS",1)~ EXIT
	END

	IF ~~ THEN BEGIN MRRepLowEnd1
		SAY @73
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowEnd2
		SAY @74
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLow1
		SAY @75
		=
		@76
		=
		@77
		++ @78 GOTO MRRepLowGood
		++ @79 GOTO MRRepLowNeu
		++ @80 GOTO MRRepLowNeu
		++ @81 GOTO MRRepLowBhaal
	END

	IF ~~ THEN BEGIN MRRepLowGood
		SAY @82
		++ @83 GOTO MRRepLowWicca
		IF ~!NumInPartyGT(2)
			 OR(7)
			Class(Player1,MAGE)
			Class(Player1,SORCERER)
			Class(Player1,CLERIC_MAGE)
			Class(Player1,FIGHTER_MAGE_CLERIC)
			Class(Player1,FIGHTER_MAGE)
			Class(Player1,FIGHTER_MAGE_THIEF)
			Class(Player1,MAGE_THIEF)~ THEN REPLY @84 GOTO MRRepLowMagicDual
		IF ~!NumInPartyGT(2)
			!Class(Player1,MAGE)
			!Class(Player1,SORCERER)
			!Class(Player1,CLERIC_MAGE)
			!Class(Player1,FIGHTER_MAGE_CLERIC)
			!Class(Player1,FIGHTER_MAGE)
			!Class(Player1,FIGHTER_MAGE_THIEF)
			!Class(Player1,MAGE_THIEF)~
			THEN REPLY @84 GOTO MRRepLowMagicSolo
		IF ~NumInPartyGT(2)
			OR(7)
			IsValidForPartyDialog("Nalia")
			IsValidForPartyDialog("Aerie")
			IsValidForPartyDialog("")
			IsValidForPartyDialog("Edwin")
			IsValidForPartyDialog("Jan")
			IsValidForPartyDialog("Cernd")
			IsValidForPartyDialog("Viconia")
			~ THEN REPLY @84 GOTO MRRepLowMagicMulti
		++ @85 GOTO MRRepLowCW
	END

	IF ~~ THEN BEGIN MRRepLowMagicSolo
		SAY @86
		++ @87 GOTO MRRepLowMagicDual2
		++ @88 GOTO MRRepLowMagicDual3
	END

	IF ~~ THEN BEGIN MRRepLowMagicDual
		SAY @89
		++ @87 GOTO MRRepLowMagicDual2
		++ @90 GOTO MRRepLowMagicDual2
		++ @88 GOTO MRRepLowMagicDual3
	END

	IF ~~ THEN BEGIN MRRepLowMagicDual2
		SAY @91
		=
		@92
		IF ~~ THEN EXIT
	END
END

CHAIN BIMOEN2 MRRepLowMagicDual3
 @93
 ==BIMOEN2 IF ~Global("ImoenRomanceActive","GLOBAL",2) ~ THEN @94
 ==BIMOEN2 IF ~!Global("ImoenRomanceActive","GLOBAL",2) ~ THEN @95
 EXIT

APPEND BIMOEN2
	IF ~~ THEN BEGIN MRRepLowMagicMulti
		SAY @96
		++ @87 GOTO MRRepLowMagicDual2
		++ @97 GOTO MRRepLowMagicDual2
		++ @88 GOTO MRRepLowMagicDual3

	END

	IF ~~ THEN BEGIN MRRepLowWicca
		SAY @98
		++ @99 GOTO MRRepLowWicca3
		++ @100 GOTO MRRepLowWicca3
		++ @101 GOTO MRRepLowWicca4
	END

	IF ~~ THEN BEGIN MRRepLowWicca3
		SAY @102
		++ @103 GOTO MRRepLowWicca5
		++ @104 GOTO MRRepLowWicca4
		++ @105 GOTO MRRepLowWicca5
	END

	IF ~~ THEN BEGIN MRRepLowWicca5
		SAY @106
		=
		@107
		=
		@108
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowWicca4
		SAY @109
		=
		@110
		IF ~Global("ImoenRomanceActive","GLOBAL",2) ~ THEN REPLY @111 EXIT
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @112 GOTO MRRepLowGirl
		++ @113 EXIT
		++ @114 EXIT
	END

	IF ~~ THEN BEGIN MRRepLowGirl
		SAY @115
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowCW
		SAY @116
		=
		@117
		IF ~~ THEN EXIT
	END


	IF ~~ THEN BEGIN MRRepLowNeu
		SAY @118
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowNeu2
		SAY @119
		=
	 @120
		++ @121 GOTO MRRepLowGood
		++ @79 GOTO MRRepLowNeu
		++ @122 GOTO MRRepLowNeu
	END

	IF ~~ THEN BEGIN MRRepLowBhaal
		SAY @123
		IF ~CheckStatLT(Player1,13,CHR)~ THEN REPLY @124 GOTO MRRepLowBhaal21
		IF ~CheckStatGT(Player1,13,CHR) CheckStatLT(Player1,17,CHR)~ THEN REPLY @124 GOTO MRRepLowBhaal22
		IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @124 GOTO MRRepLowBhaal23
		++ @125 GOTO MRRepLowNeu
		++ @126 GOTO MRRepLowNeu2
	END

	IF ~~ THEN BEGIN MRRepLowBhaal21
		SAY @127
		IF ~~ THEN DO ~RunAwayFrom(Player1,45)~EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal22
		SAY @128
		IF ~!CheckStatGT(Player1,13,CHR)~ GOTO MRRepLowBhaal3
		IF ~CheckStatGT(Player1,13,CHR)~ GOTO MRRepLowBhaal4
	END

	IF ~~ THEN BEGIN MRRepLowBhaal23
		SAY @129 
		IF ~~ THEN GOTO MRRepLowBhaal4
	END

	IF ~~ THEN BEGIN MRRepLowBhaal3
		SAY @130 
		IF ~~ THEN DO ~RealSetGlobalTimer("MRLowBhaalTimer","GLOBAL",300) SetGlobal("MRRepLowBhaalWait","GLOBAL",1) RunAwayFrom(Player1,45)~ EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal4
		SAY @131
		=
		@132 
		IF ~~ THEN DO ~RunAwayFrom(Player1,45)~ EXIT
	END
END


APPEND IMOEN2J
	IF ~Global("MRRepLowBhaalWait","GLOBAL",2)~ THEN BEGIN MRRepLowBhaalContinue
		SAY @133
			++ @134 DO ~SetGlobal("MRRepLowBhaalWait","GLOBAL",3)~ GOTO MRRepLowBhaal-Joke
			++ @135 DO ~SetGlobal("MRRepLowBhaalWait","GLOBAL",3)~ GOTO MRRepLowBhaal-Why
			++ @136 DO ~SetGlobal("MRRepLowBhaalWait","GLOBAL",3)~ GOTO MRRepLowBhaal-Yes
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-Joke
		SAY @137
		= @138
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-Why
		SAY @139
			++ @140 GOTO MRRepLowBhaal-Joke
			++ @141 GOTO MRRepLowBhaal-Yes
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-Yes
		SAY @142
		= @143
			++ @144 GOTO MRRepLowBhaal-YesBeing
			++ @145 GOTO MRRepLowBhaal-YesPlace
			++ @146 + MRRepLowBhaal-YesStop
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesStop
		SAY @147
		= @148
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesPlace
		SAY @149
			++ @150 GOTO MRRepLowBhaal-YesPlaceWrong
			++ @151 GOTO MRRepLowBhaal-YesPlaceStrong
			++ @146 GOTO MRRepLowBhaal-YesStop
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesBeing
		SAY @152
		= @153
			++ @150 GOTO MRRepLowBhaal-YesPlaceWrong
			++ @151 GOTO MRRepLowBhaal-YesPlaceStrong
			++ @146 GOTO MRRepLowBhaal-YesStop	
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesPlaceWrong
		SAY @154
			++ @155 GOTO MRRepLowBhaal-YesWrongEnd
			++ @156 GOTO MRRepLowBhaal-YesSomeday
			++ @157 GOTO MRRepLowBhaal-YesSomeday
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesPlaceStrong
		SAY @158
			++ @159 GOTO MRRepLowBhaal-YesSomeday
			++ @160 GOTO MRRepLowBhaal-YesSomeday
			++ @161 GOTO MRRepLowBhaal-YesStop
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesSomeday
		SAY @162
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRRepLowBhaal-YesWrongEnd
		SAY @163
		= @164
		IF ~~ THEN EXIT
	END
END




