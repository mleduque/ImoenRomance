// Brief Public Displays of Affection
// You get to pick from a set of three every ten real minutes.


APPEND IMOEN25J

// PDA0

IF ~~ THEN PDA0-1
	SAY @0
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA0-2
	SAY @1
	= @2
	++ @3 GOTO PDA0-2d
	++ @4 GOTO PDA0-2c
	++ @5 GOTO PDA0-2b
	++ @6 GOTO PDA0-2a
END

IF ~~ THEN PDA0-2a
	SAY @7
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA0-2b
	SAY @8
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA0-2c
	SAY @9
	= @10
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA0-2d
	SAY @11
	= @12
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA0-3
	SAY @13
	IF ~~ THEN EXIT
END

// PDA1

IF ~~ THEN PDA1-1
	SAY @14
	= @15
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA1-2
	SAY @16
	= @17
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA1-3
	SAY @18
	= @19
	IF ~~ THEN EXIT
END

/// PDA2

IF ~~ THEN PDA2-1
	SAY @20
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA2-2
	SAY @21
	= @22
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA2-3
	SAY @23
	= @24
	IF ~~ THEN EXIT
END

// PDA3

IF ~~ THEN PDA3-1
	SAY @25
	= @26
IF ~~ THEN EXIT
END

IF ~~ THEN PDA3-2
SAY @27
	++ @28 + PDA3-2a
	++ @29 + PDA3-2b
	++ @30 + PDA3-2c
	++ @31 + PDA3-2d
END

IF ~~ THEN PDA3-2a
	SAY @32
	= @33
	IF ~~ THEN EXIT
END
	
IF ~~ THEN PDA3-2b
	SAY @34
	= @35
	= @36
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA3-2c
	SAY @37
	= @38
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA3-2d
	SAY @39
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA3-3
	SAY @40
	IF ~~ THEN EXIT
END

// PDA4

IF ~~ THEN PDA4-1
  SAY @41
  IF ~~ THEN EXIT
END

IF ~~ THEN PDA4-2
  SAY @42
  = @43
  IF ~~ THEN EXIT
END

IF ~~ THEN PDA4-3
  SAY @44
  IF ~~ THEN EXIT
END

// PDA5

IF ~~ THEN PDA5-1
	SAY @45
	= @46
	= @47
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA5-2
	SAY @48
	= @49
	= @50
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA5-3
	SAY @51
	= @52
	IF ~~ THEN EXIT
END

// PDA6

IF ~~ THEN PDA6-1
	SAY @53
	= @54
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA6-2
	SAY @55
	= @56
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA6-3
	SAY @57
	= @58
  IF ~~ THEN EXIT
END

// PDA7

IF ~~ THEN PDA7-1
  SAY @59
  IF ~~ THEN EXIT
END

IF ~~ THEN PDA7-2
  SAY @60
  IF ~~ THEN EXIT
END

IF ~~ THEN PDA7-3
	SAY @61
	= @62
	IF ~~ THEN EXIT
END

// PDA8

IF ~~ THEN PDA8-1
	SAY @63
	= @64
	= @65
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA8-2
  SAY @66
  = @67
  IF ~~ THEN EXIT
END

IF ~~ THEN PDA8-3
	SAY @68
	= @69
	= @70
	IF ~~ THEN EXIT
END

// PDA9

IF ~~ THEN PDA9-1
	SAY @71
	= @72
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA9-2
	SAY @73
	= @74
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA9-3
  SAY @75
  IF ~~ THEN EXIT
END

// PDA10

IF ~~ THEN PDA10-1
	SAY @76
	++ @77 + PDA10-1a
	++ @78 + PDA10-1b
	++ @79 + PDA10-1b
	++ @80 + PDA10-1c
	++ @81 + PDA10-1d
	++ @82 + PDA10-1e
END

IF ~~ THEN PDA10-1a
  SAY @83
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PDA10-1b
  SAY @84
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PDA10-1c
  SAY @85
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PDA10-1d
	SAY @86
	= @87
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PDA10-1e
	SAY @88
	= @89
	IF ~~ THEN DO ~RunAwayFrom(Player1,30)~ EXIT
END

IF ~~ THEN PDA10-2
	SAY @90
	= @91
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA10-3
  SAY @92
  = @93
  IF ~~ THEN DO ~RunAwayFrom(Player1,20)~ EXIT
END

// PDA11

IF ~~ THEN PDA11-1
  SAY @94
  = @95
  IF ~~ THEN EXIT
END

IF ~~ THEN PDA11-2
	SAY @96
	= @97
	= @98
	IF ~~ THEN EXIT
END
END

CHAIN IMOEN25J PDA11-3
@99
== IMOEN25J IF ~GlobalGT("IRTLoveMeter","GLOBAL",10)~ THEN @100
== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",10)~ THEN @101
== IMOEN25J @102
EXIT

// PDA12

APPEND IMOEN25J
IF ~~ THEN PDA12-1
	SAY @103
	= @104
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA12-2
  SAY @105
  IF ~~ THEN EXIT
END

IF ~~ THEN PDA12-3
  SAY @106  
  IF ~~ THEN EXIT
END

// PDA13

IF ~~ THEN PDA13-1
	SAY @107
	++ @108 + PDA13-1a
	++ @109 + PDA13-1b
	++ @110 + PDA13-1c
	++ @111 + PDA13-1b3
	++ @112 + PDA13-1d
END

IF ~~ THEN PDA13-1a  
	SAY @113
	++ @109 + PDA13-1b
	++ @110 + PDA13-1c
	++ @111 + PDA13-1b3
	++ @114 + PDA13-1b2
	++ @112 + PDA13-1d
END
	
IF ~~ THEN PDA13-1b
	SAY @115
	++ @116 + PDA13-1b1
	++ @114 + PDA13-1b2
	++ @117 + PDA13-1b3
	++ @118 + PDA13-1b4
END

IF ~~ THEN PDA13-1b1
	SAY @119
	= @120
	= @121
	= @122
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA13-1b2
	SAY @123
	= @124
	= @125
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA13-1b3
	SAY @126
	= @127
	= @128
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA13-1b4
	SAY @129
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA13-1c
	SAY @130
	= @131
	IF ~~ THEN EXIT
END

IF ~~ THEN PDA13-1d
	SAY @132
	= @133
	= @134
	IF ~~ THEN EXIT
END
END
