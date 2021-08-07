// *** Imoen's Torture ***

// PID option:
//available after the second talk about Imoen's taint. Available to both romanced and friendly.

// + ~Global("IRTTortureTalk","GLOBAL",1)~ + ~It has been a while since we left Spellhold behind. Do the memories still haunt you, with everything that's happening now?~ DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1) SetGlobal("IRTTortureTalk","GLOBAL",2)~ + T1

CHAIN IMOEN25J T1
	@0
	= @1
	= @2
	== IMOEN25J IF ~!Global("IRTJustJoined","GLOBAL",3)~ THEN @3
	== IMOEN25J IF ~Global("IRTJustJoined","GLOBAL",3)~ THEN @4
	== IMOEN25J IF ~Global("ImoenRomanceActive","GLOBAL",2)~ THEN @5
	== IMOEN25J IF ~!Global("ImoenRomanceActive","GLOBAL",2)~ THEN @6
	== IMOEN25J IF ~GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @7
	== AERIE25J IF ~IsValidForPartyDialog("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @8
	== IMOEN25J IF ~IsValidForPartyDialog("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @9
	== IMOEN25J @10
	= @11
END
   ++ @12 + T5
   + ~Global("ImoenRomanceActive","GLOBAL",2)~ + @13 + T4
   ++ @14 + T3
   ++ @15 + T2
   ++ @16 + T2

APPEND IMOEN25J
IF ~~ T2
   SAY @17
   IF ~~ THEN EXIT
END

IF ~~ T3
   SAY @18
   IF ~~ THEN GOTO TDr
END

IF ~~ T4
   SAY @19
   = @20
   IF ~~ THEN GOTO TDr
END

IF ~~ T5
   SAY @21
   IF ~~ THEN GOTO TDr
END

IF ~~ TDr
   SAY @22
   ++ @23 + TDrEx
   ++ @24 + TDr5
   ++ @25 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @26 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @27 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @28 + TDr1
END

IF ~~ TDr1
   SAY @29
   IF ~~ THEN GOTO T2
END

IF ~~ TDr2
   SAY @30
   = @31
   IF ~~ THEN EXIT
END

IF ~~ TDr3
   SAY @32
   = @33
   = @34
   IF ~~ THEN GOTO TDrEnd
END

IF ~~ TDrEnd
   SAY @35
   IF ~~ THEN GOTO T2
END

IF ~~ TDr4
   SAY @36
   = @37
   IF ~~ THEN GOTO TDrEnd
END

IF ~~ TDr5
   SAY @38
   = @39
   ++ @40 + TDrEx
   ++ @25 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @26 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @27 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @28 + TDr1
END

IF ~~ TDrEx
   SAY @41
   IF ~RandomNum(5,1)~ THEN GOTO TDrExKhalid
   IF ~RandomNum(5,2)~ THEN GOTO TDrExVat
   IF ~RandomNum(5,3)~ THEN GOTO TDrExCycles
   IF ~RandomNum(5,4)~ THEN GOTO TDrExBodhi
   IF ~RandomNum(5,5)~ THEN GOTO TDrExKnives
END

IF ~~ TDrExKhalid
   SAY @42
   = @43
	= @44
	= @45
	= @46
	= @47
	= @48
	= @49
	= @50
   IF ~~ THEN GOTO TDrLast
END



IF ~~ TDrExVat
   SAY @51
   = @52
	= @53
	= @54

	= @55
	= @56
	= @57
	= @58
	= @59
   IF ~~ THEN GOTO TDrLast
END

IF ~~ TDrExCycles
   SAY @60
   = @61

	= @62
	= @63
	= @64
	= @65
	= @66

	= @67
	= @68
	= @69
	= @70
   IF ~~ THEN GOTO TDrLast
END

IF ~~ TDrExBodhi
   SAY @71

   = @72
	= @73
	= @74
	= @75

	= @76

	= @77
	= @78
	= @79
	= @80
	= @81
	= @82
	= @83
  IF ~~ THEN GOTO TDrLast
END


IF ~~ TDrExKnives
   SAY @84

   = @85
	= @86
	= @87
	= @88

	= @89
	= @90
	= @91
	= @83
   IF ~~ THEN GOTO TDrLast
END


IF WEIGHT #400 ~~ TDrLast
  SAY @92
	= @93
   IF ~~ THEN GOTO TDrLastN
END

IF ~~ THEN TDrLastN
   SAY @94
   ++ @95 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",1)~ + TDrReally
   ++ @96 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @97 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @98 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @99 + TDr1
END

IF ~~ TDrReally
   SAY @100
   = @101
   ++ @102 + TDrR5
   + ~Global("ImoenRomanceActive","GLOBAL",2)~ + @103 + TDrR4Romanced
   + ~!Global("ImoenRomanceActive","GLOBAL",2)~ + @103 + TDrR4Friend
   ++ @104 + TDrR3
   ++ @105 + TDrR2
   ++ @106 + TDrR1
END

IF ~~ TDrR1
   SAY @107
   =@108
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR2
   SAY @109
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR3
   SAY @110
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR4Romanced
   SAY @111
   = @112
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR4Friend
   SAY @113
   = @114
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrR5
   SAY @115
   IF ~~ THEN GOTO TDrTaint
END

IF ~~ TDrTaint
   SAY @116
   ++ @117 + TDr0
   ++ @118 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",-1) IncrementGlobal("IRTFightTaint","GLOBAL",1)~ + TDr4
   ++ @119 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTControlTaint","GLOBAL",1)~ + TDr3
   ++ @27 DO ~IncrementGlobal("IRTCorruptImoen","GLOBAL",1) IncrementGlobal("IRTEmbraceTaint","GLOBAL",1)~ + TDr2
   ++ @28 + TDr1
END

IF ~~ TDr0
   SAY @120
   = @121
   IF ~~ THEN EXIT
END
END