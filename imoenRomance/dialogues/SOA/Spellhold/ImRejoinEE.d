CHAIN PLAYER1 MRIntroductionsYes
@0
== PLAYER1 IF ~IsValidForPartyDialog("Aerie") Global("AerieRomanceActive","GLOBAL",2)~ THEN @1

== PLAYER1 IF ~IsValidForPartyDialog("Aerie") !Global("AerieRomanceActive","GLOBAL",2)~ THEN
@2
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @3
==PLAYER1 IF ~IsValidForPartyDialog("Korgan")~ THEN @4
==KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @5
== PLAYER1 IF ~IsValidForPartyDialog("Nalia")~ THEN @6
==NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @7
==PLAYER1 IF ~IsValidForPartyDialog("Jan")~ THEN  @8
==JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @9
==PLAYER1 IF ~IsValidForPartyDialog("Keldorn")~ THEN @10
==KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @11
==PLAYER1 IF ~IsValidForPartyDialog("HaerDalis")~ THEN @12

==HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @13
==PLAYER1 IF ~IsValidForPartyDialog("Anomen")~ THEN @14
==ANOMENJ  IF ~IsValidForPartyDialog("Anomen")~ THEN @15
==PLAYER1 IF ~IsValidForPartyDialog("Cernd")~ THEN @16
==CERNDJ IF ~IsValidForPartyDialog("Cernd")~ THEN @17
==PLAYER1 IF ~IsValidForPartyDialog("Valygar")~ THEN @18
==VALYGARJ IF ~IsValidForPartyDialog("Valygar")~ THEN @19
==PLAYER1 IF ~IsValidForPartyDialog("Mazzy")~ THEN @20
==MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @21
==PLAYER1 IF ~IsValidForPartyDialog("Hexxat")~ THEN @22
==IMOEN2 IF ~IsValidForPartyDialog("Hexxat")~ THEN @23
== HEXXATJ IF ~IsValidForPartyDialog("Hexxat")~ THEN @24
==PLAYER1 IF ~IsValidForPartyDialog("Wilson")~ THEN @25
==IMOEN2 IF ~IsValidForPartyDialog("Wilson")~ THEN @26
== WILSONJ IF ~IsValidForPartyDialog("Wilson")~ THEN @27

END IF ~OR(7)
	IsValidForPartyDialog("Minsc")
	IsValidForPartyDialog("Jaheira")
	IsValidForPartyDialog("Viconia")
	IsValidForPartyDialog("Edwin")
	IsValidForPartyDialog("Neera")
	IsValidForPartyDialog("Dorn")
	IsValidForPartyDialog("Rasaad")~ THEN REPLY @28 EXTERN IMOEN2 MRIntroductionsOld
	IF ~!IsValidForPartyDialog("Minsc")
	!IsValidForPartyDialog("Jaheira")
	!IsValidForPartyDialog("Viconia")
	!IsValidForPartyDialog("Edwin")
	!IsValidForPartyDialog("Neera")
	!IsValidForPartyDialog("Dorn")
	!IsValidForPartyDialog("Rasaad")~ THEN REPLY @29 EXTERN IMOEN2 MRIntroductionsJM2
	
CHAIN IMOEN2 MRIntroductionsOld
@30
==IMOEN2 IF ~IsValidForPartyDialog("Neera")~ THEN @31
== NEERAJ IF ~IsValidForPartyDialog("Neera")~ THEN @32
==IMOEN2 IF ~IsValidForPartyDialog("Dorn")~ THEN @33
== DORNJ IF ~IsValidForPartyDialog("Dorn")~ THEN @34
==IMOEN2 IF ~IsValidForPartyDialog("Rasaad")~ THEN @35
== RASAADJ IF ~IsValidForPartyDialog("Rasaad")~ THEN @36
== IMOEN2 IF ~IsValidForPartyDialog("Jaheira")~ THEN @37
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @38
== IMOEN2 IF ~IsValidForPartyDialog("Jaheira")~ THEN @39
== IMOEN2 IF ~IsValidForPartyDialog("Minsc")~ THEN @40
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @41 
== IMOEN2 IF ~IsValidForPartyDialog("Minsc")~ THEN @42
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @43
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @44
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @45
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @46
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @47
== IMOEN2 IF ~IsValidForPartyDialog("Viconia")~ THEN @48
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @49
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @50
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @51
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @52
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @53
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @54
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @55
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @56
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @57
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @58
== EDWINJ IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @59
== IMOEN2 IF ~Gender("Edwin",FEMALE) IsValidForPartyDialog("Edwin")~ THEN @60
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @61
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @62
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @63
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @64
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @65
== EDWINJ IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @66
== IMOEN2 IF ~Gender("Edwin",MALE) IsValidForPartyDialog("Edwin")~ THEN @67
END IMOEN2 MRIntroductionsOldNext