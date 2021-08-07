APPEND IMOEN2J
	// just before sleep at underdark exit comment

	 IF ~Global("MRCampSleepTalk","GLOBAL",1) AreaCheck("AR2500")~ THEN BEGIN MRCampfireAct2
		SAY @0
		IF ~~ THEN DO ~SetGlobal("MRCampSleepTalk","GLOBAL",2)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe1")~
		EXIT	
	END
END
//campfire cutscene start
//act 2

//loveme1a.bcs start
APPEND IMOEN2J
	IF ~Global("MRCampfireMusic","GLOBAL",1)~ THEN BEGIN MRCampfireMusic
		SAY @1
		IF ~~ THEN REPLY @2 DO ~SetGlobal("MRCampfireMusic","GLOBAL",2)~ GOTO MRCampfireMusic2
	END

	IF ~~ THEN BEGIN MRCampfireMusic2
		SAY @3
		++ @4 GOTO MRCampfireMusic2Rest
		++ @5 GOTO MRCampfireMusic2Rest
		++ @6 GOTO MRCampfireMusic2Rest
		++ @7 GOTO MRCampfireMusic2Rest
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Rest
		SAY @8
		IF ~NumInPartyGT(2)~ THEN REPLY @9 GOTO MRCampfireMusic2Group
		IF ~!NumInPartyGT(2)~ THEN REPLY @9 GOTO MRCampfireMusic2Solo
		IF ~NumInPartyGT(2)~ THEN REPLY @10 GOTO MRCampfireMusic2Group
		IF ~!NumInPartyGT(2)~ THEN REPLY @10 GOTO MRCampfireMusic2Solo
		++ @11 GOTO MRCampfireMusic2Naughty
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Naughty
		SAY @12
		= @13
		IF ~~ THEN REPLY @14 GOTO MRCampfireMusic2NaughtyNice
		IF ~Gender(Player1,MALE)~ THEN REPLY @15 GOTO MRCampfireMusic2Naughty2Male
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @16 GOTO MRCampfireMusic2Naughty2Female
		++ @17 GOTO MRCampfireMusic2NaughtyJoke
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyJoke
		SAY @18
		IF ~NumInPartyGT(2)~ THEN GOTO MRCampfireMusic2Group
		IF ~!NumInPartyGT(2)~ THEN GOTO MRCampfireMusic2Solo
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Naughty2Male
		SAY @19
		= @20
		= @21
		= @22
		IF ~~ THEN DO ~LeaveParty()
		SetGlobal("KickedOut","LOCALS",1)
		SetDialog("Imoen2p")
		ReputationInc(-1)
		SetGlobal("ImoenRomanceActive","GLOBAL",3)
		EscapeAreaMove("ar0406",504,1493,0)~ // IMOEN SHOULD GO TO THE COPPER CORONET~
		EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Naughty2Female
		SAY @19
		= @23


		= @21
		= @22
		IF ~~ THEN DO ~LeaveParty()
		ReputationInc(-1) 
		SetGlobal("KickedOut","LOCALS",1)
		SetDialog("Imoen2p")
		SetGlobal("ImoenRomanceActive","GLOBAL",3)
		EscapeAreaMove("ar0406",504,1493,0)~ // IMOEN SHOULD GO TO THE COPPER CORONET~
		EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNice
		SAY @24

                = @25

		++ @26 GOTO MRCampfireMusic2NaughtyNiceSad
		IF ~Gender(Player1,MALE)~ THEN REPLY @27 GOTO MRCampfireMusic2NaughtyNiceSadF
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @28 GOTO MRCampfireMusic2NaughtyNiceSadF
		++ @29 GOTO MRCampfireMusic2NaughtyNiceBitch
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNiceSad
		SAY @30

		=
		@31
		=
		@32
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
                SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNiceSadF
		SAY @33

		=
		@31
		=
		@32
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
                SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2NaughtyNiceBitch
		SAY @34
		=
		@35
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
                SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Group
		SAY @36

		++ @37	DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
        	++ @38 GOTO MRCampfireMusic2Orgy

	END

	IF ~~ THEN BEGIN MRCampfireMusic2Solo
		SAY @39
		++ @40 GOTO MRCampfireMusic2Orgy
		++ @37	DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
	END


	IF ~~ THEN BEGIN MRCampfireMusic2Orgy
		SAY @41
		++ @42 DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
		IF ~NumInPartyGT(2)~ THEN REPLY @43 GOTO MRCampfireMusic2OrgyGroup
		IF ~!NumInPartyGT(2)~ THEN REPLY @43 GOTO MRCampfireMusic2OrgySolo
	END
END


CHAIN IMOEN2J MRCampfireMusic2OrgyGroup
	@44
	= @45
	==VICONIJ IF ~CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Viconia")~ THEN @46
	==AERIEJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Aerie")~ THEN @47
	==NALIAJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Nalia")~ THEN @48
	==NALIAJ IF ~Gender(Player1,MALE) CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Nalia")~ THEN @49
	==NALIAJ IF ~Gender(Player1,MALE) !CheckStatGT(Player1,10,CHR) IsValidForPartyDialog("Nalia")~ THEN @50
	==MAZZYJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Mazzy")~ THEN @51
	==VICONIJ IF ~!CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Viconia")~ THEN @52
	==JAHEIRAJ IF ~Gender(Player1,MALE) IsValidForPartyDialog("Jaheira")~ THEN @53

	==KORGANJ IF ~Gender(Player1,FEMALE) CheckStatGT(Player1,9,CHR) IsValidForPartyDialog("Korgan")~ THEN @54
	==KORGANJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,10,CHR) IsValidForPartyDialog("Korgan")~ THEN @55
	==EDWINJ IF ~Gender(Player1,FEMALE) CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Edwin")~ THEN @56
	==EDWINJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,13,CHR) !CheckStatLT(Player1,10,CHR) IsValidForPartyDialog("Edwin")~ THEN @57
	==EDWINJ IF ~Gender(Player1,FEMALE) CheckStatLT(Player1,10,CHR) IsValidForPartyDialog("Edwin")~ THEN @58
	==JANJ IF ~Gender(Player1,FEMALE) IsValidForPartyDialog("Jan")~ THEN @59
	==HAERDAJ IF ~Gender(Player1,FEMALE) CheckStatGT(Player1,12,CHR) IsValidForPartyDialog("HaerDalis")~ THEN @60
	==HAERDAJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,12,CHR) IsValidForPartyDialog("HaerDalis")~ THEN @61
	==ANOMENJ IF ~Gender(Player1,FEMALE) IsValidForPartyDialog("Anomen")~ THEN @62
	==VALYGARJ IF ~Gender(Player1,FEMALE) IsValidForPartyDialog("Valygar")~ THEN @63
	==KELDORJ IF ~Gender(Player1,FEMALE) !CheckStatGT(Player1,13,CHR) IsValidForPartyDialog("Keldorn")~ THEN @51
	==MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @64
	==CERNDJ IF ~IsValidForPartyDialog("Cernd")~ THEN @65
	
	==IMOEN2J @66
END ++ @67 EXTERN IMOEN2J MRCampfireMusic2Sex
	++ @68 EXTERN IMOEN2J MRCampfireMusic2OrgyBath

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic2OrgySolo
		SAY @69
		= @45
		= @66
		++ @67 GOTO MRCampfireMusic2Sex
		++ @68 GOTO MRCampfireMusic2OrgyBath
	END


	IF ~~ THEN BEGIN MRCampfireMusic2OrgyBath
		SAY @70
		=
		@71
		=
		@72
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic2Sex
		SAY @73
		= @74
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe2")~ EXIT
	END

	//LoveMe2.baf

	// *** Act 3 ***

	IF ~NumInPartyGT(2) Global("MRCampfireMusic","GLOBAL",2)~ THEN BEGIN MRCampfireMusic3Group
		SAY @75
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",3)~ GOTO MRCampfireMusic4
	END

	IF ~!NumInPartyGT(2) Global("MRCampfireMusic","GLOBAL",2)~ THEN BEGIN MRCampfireMusic3Solo
		SAY @76
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",3)~ GOTO MRCampfireMusic4
	END
END

CHAIN IMOEN2J MRCampfireMusic4
@77
= @78
= @79
= @80



= @81
== IMOEN2J IF ~!Class(Player1,BARD)~ THEN @82
== IMOEN2J IF ~Class(Player1,BARD)~ THEN @83



== IMOEN2J @84
= @85

= @86
= @87
= @88
= @89
= @90
== IMOEN2J IF ~Class(Player1,BARD)~ THEN @91
== IMOEN2J IF ~!Class(Player1,BARD)~ THEN @92
== IMOEN2J @93
= @94
= @95
= @96
= @97

= @98
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @99
== AERIEJ IF ~IsValidForPartyDialog("Aerie") !Class(Player1,BARD)~ THEN @100
== AERIEJ IF ~IsValidForPartyDialog("Aerie") Class(Player1,BARD)~ THEN @101
== NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @102
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @103
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @104
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @105
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @106
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @107
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @108
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @109
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @110
== ANOMENJ IF ~IsValidForPartyDialog("Anomen")~ THEN @111
END IMOEN2J MRCampfireMusic5

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic5
		SAY @112
		++ @113 GOTO MRCampfireMusic5How
		+ ~!Class(Player1,BARD)~ + @114 GOTO MRCampfireMusic5WhyNot
		IF ~Class(Player1,BARD)~ THEN REPLY @115 GOTO MRCampfireMusic5WhyNot
                ++ @116 GOTO MRCampfireMusic5Continue
		IF ~!Class(Player1,BARD)~ THEN REPLY @117 GOTO MRCampfireMusic5Hate
		++ @118 GOTO MRCampfireMusic5Hate
	END

	IF ~~ THEN BEGIN MRCampfireMusic5Hate
		SAY @119
		++ @120 GOTO MRCampfireMusic5HateJoke
		IF ~!Class(Player1,BARD)~ THEN REPLY @121 GOTO MRCampfireMusic5HateYes
		++ @122 GOTO MRCampfireMusic5HateYou
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateYou
		SAY @123
		= @124
		=@125
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)
		SetGlobal("MRCampfireMusic","GLOBAL",7)
        	StartCutSceneMode() StartCutScene("Cut34a")~
		EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateYes
		SAY @126
		IF ~~ THEN GOTO MRCampfireMusic5HateStopGroup
		IF ~!NumInPartyGT(2)~ THEN GOTO MRCampfireMusic5HateStopSolo
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateStopGroup
		SAY @127
		IF ~~ THEN GOTO MRCampfireMusic5HateStopEnd
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateStopSolo
		SAY @128
		IF ~~ THEN GOTO MRCampfireMusic5HateStopEnd
	END

	IF ~~ THEN BEGIN MRCampfireMusic5HateStopEnd
		SAY @129
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player2)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3a")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player3)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3b")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player4)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3c")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player5)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3d")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player6)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3e")~ EXIT
		
		IF ~!Global("ImoenRomanceActive","GLOBAL",1)~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END


	IF ~~ THEN BEGIN MRCampfireMusic5HateJoke
		SAY @130
		++ @131 GOTO MRCampfireMusic5How
		++ @132 GOTO MRCampfireMusic5WhyNot
        ++ @133 GOTO MRCampfireMusic5Continue
	END

	IF ~~ THEN BEGIN MRCampfireMusic5How
		SAY @134
		= @135
		++ @136 GOTO MRCampfireMusic5WhyNot
		++ @137 GOTO MRCampfireMusic6
		++ @138 GOTO MRCampfireMusic5Continue
	END

	IF ~~ THEN BEGIN MRCampfireMusic5WhyNot
		SAY @139
		=
		@140
		=
		@141
		++ @142 GOTO MRCampfireMusic5Continue
		++ @143 GOTO MRCampfireMusic5Continue2
        ++ @137 GOTO MRCampfireMusic6
	END



	IF ~~ THEN BEGIN MRCampfireMusic5Continue
		SAY @144
		IF ~~ THEN GOTO MRCampfireMusic6
	END

	IF ~~ THEN BEGIN MRCampfireMusic5Continue2
		SAY @145
		IF ~~ THEN GOTO MRCampfireMusic6
	END

	IF ~~ THEN BEGIN MRCampfireMusic6
		SAY @146
                = @147
		= @148

		= @149

		= @150

		= @151

		= @152
		= @153

		IF ~~ THEN GOTO MRCampfireMusic7
	END
END

CHAIN IMOEN2J MRCampfireMusic7
@154
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @155
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @156
== NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @157
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @158
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @159
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @160

== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @161
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @162
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @163
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @164
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")~ THEN @165
== ANOMENJ IF ~IsValidForPartyDialog("Anomen")~ THEN @166
END IMOEN2J MRCampfireMusic8


APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic8
		SAY @167

		++ @168 GOTO MRCampfireMusic8Stun
		++ @169 GOTO MRCampfireMusic8Gift

		++ @170 GOTO MRCampfireMusic8High
		++ @171 GOTO MRCampfireMusic8Shrug
		++ @172 GOTO MRCampfireMusic8Cringe

	END

	IF ~~ THEN BEGIN MRCampfireMusic8Stun
		SAY @173
		=
		@174
		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8Gift
		SAY @175

		=
		@176

		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8High
		SAY @177


		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8Shrug
		SAY @178

		IF ~~ THEN GOTO MRCampfireMusic9
	END

	IF ~~ THEN BEGIN MRCampfireMusic8Cringe
		SAY @179
         =@180
		IF ~~ THEN GOTO MRCampfireMusic9
	END
END

CHAIN IMOEN2J MRCampfireMusic9
@181

== IMOEN2J IF ~NumInPartyGT(2)~ THEN @182
== IMOEN2J IF ~NumInPartyGT(2)~ THEN @183
== IMOEN2J IF ~NumInPartyGT(2)~ THEN @184
== IMOEN2J IF ~!NumInPartyGT(2)~ THEN @185
== IMOEN2J IF ~!NumInPartyGT(2)~ THEN @186
== IMOEN2J IF ~!NumInPartyGT(2)~ THEN @187
END IMOEN2J MRCampfireMusic10

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMusic10
		SAY @188
			IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player2)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3a")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player3)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3b")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player4)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3c")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player5)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3d")~ EXIT
		
		IF ~Global("ImoenRomanceActive","GLOBAL",1) Name("Imoen2",Player6)~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe3e")~ EXIT
		IF ~!Global("ImoenRomanceActive","GLOBAL",1)~ THEN DO ~StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	// *** Act 4 ***
	//loveme3.baf

	IF ~Global("MRCampfireMusic","GLOBAL",3)~ THEN BEGIN MRCampfireMorning
		SAY @189
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",4) ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfireMorning2
	END

	IF ~~ THEN BEGIN MRCampfireMorning2
		SAY @190

		IF ~~ THEN EXTERN PLAYER1 MRCampfireMorning2
	END
END

APPEND PLAYER1
	IF ~~ THEN BEGIN MRCampfireMorning2
	SAY @191
        = @192


	IF ~~ THEN EXTERN IMOEN2J MRCampfireMorning3
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMorning3
		SAY @193
		=
		@194
		++ @195 GOTO MRCampfireMorning3Why


		++ @196 GOTO MRCampfireMorning3Catch
		++ @197 GOTO MRCampfireMorning3Catch
		++ @198 GOTO MRCampfireMorning3Bitch
		++ @199 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why
		SAY @200
		++ @201 GOTO MRCampfireMorning3Why2
		++ @196 GOTO MRCampfireMorning3Catch


		++ @197 GOTO MRCampfireMorning3Catch
		++ @202 GOTO MRCampfireMorning3Bitch
		++ @203 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why2
		SAY @204

		=
		@205
		++ @206 GOTO MRCampfireMorning3Why3
		++ @196 GOTO MRCampfireMorning3Catch
		++ @197 GOTO MRCampfireMorning3Catch


		++ @207 GOTO MRCampfireMorning3Bitch
		++ @208 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why3
		SAY @209
		++ @210 GOTO MRCampfireMorning3Catch
		++ @211 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Why4
		SAY @212
                = @213
                IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4) SetGlobal("MRCampfireMusic","GLOBAL",7) ApplySpellRES("SPIRSLP",Player1) ApplySpellRES("SPIRSLP",Player2) ApplySpellRES("SPIRSLP",Player3) ApplySpellRES("SPIRSLP",Player4) ApplySpellRES("SPIRSLP",Player5) ApplySpellRES("SPIRSLP",Player6)~ EXIT
         END

	IF ~~ THEN BEGIN MRCampfireMorning3Bitch
		SAY @214
		++ @215 GOTO MRCampfireMorning3Catch
		++ @216 GOTO MRCampfireMorning3Catch
		++ @217 GOTO MRCampfireMorning3Why4


	END

	IF ~~ THEN BEGIN MRCampfireMorning3Catch
		SAY @218
		=
		@219

		++ @220 GOTO MRCampfireMorning3Chase
		++ @221 GOTO MRCampfireMorning3Revenge
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Revenge
		SAY @222
		++ @215 GOTO MRCampfireMorning3Catch

		++ @223 GOTO MRCampfireMorning3Chase
		++ @224 GOTO MRCampfireMorning3Why4
	END

	IF ~~ THEN BEGIN MRCampfireMorning3Chase
		SAY @225
		IF ~~ THEN DO ~
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe4")
		~ EXIT
	END
END

// *** Act 5 ***
//LoveMe4

APPEND PLAYER1
	IF ~Global("MRCampfireMusic","GLOBAL",4)~ THEN BEGIN MRCampfireMorning3Chase
	SAY @226
	=
	@227
	=
	@228


	IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",5)~ EXTERN IMOEN2J MRCampfireMorning4
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfireMorning4
		SAY @229
		++ @230 DO ~ActionOverride(Player1,SetDialog("Player1"))~GOTO MRCampfireMorning4Tickle2
		++ @231 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfireMorning4Tickle
		++ @232 GOTO MRCampfireMorning4Anger
		++ @233 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfireMorning4Quit
	END

	IF ~~ THEN BEGIN MRCampfireMorning4Anger
	   SAY @234
           = @235
           = @236
           = @237
           = @238
           IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) SetGlobal("ImoenRomanceActive","GLOBAL",3) ApplySpellRES("SPIRSLP",Player1) ApplySpellRES("SPIRSLP",Player2) ApplySpellRES("SPIRSLP",Player3) ApplySpellRES("SPIRSLP",Player4) ApplySpellRES("SPIRSLP",Player5) ApplySpellRES("SPIRSLP",Player6)~ EXIT
        END

	IF ~~ THEN BEGIN MRCampfireMorning4Quit
		SAY @239
		=
		@240
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) SetGlobal("ImoenRomanceActive","GLOBAL",4) ApplySpellRES("SPIRSLP",Player1) ApplySpellRES("SPIRSLP",Player2) ApplySpellRES("SPIRSLP",Player3) ApplySpellRES("SPIRSLP",Player4) ApplySpellRES("SPIRSLP",Player5) ApplySpellRES("SPIRSLP",Player6)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfireMorning4Tickle
		SAY @241
		=
		@242
		IF ~~ THEN GOTO MRCampfireMorning4Tickle2
	END

	IF ~~ THEN BEGIN MRCampfireMorning4Tickle2
		SAY @243

		=
		@244
                =
                @245
                =
		@246
		++ @247 GOTO MRCampfirePivotFondle
		++ @248 GOTO MRCampfirePivotStand
		++ @249 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfirePivotKiss
		++ @250 GOTO MRCampfirePivotDelay
		++ @251 GOTO MRCampfirePivotSpeak
	END

	IF ~~ THEN BEGIN MRCampfirePivotSpeak
		SAY @252

		++ @253 GOTO MRCampfirePivotFondle
		++ @248 GOTO MRCampfirePivotStand
		++ @254 DO ~ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRCampfirePivotKiss
		++ @250 GOTO MRCampfirePivotDelay
	END



	IF ~~ THEN BEGIN MRCampfirePivotKiss
		SAY @255
		=@256
        IF ~~ THEN GOTO MRCampfirePivotKissNext
	END
END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRCampfirePivotDelay
		SAY @257
		=
		@258
		=@259
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) 
		SetGlobal("ImoenRomanceActive","GLOBAL",4) ApplySpellRES("SPIRSLP",Player1) ApplySpellRES("SPIRSLP",Player2) ApplySpellRES("SPIRSLP",Player3) ApplySpellRES("SPIRSLP",Player4) ApplySpellRES("SPIRSLP",Player5) ApplySpellRES("SPIRSLP",Player6)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfirePivotStand
		SAY @260
		=
		@259
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7) SetGlobal("ImoenRomanceActive","GLOBAL",4) ApplySpellRES("SPIRSLP",Player1) ApplySpellRES("SPIRSLP",Player2) ApplySpellRES("SPIRSLP",Player3) ApplySpellRES("SPIRSLP",Player4) ApplySpellRES("SPIRSLP",Player5) ApplySpellRES("SPIRSLP",Player6)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfirePivotFondle
		SAY @261
                = @262
                = @263
                = @264
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
		SetGlobal("ImoenRomanceActive","GLOBAL",4) ApplySpellRES("SPIRSLP",Player1) ApplySpellRES("SPIRSLP",Player2) ApplySpellRES("SPIRSLP",Player3) ApplySpellRES("SPIRSLP",Player4) ApplySpellRES("SPIRSLP",Player5) ApplySpellRES("SPIRSLP",Player6)~ EXIT
	END

	IF ~~ THEN BEGIN MRCampfirePivotKissNext
		SAY @265
		= @266
		= @267
		IF ~~ THEN REPLY @268 GOTO MRCampfirePivotYes
		++ @269 GOTO MRCampfirePivotYes
		IF ~~ THEN REPLY @270 GOTO MRCampfirePivotYes
		++ @271 GOTO MRCampfirePivotYes
        ++ @272 GOTO MRCampfirePivotNo
	END


	IF ~~ THEN BEGIN MRCampfirePivotYes
	SAY @273
	= @274
	= @275
	IF ~~ THEN DO ~ClearAllActions()
	FaceObject(Player1)
	StartCutSceneMode()
	StartCutScene("LoveMe5")~
	EXIT
 END


	IF ~~ THEN BEGIN MRCampfirePivotNo
		SAY @276
		=
		@277
		=
		@278
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",7)
		SetGlobal("ImoenRomanceActive","GLOBAL",4) ApplySpellRES("SPIRSLP",Player1) ApplySpellRES("SPIRSLP",Player2) ApplySpellRES("SPIRSLP",Player3) ApplySpellRES("SPIRSLP",Player4) ApplySpellRES("SPIRSLP",Player5) ApplySpellRES("SPIRSLP",Player6)~ EXIT
	END
END

// *** Act 6: The messy interlude ***
//loveme5.baf

APPEND PLAYER1
	IF ~Global("MRCampfireMusic","GLOBAL",5)~ THEN BEGIN MRCampfireAftermath
		SAY @279
		=
		@280
		IF ~~ THEN DO ~SetGlobal("MRCampfireMusic","GLOBAL",6) SetGlobal("MRSleptImoen","GLOBAL",1) SetGlobalTimer("MRPartyReactionTimer","GLOBAL",ONE_DAY)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("LoveMe5b")~ EXIT
	END
END

//loveme5a.baf
APPEND IMOEN2J
	IF ~Global("MRCampfireMusic","GLOBAL",6)~ THEN BEGIN MRCampfireAftermath
		SAY @281
                = @282
                = @283
                = @284
                = @285
                = @286
                = @287
				= @288
                IF ~~ THEN DO ~
			SetGlobal("MRCampfireMusic","GLOBAL",7)
			RunAwayFromNoInterrupt(Player1,30)~ EXIT
	END
END