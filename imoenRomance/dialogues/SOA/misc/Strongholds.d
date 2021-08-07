
/* Should trigger if the player has a stronghold BEFORE Imoen joins the party in Spellhold */

/* STRONGHOLD COMMENT - RADIANT HEART */

// *** Radiant Heart ***

APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkPal","GLOBAL",1)~ THEN BEGIN MRPalStrong1
		SAY @0
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkPal","GLOBAL",2)~ GOTO MRPalStrong2
	END

	IF ~~ THEN BEGIN MRPalStrong2
		SAY @1
		=
		@2
		++ @3 GOTO MRPalStrongCor1
		++ @4 GOTO MRPalStrongCor1
		++ @5 GOTO MRPalStrongCor2
		++ @6 GOTO MRPalStrongStuffy
		++ @7 GOTO MRPalStrongEnd
	END

	IF ~~ THEN BEGIN MRPalStrongEnd
		SAY @8
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy
		SAY @9
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @10 GOTO MRPalStrongSexy1
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @10 GOTO MRPalStrongSexy2
		++ @11 GOTO MRPalStrongSexy1
		++ @12 GOTO MRPalStrongStuffy1
		IF ~Gender(Player1,MALE)~ THEN REPLY @13 GOTO MRPalStrongStuffy2M
		++ @14 GOTO MRPalStrongSexy1
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @13 GOTO MRPalStrongStuffy2F
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy1
		SAY @15
		=
		@16
		=
		@17
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy2M
		SAY @18
		=
		@19
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~ EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongStuffy2F
		SAY @18
		=
		@20
		IF ~~ THEN DO ~SetGlobal("ImoenRomanceActive","GLOBAL",4)~EXIT
	END


	IF ~~ THEN BEGIN MRPalStrongSexy1
		SAY @21
		IF ~~ THEN GOTO MRPalStrongCor1
	END

	IF ~~ THEN BEGIN MRPalStrongSexy2
		SAY @22
		=
		@23
		=
		@24
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongCor1
		SAY @25
		++ @26 GOTO MRPalStrongCor2
		++ @27 GOTO MRPalStrongCor3
		++ @7 GOTO MRPalStrongEnd
		++ @28 GOTO MRPalStrongProud
	END

	IF ~~ THEN BEGIN MRPalStrongProud
		SAY @29
		IF ~~ THEN GOTO MRPalStrongCor2
	END

	IF ~~ THEN BEGIN MRPalStrongCor3
		SAY @30
		IF ~~ THEN GOTO MRPalStrongCor2
	END

	IF ~~ THEN BEGIN MRPalStrongCor2
		SAY @31
		=
		@32
		++ @33 GOTO MRPalStrongCor4
		++ @34 GOTO MRPalStrongCor4
	END

	IF ~~ THEN BEGIN MRPalStrongCor4
		SAY @35
		=
		@36
		IF ~Global("ImoenRomanceActive","GLOBAL",2) ~ THEN GOTO MRPalStrongCor5
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN GOTO MRPalStrongCor55
	END

	IF ~~ THEN BEGIN MRPalStrongCor5
		SAY @37
		=
		@38
		=
		@39
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRPalStrongCor55
		SAY @40
		=
		@41
		IF ~~ THEN EXIT
	END
END

/* STRONGHOLD COMMENTS - TEMPLES */

// 0901 Temple of Helm
// 0902 Temple of Lathander
// 0904 Temple of Talos


APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkCler","GLOBAL",1)~ THEN BEGIN MRCleStrong
		SAY @42
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkCler","GLOBAL",2)~ GOTO MRCleStrong2
	END

	IF ~~ THEN BEGIN MRCleStrong2
		SAY @43
		IF ~AreaCheck("AR0901")~ THEN GOTO MRCleStrongHelm
		IF ~AreaCheck("AR0902")~ THEN GOTO MRCleStrongLath
		IF ~AreaCheck("AR0904")~ THEN GOTO MRCleStrongTal
	END

	IF ~~ THEN BEGIN MRCleStrongHelm
		SAY @44
		IF ~~ THEN GOTO MRCleStrong3
	END

	IF ~~ THEN BEGIN MRCleStrongLath
		SAY @45
		IF ~~ THEN GOTO MRCleStrong3
	END

	IF ~~ THEN BEGIN MRCleStrongTal
		SAY @46
		IF ~~ THEN GOTO MRCleStrong3
	END

	IF ~~ THEN BEGIN MRCleStrong3
		SAY @47
		++ @48 GOTO MRCleStrongNeu
		++ @49 GOTO MRCleStrongNeu
		++ @50 GOTO MRCleStrongNeu
		++ @51 GOTO MRCleStrongConvert
		++ @52 GOTO MRCleStrongConvert
		++ @53 GOTO MRCleStrongHyp
	END

	IF ~~ THEN BEGIN MRCleStrongHyp
		SAY @54
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRCleStrongConvert
		SAY @55
		IF ~~ THEN GOTO MRCleStrong4
	END

	IF ~~ THEN BEGIN MRCleStrongNeu
		SAY @56
		IF ~~ THEN GOTO MRCleStrong4
	END

	IF ~~ THEN BEGIN MRCleStrong4
		SAY @57
		=
		@58
		=
		@59
		=@60
		IF ~~ THEN EXIT
	END
END

/* STRONGHOLD COMMENT - THIEF */


APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkThie","GLOBAL",1)~ THEN BEGIN MRThiefStrong
		SAY @61
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkThie","GLOBAL",2)~ GOTO MRThiefStrong1
	END

	IF ~~ THEN BEGIN MRThiefStrong1
		SAY @62
		=
		@63
		IF ~Gender(Player1,MALE)~ THEN REPLY @64 GOTO MRThiefStrongGood
		IF ~Gender(Player1,FEMALE)~ THEN REPLY @65 GOTO MRThiefStrongGood
		++ @66 GOTO MRThiefStrongExit
		++ @67 GOTO MRThiefStrongMoney
		++ @68 GOTO MRThiefStrongPreExit
		++ @69 GOTO MRThiefStrongRedeem
		++ @70 GOTO MRThiefStrongBad
	END

	IF ~~ THEN BEGIN MRThiefStrongExit
		SAY @71
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRThiefStrongBad
		SAY @72
		=
		@73
		++ @74 GOTO MRThiefStrongProud
		++ @75 GOTO MRThiefStrongPreExit
		++ @76 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongRedeem
		SAY @77
		++ @74 GOTO MRThiefStrongProud
		++ @78 GOTO MRThiefStrongExit
		++ @76 GOTO MRThiefStrongPreExit
		++ @75 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongPreExit
		SAY @79
		=
		@80
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRThiefStrongMoney
		SAY @81
		++ @82 GOTO MRThiefStrongProud
		++ @78 GOTO MRThiefStrongExit
		++ @76 GOTO MRThiefStrongPreExit
		++ @75 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongGood
		SAY @83
		++ @82 GOTO MRThiefStrongProud
		++ @78 GOTO MRThiefStrongExit
		++ @76 GOTO MRThiefStrongPreExit
		++ @75 GOTO MRThiefStrongPreExit
	END

	IF ~~ THEN BEGIN MRThiefStrongProud
		SAY @84
		=
		@85
		=
		@86
		IF ~~ THEN EXIT
	END
END

/* STRONGHOLD COMMENT - FIGHTER-TYPES */

APPEND IMOEN2J
	IF ~Global("MRStrongholdTalkFigh","GLOBAL",1)~ THEN BEGIN MRFightStrong
		SAY @87
		=
		@88
		=
		@89
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkFigh","GLOBAL",2)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("ImArnise")~ EXIT
	END

	IF WEIGHT #666
	~Global("MRStrongholdTalk","GLOBAL",3)~ THEN BEGIN MRFightStrong2
		SAY @90
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalk","GLOBAL",4)~ GOTO MRFightStrong3
	END

	IF ~~ THEN BEGIN MRFightStrong3
		SAY @91
		IF ~InParty("Nalia")~THEN EXTERN NALIAJ MRFightStrong3
		IF ~!InParty("Nalia")~ THEN GOTO MRFightStrong4
	END

	IF ~~ THEN BEGIN MRFightStrong4
		SAY @92
		=
		@93
		=
		@94
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRFightStrong5
		SAY @95
		=
		@96
		IF ~~ THEN EXTERN NALIAJ MRFightStrong5
	END

	IF ~~ THEN BEGIN MRFightStrong6
		SAY @97
		IF ~~ THEN EXIT
	END
END

APPEND NALIAJ
	IF ~~ THEN BEGIN MRFightStrong3
	SAY @98
	IF ~~ THEN EXTERN IMOEN2J MRFightStrong5
	END

	IF ~~ THEN BEGIN MRFightStrong5
		SAY @99
		IF ~~ THEN EXTERN IMOEN2J MRFightStrong6
	END
END


/* STRONGHOLD COMMENT - UMAR HILLS */

// *** Umar hills ***

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkUmar","GLOBAL",1)~ THEN BEGIN MRStrongUm
	SAY @100
	IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkUmar","GLOBAL",2)~ GOTO MRStrongUm1
	END

	IF ~~ THEN BEGIN MRStrongUm1
		SAY @101
		=
		@102
		++ @103 GOTO MRStrongUmCabin
		++ @104 GOTO MRStrongUmWhy
		++ @105 GOTO MRStrongUmExit1
		++ @106 GOTO MRStrongUmExit2
	END

	IF ~~ THEN BEGIN MRStrongUmExit2
		SAY @107
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmExit1
		SAY @108
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmWhy
		SAY @109
		++ @103 GOTO MRStrongUmCabin
		++ @105 GOTO MRStrongUmExit1
		++ @110 GOTO MRStrongUmExit2
	END

	IF ~~ THEN BEGIN MRStrongUmCabin
		SAY @111
		IF ~~ THEN EXIT
	END

	IF ~Global("MRStrongholdTalkRan","GLOBAL",1)~ THEN BEGIN MRStrongUmCabin1
		SAY @112
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkRan","GLOBAL",2)~ GOTO MRStrongUmCabin2
	END

	IF ~~ THEN BEGIN MRStrongUmCabin2
		SAY @113
		=
		@114
		=
		@115
		=
		@116
		++ @117 GOTO MRStrongUmCould
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @118 GOTO MRStrongUmTogether
		++ @119 GOTO MRStrongUmShare
		++ @120 GOTO MRStrongUmShare
		++ @121 GOTO MRStrongUmSettle
		++ @122 GOTO MRStrongUmUnfinished
	END

	IF ~~ THEN BEGIN MRStrongUmUnfinished
		SAY @123
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmSettle
		SAY @124
		=
		@125
		=
		@126
		=
		@127
		=
		@128
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmShare
		SAY @129
		=
		@130
		=
		@131
		=
		@127
		=
		@132
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmTogether
		SAY @133
		=
		@134
		=
		@135
		=
		@136
		=
		@132
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmCould
		SAY @137
		++ @138 GOTO MRStrongUmGrand
		++ @139 GOTO MRStrongUmBored
		++ @140 GOTO MRStrongUmDumb
		++ @141 GOTO MRStrongUmRude
	END

	IF ~~ THEN BEGIN MRStrongUmGrand
		SAY @142
		=
		@143
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmBored
		SAY @144
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmDumb
		SAY @145
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongUmRude
		SAY @146
		=
		@147
		IF ~~ THEN EXIT
	END

END

/* STRONGHOLD COMMENT - PLAYHOUSE */

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkBard","GLOBAL",1)~ THEN BEGIN MRStrongPlay
		SAY @148
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkBard","GLOBAL",2) ~ GOTO MRStrongPlay1
	END

	IF ~~ THEN BEGIN MRStrongPlay1
		SAY @149
		++ @150 GOTO MRStrongPlayStory
		++ @151 GOTO MRStrongPlay3
		++ @152 GOTO MRStrongPlayPrepare
		++ @153 GOTO MRStrongPlayRude
		++ @154 GOTO MRStrongPlayRude
	END

	IF ~~ THEN BEGIN MRStrongPlayRude
		SAY @155
		=
		@156
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayPrepare
		SAY @157
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlay3
		SAY @158
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlayStory
		SAY @159
		=
		@160
		++ @161 GOTO MRStrongPlayStory2
		++ @162 GOTO MRStrongPlayStory3
		++ @163 GOTO MRStrongPlayRude
		++ @164 GOTO MRStrongPlayRude
	END

	IF ~~ THEN BEGIN MRStrongPlayStory3
		SAY @165
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlayStory2
		SAY @166
		IF ~~ THEN GOTO MRStrongPlay2
	END

	IF ~~ THEN BEGIN MRStrongPlay2
		SAY @167
		=
		@168
		++ @169 GOTO MRStrongPlayPlay
		++ @170 GOTO MRStrongPlayPlay
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @171 GOTO MRStrongPlayKiss
		++ @172 EXIT
		++ @173 GOTO MRStrongPlayRude
	END

	IF ~~ THEN BEGIN MRStrongPlayKiss
		SAY @174
		=
		@175
		++ @176 GOTO MRStrongPlayAsk
		++ @177 GOTO MRStrongPlayCheese
		++ @178 EXIT
		++ @179 GOTO MRStrongPlayHint
	END

	IF ~~ THEN BEGIN MRStrongPlayHint
		SAY @180
		=
		@181
		=
		@182
		=
		@183
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayCheese
		SAY @184
		=
		@185
		=
		@186
		++ @187 GOTO MRStrongPlayAsk
		++ @188 GOTO MRStrongPlayHint
		++ @189 EXIT
		++ @190 GOTO MRStrongPlayHint
	END

	IF ~~ THEN BEGIN MRStrongPlayAsk
		SAY @191
		++ @192 GOTO MRStrongPlayPlay
		++ @193 GOTO MRStrongPlayPlay
		++ @194 GOTO MRStrongPlayChicken
	END

	IF ~~ THEN BEGIN MRStrongPlayChicken
		SAY @195
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayPlay
		SAY @196
		IF ~!NumInPartyGT(2)~ THEN REPLY @197 GOTO MRStrongPlayPlayed
		IF ~NumInPartyGT(2)~ THEN REPLY @198 GOTO MRStrongPlayPlayed
		++ @199 GOTO MRStrongPlayPlayChicken
		++ @200 GOTO MRStrongPlayPay
		++ @201 GOTO MRStrongPlayPlayMad
		++ @202 GOTO MRStrongPlayReverse
		++ @203 GOTO MRStrongPlayPlayHave
		++ @204 GOTO MRStrongPlayReverse
	END

	IF ~~ THEN BEGIN MRStrongPlayReverse
		SAY @205
		=
		@206
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
		++ @209 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayFinal
		SAY @210
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayHave
		SAY @211
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
		++ @209 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayMad
		SAY @212
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
		++ @209 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPay
		SAY @213
		=
		@206
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
		++ @209 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayChicken
		SAY @214
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @208 GOTO MRStrongPlayPlayFinal
		++ @209 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayed
		SAY @215
		=
		@216
		++ @217 GOTO MRStrongPlayPlayFinal2
		++ @218 GOTO MRStrongPlayNotMe
		++ @219 GOTO MRStrongPlayPay
		++ @220 GOTO MRStrongPlayPlayChicken
		++ @221 GOTO MRStrongPlayPlayPromise
		++ @202 GOTO MRStrongPlayReverse
		++ @203 GOTO MRStrongPlayPlayMad
		++ @204 GOTO MRStrongPlayReverse
	END

	IF ~~ THEN BEGIN MRStrongPlayNotMe
		SAY @222
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @223 GOTO MRStrongPlayPlayFinal
		++ @209 GOTO MRStrongPlayPlayFinal
	END

	IF ~~ THEN BEGIN MRStrongPlayPlayFinal2
		SAY @224
		++ @207 GOTO MRStrongPlayPlayFinal
		++ @223 GOTO MRStrongPlayPlayFinal
		++ @209 GOTO MRStrongPlayPlayFinal
	END

		IF ~~ THEN BEGIN MRStrongPlayPlayPromise        //// The change to this state was intentional. It just didn't flow naturally, from clammy and annoyed back to romantic.

		SAY @225
		=
		@226
		IF ~~ THEN EXIT
       END
END


/* STRONGHOLD COMMENT - DRUID GROVE */

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkDrui","GLOBAL",1)~ THEN BEGIN MRStrongGrove
		SAY @227
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkDrui","GLOBAL",2)~ GOTO MRStrongGrove1
	END

	IF ~~ THEN BEGIN MRStrongGrove1
		SAY @228
		=
		@229
		=
		@230
		++ @231 GOTO MRStrongGroveStory
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @232 GOTO MRStrongGroveSex
		++ @233 GOTO MRStrongGroveLong
		++ @234 GOTO MRStrongGroveEvil
		++ @235 GOTO MRStrongGroveExit
		++ @236 GOTO MRStrongGroveExit
	END

	IF ~~ THEN BEGIN MRStrongGroveExit
		SAY @237
		=
		@238
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveEvil
		SAY @239
		=
		@240
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveLong
		SAY @241
		=
		@240
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveSex
		SAY @242
		IF ~~ THEN GOTO MRStrongGroveSex1
	END

	IF ~~ THEN BEGIN MRStrongGroveStory
		SAY @243
		=
		@244
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveSex2
		SAY @245
		=
		@246
		++ @247 GOTO MRStrongGroveSex3
		++ @248 GOTO MRStrongGroveSex4
		++ @249 GOTO MRStrongGroveSex4
		++ @250 GOTO MRStrongGroveSex4
	END

	IF ~~ THEN BEGIN MRStrongGroveSex3
		SAY @251
		IF ~~ THEN GOTO MRStrongGroveSex4
	END

	IF ~~ THEN BEGIN MRStrongGroveSex4
		SAY @252
		IF ~~ THEN GOTO MRStrongGroveSex5
	END

	IF ~~ THEN BEGIN MRStrongGroveSex5
		SAY @253
		++ @254 GOTO MRStrongGroveSexAccept
		++ @255 GOTO MRStrongGroveSexAccept
		++ @256 GOTO MRStrongGroveSexMaybe
		++ @257 GOTO MRStrongGroveSexAccept
		++ @258 GOTO MRStrongGroveSexSlut
		++ @259 GOTO MRStrongGroveSexNo
		++ @260 GOTO MRStrongGroveSexHarlot2
	END

 IF ~~ THEN BEGIN MRStrongGroveSexSlut
 SAY @261
 = @262
 = @263
 IF ~~ THEN EXIT
 END

	IF ~~ THEN BEGIN MRStrongGroveSexHarlot2
		SAY @264
		=
		@265
		=
		@266
		=
		@267
		IF ~!IsValidForPartyDialog("Aerie")~ THEN GOTO MRStrongGroveSexHarlot2chain
		IF ~IsValidForPartyDialog("Aerie")~THEN EXTERN AERIEJ MRStrongGroveSexHarlot2achain
	END

	IF ~~ THEN BEGIN MRStrongGroveSexNo
		SAY @268
		++ @269 GOTO MRStrongGroveSexAccept
		++ @270 GOTO MRStrongGroveSexNo2
		++ @271 GOTO MRStrongGroveSexHarlot2
	END

	IF ~~ THEN BEGIN MRStrongGroveSexNo1
		SAY @272
		++ @273 GOTO MRStrongGroveSexAccept
		++ @274 GOTO MRStrongGroveSexNo2
		++ @275 GOTO MRStrongGroveSexHarlot2
	END

	IF ~~ THEN BEGIN MRStrongGroveSexNo2
		SAY @276
		=
		@277
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveSexAccept
		SAY @278
		IF ~~ THEN GOTO MRStrongGroveScore
	END

	IF ~~ THEN BEGIN MRStrongGroveSexMaybe
		SAY @279
		IF ~~ THEN GOTO MRStrongGroveScore
	END

	IF ~~ THEN BEGIN MRStrongGroveScore
		SAY @280
		IF ~~ THEN GOTO MRStrongGroveScorechain
	END

	IF ~~ THEN BEGIN MRStrongGroveScore2
		SAY @281
		=
		@282
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkDrui","GLOBAL",3)
		StartCutSceneMode() StartCutScene("Cut34a")~ EXIT
	END

	IF ~Global("MRStrongholdTalkDrui","GLOBAL",4)~ THEN BEGIN MRStrongGroveAfter
		SAY @283
	IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkDrui","GLOBAL",5) ActionOverride(Player1,SetDialog("Player1"))~ GOTO MRStrongGroveAfterExtern
	END

		IF ~~ THEN BEGIN MRStrongGroveAfterExtern
		SAY @284
		IF ~~ THEN EXTERN PLAYER1 MRStrongGroveAfter2
	END

	IF ~~ THEN BEGIN MRStrongGroveAfter3
		SAY @285
		=
		@286
		=
		@287
		++ @288 GOTO MRStrongGroveEnjoy
		++ @289 GOTO MRStrongGroveAfterNeeds
		++ @290 GOTO MRStrongGroveAfterGreat
		++ @291 GOTO MRStrongGroveAfterWhy
		++ @292 GOTO MRStrongGroveAfterIntense
		++ @293 GOTO MRStrongGroveAfterDis
		++ @294 GOTO MRStrongGroveAfterHarlot1
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterHarlot1
		SAY @295
		=
		@296
		=
		@297
		=
		@298
		IF ~~ THEN DO ~ SetGlobal("ImoenRomanceActive","GLOBAL",3)~ EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterDis
		SAY @299
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterIntense
		SAY @300
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterWhy
		SAY @301
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterGreat
		SAY @302
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterNeeds
		SAY @303
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveEnjoy
		SAY @304
		IF ~~ THEN GOTO MRStrongGroveAfterNext
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterNext
		SAY @305
		=
		@306
		=
		@307
		++ @308 GOTO MRStrongGroveAfterBugs
		++ @309 GOTO MRStrongGroveAfterBugs
		++ @310 GOTO MRStrongGroveAfterGrow
		++ @311 GOTO MRStrongGroveAfterNaughty
		++ @312 GOTO MRStrongGroveAfterLetGo
		++ @313 GOTO MRStrongGroveAfterCrass
	END

 IF ~~ THEN BEGIN MRStrongGroveAfterLetGo
 SAY @314
 = @315
 = @316
 IF ~~ THEN EXIT
 END


	IF ~~ THEN BEGIN MRStrongGroveAfterCrass
		SAY @317
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterNaughty
		SAY @318
		IF ~~ THEN GOTO MRStrongGroveAfterLast
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterGrow
		SAY @319
		IF ~~ THEN GOTO MRStrongGroveAfterLast
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterBugs
		SAY @320
		=
		@321
		++ @322 GOTO MRStrongGroveAfterBugsLast
		++ @323 GOTO MRStrongGroveAfterGrow
		++ @324 GOTO MRStrongGroveAfterNaughty
		++ @325 GOTO MRStrongGroveAfterLetGo
		++ @326 GOTO MRStrongGroveAfterCrass
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterLast
		SAY @327
		=
		@328
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongGroveAfterBugsLast
		SAY @329
 = @330
		IF ~~ THEN EXIT
	END
END

APPEND PLAYER1
	IF ~Global("MRGroveNextMorning","GLOBAL",1)~ THEN BEGIN MRStrongGroveAfter2
	SAY @331
	IF ~~ THEN EXTERN IMOEN2J MRStrongGroveAfter3
	END
END


CHAIN IMOEN2J MRStrongGroveScorechain
@332
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @333
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @334
== NALIAJ IF ~IsValidForPartyDialog("Nalia") NumInPartyGT(3)~ THEN @335
== NALIAJ IF ~IsValidForPartyDialog("Nalia") !NumInPartyGT(3)~ THEN @336
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @337
== VALYGARJ IF ~IsValidForPartyDialog("Valygar")~ THEN @338
== KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @339
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @340
END IMOEN2J MRStrongGroveScore2

APPEND AERIEJ
	IF ~~ THEN BEGIN MRStrongGroveSexHarlot2achain
	SAY @341
	IF ~~ THEN DO ~LeaveParty()
	EscapeArea()~ EXTERN IMOEN2J MRStrongGroveSexHarlot2chain
	END
END


CHAIN IMOEN2J MRStrongGroveSexHarlot2chain
@342
== NALIAJ IF ~IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Aerie")~ THEN @343
==NALIAJ IF ~IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Aerie")~ THEN @344
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @345
== VICONIJ IF ~IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Jaheira")~ THEN @346
== VICONIJ IF ~IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Jaheira")~ THEN @347
== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN @348
END PLAYER1 MRStrongGroveSexHarlot3

APPEND PLAYER1
	IF ~~ THEN BEGIN MRStrongGroveSexHarlot3
	SAY @349
	IF ~~ THEN DO ~ActionOverride("Imoen2",LeaveParty())
		ReputationInc(-2) ActionOverride(Player1,ApplySpellRES("SPMRACNE",Player1))
		ActionOverride("Imoen2",EscapeArea())~ EXIT
	END
END

CHAIN IMOEN2J MRStrongGroveSex1
@350
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")~ THEN @351
== AERIEJ IF ~IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Jaheira")~ THEN @352
== AERIEJ IF ~IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Jaheira")~ THEN @353
== NALIAJ IF ~IsValidForPartyDialog("Nalia")~ THEN @354
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @355
== VICONIJ IF ~IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Korgan")~ THEN @356
== VICONIJ IF ~IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan")~ THEN @357
END IMOEN2J MRStrongGroveSex2


/* STRONGHOLD COMMENT - PLANAR SPHERE */

APPEND IMOEN2J
	IF WEIGHT #666
	~Global("MRStrongholdTalkMage","GLOBAL",1)~ THEN BEGIN MRStrongSphere
		SAY @358
		IF ~~ THEN DO ~SetGlobal("MRStrongholdTalkMage","GLOBAL",2)~ GOTO MRStrongSphere1
	END

	IF ~~ THEN BEGIN MRStrongSphere1
		SAY @359
		++ @360 GOTO MRStrongSphereHome
		IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @361 GOTO MRStrongSphereHome
		IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY @362 GOTO MRStrongSphereHome
		++ @363 GOTO MRStrongSphereHome
		++ @364 GOTO MRStrongSphereCont
		++ @365 GOTO MRStrongSphereStrange
		++ @366 GOTO MRStrongSphereJerk
	END

	IF ~~ THEN BEGIN MRStrongSphereJerk
		SAY @367
		=
		@368
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereStrange
		SAY @369
		++ @370 GOTO MRStrongSphereCont
		++ @371 GOTO MRStrongSphereStrange1
		++ @372 GOTO MRStrongSphereStrange2
		++ @373 GOTO MRStrongSphereJerk
	END

	IF ~~ THEN BEGIN MRStrongSphereStrange1
		SAY @374
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereStrange2
		SAY @375
		=
		@376
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereHome
		SAY @377
		IF ~~ GOTO MRStrongSphereCont
	END

	IF ~~ THEN BEGIN MRStrongSphereCont
		SAY @378
		++ @379 GOTO MRStrongSphereBroken
		++ @380 GOTO MRStrongSphereJerk
		++ @381 GOTO MRStrongSphereIce
		++ @382 GOTO MRStrongSphereNothing
		IF ~CheckStatLT(Player1,7,WIS)
			CheckStatGT(Player1,16,CHR)
			CheckStatGT(Player1,14,INT)
			Alignment(Player1,CHAOTIC_NEUTRAL)~ THEN REPLY @383 GOTO MRStrongSphereEE
	END

	IF ~~ THEN BEGIN MRStrongSphereEE
		SAY @384
		= @385
		IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereNothing
		SAY @386
		IF ~~ THEN GOTO MRStrongSphereNext
	END

	IF ~~ THEN BEGIN MRStrongSphereIce
		SAY @387
		IF ~~ THEN GOTO MRStrongSphereNext
	END

	IF ~~ THEN BEGIN MRStrongSphereBroken
		SAY @388
		IF ~~ THEN GOTO MRStrongSphereNext
	END

	IF ~~ THEN BEGIN MRStrongSphereNext
		SAY @389
		=
		@390
		IF ~~ THEN DO ~SetGlobal("MRGolemOrder","GLOBAL",1)~ EXIT
	END
END

ADD_TRANS_TRIGGER OBSGOL01 8 ~OR(3)!IsGabber("Imoen2") !Global("MRGolemOrder","GLOBAL",1)~ DO 0

EXTEND_BOTTOM OBSGOL01 8
 IF ~IsValidForPartyDialog("Imoen2") IsGabber("Imoen2") Global("MRGolemOrder","GLOBAL",1)~THEN DO ~SetGlobal("MRGolemOrder","GLOBAL",2)~ EXTERN IMOEN2J MRPSMRGol
END


ADD_STATE_TRIGGER OBSGOL01 4
	~!Global("MRGolemOrder","GLOBAL",2)~
	
ADD_STATE_TRIGGER OBSGOL01 8
	~!Global("MRGolemOrder","GLOBAL",2)~

CHAIN IMOEN2J MRPSMRGol
 @391
 ==OBSGOL01 @392
 ==IMOEN2J @393
 ==OBSGOL01 @392
 ==IMOEN2J @394
 ==OBSGOL01 @395
 ==IMOEN2J @396
==OBSGOL01 @397
==OBSGOL01 @398
==IMOEN2J @399
==OBSGOL01 @397
==OBSGOL01 @400
==IMOEN2J @401
==OBSGOL01 @402
==IMOEN2J@403
EXIT

APPEND OBSGOL01
	IF ~Global("MRGolemOrder","GLOBAL",2) !IsGabber("Imoen2")~ THEN BEGIN MRGolemObey
		SAY @402
		IF ~ OR(2) !IsGabber(Player1) !IsValidForPartyDialog("Imoen2")~ THEN EXIT
		IF ~IsValidForPartyDialog("Imoen2") IsGabber(Player1)~ THEN REPLY @404 EXTERN IMOEN2J MRStrongSphereGolemTwisted
	END
	
	IF ~  Global("MRGolemOrder","GLOBAL",2)
		GlobalGT("PCSphere","GLOBAL",0)
		IsGabber("Imoen2")~ THEN BEGIN 4 // from:
		  SAY @405
		  IF ~~ THEN REPLY #59888 /* ~You can best protect me by following me.~ */ GOTO 5
		  IF ~~ THEN REPLY #59889 /* ~Stay here.~ */ GOTO 7
		  IF ~~ THEN REPLY #59890 /* ~Patrol the planar sphere, and report any problems to me.~ */ GOTO 6
		END


END

APPEND IMOEN2J
	IF ~~ THEN BEGIN MRStrongSphereGolemTwisted
		SAY @406
		++ @407 GOTO MRStrongSphereGolemRestore
		++ @408 EXIT
	END

	IF ~~ THEN BEGIN MRStrongSphereGolemRestore
		SAY @409
		= @410
		IF ~~ THEN DO ~SetGlobal("MRGolemOrder","GLOBAL",3)~ GOTO 4
	END
END




