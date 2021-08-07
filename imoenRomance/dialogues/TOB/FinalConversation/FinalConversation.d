// Final Conversation with the Solar


/*

Maximum value possible of IRTCorruptImoen = 11
Maximum value possible of IRTLoveMeter = 40 (technically infinite, but this assumes the player only looped once through the PDAs.)

Thresholds for ascension: 
	IRTLoveMeter = 31+   		 :  Imoen is madly in love and will do anything to stay with the player
	IRTLoveMeter =  12+    		 :  Imoen Romanced and in love enough and corrupted ascends as handmaiden
	IRTLoveMeter =2+            :  When Imoen is not Romanced and ascends as handmaiden
	

The flow after killing Amelisan

Solar asks Imoen what she will do with her soul
FINSOL01 7
Imoen responds and sets an important variable in one dialogue branch
if IRTImoenIsRavager=1 OR IRTImoenControlsSlayer=2 and IRTCorruptImoen > 6 and IRTLoveMeter<31 then IRTBhaalImoen=1

everything leads back to Solar asking what you will do finally with your soul
FINSOL01 5
dialogue with solar ends at
FINSOL01 27

party members will all respond up to
Imoen25j 15

Here is a split depending on multiple variables,it will lead to multiple imoen dialogues which set important variables

if ImoenRomanceActive!=2 and IRTBhaalImoen!=1 nothing is set
if ImoenRomanceActive=2 leads to the below 2 branches based on IRTImoenWarnedAboutLeaving, really just flavor text they do the same thing
if ImoenRomanceActive!=2 and IRTBhaalImoen=1 then IRTCorruptProposal=1

branch 1
if ImoenRomanceActive=2 and IRTBhaalImoen!=1 and IRTImoenWarnedAboutLeaving!=1 and IRTLoveMeter<=30 then IRTNotMadNotCorrupt=1
if ImoenRomanceActive=2 and IRTBhaalImoen=1 and IRTImoenWarnedAboutLeaving!=1 and IRTLoveMeter<=30 then IRTNotMadCorrupt=1
if ImoenRomanceActive=2 and IRTImoenWarnedAboutLeaving!=1 and IRTLoveMeter>30 then IRTMad=1

branch 2
if ImoenRomanceActive=2 and IRTBhaalImoen!=1 and IRTImoenWarnedAboutLeaving=1 and IRTLoveMeter<=30 then IRTNotMadNotCorrupt=1
if ImoenRomanceActive=2 and IRTBhaalImoen=1 and IRTImoenWarnedAboutLeaving=1 and IRTLoveMeter<=30 then IRTNotMadCorrupt=1
if ImoenRomanceActive=2 and IRTImoenWarnedAboutLeaving=1 and IRTLoveMeter>30 then IRTMad=1

From the above its important to note that if any of these variables are set it means the romance is active
IRTNotMadNotCorrupt
IRTNotMadCorrupt
IRTMad

IRTCorruptProposal is important for a rare non romance but fully corrupted imoen willing to be a handmaiden

all lead to dialogues which copy transitions from IMOEN25j 16
because originally this leads the true final branch decision
FINSOL01 28
You now choose to be god, or not (which sets old variable PlayerChoseEssence)

This leads to either of the following
FINSOL01 29 30 31

This leads to party members reacting and leading to 
IMOEN25J 18 God choice
IMOEN25J 19 noGod choice
Both have identical big transitions (and somewhat redundant playerchoseessence checks)
If romance has not been on at all (0) then it will basically have legacy transitions back to other companions
If romance has been on at all
 if IRTNotMadNotCorrupt=1 and IRTImoenWarnedAboutLeaving=1 and PlayerChoseEssence=1 then IRTEpSoloStandard
 if IRTNotMadNotCorrupt=1 and IRTImoenWarnedAboutLeaving!=1 and PlayerChoseEssence=1 then IRTEpSoloStandard
 if IRTNotMadNotCorrupt=1 and IRTImoenWarnedAboutLeaving=1 and PlayerChoseEssence!=1 then IRTEpJointStandard
 if IRTNotMadNotCorrupt=1 and IRTImoenWarnedAboutLeaving!=1 and PlayerChoseEssence!=1 then IRTEpJointStandard

 if IRTMad=1 and PlayerChoseEssence=1 then (IRTEpSoloMad=1 OR IRTEpAscendedFull=1 OR IRTEpJointMad=1) (depending what you tell im join or not or reconsider)
 if IRTMad=1 and PlayerChoseEssence=1 and evil alignment then (IRTEpSoloMad=1 OR IRTEpAscendedFull=1 OR IRTEpJointMad=1) (depending what you tell im join or not or reconsider)
 if IRTMad=1 and PlayerChoseEssence=0 then IRTEpJointMad=1

 if IRTNotMadCorrupt=1 and PlayerChoseEssence=1 then (IRTEpSoloStandard=1 OR IRTEpAscendedMaiden=1) (depending what you tell im join or not)
 if IRTNotMadCorrupt=1 and PlayerChoseEssence=1 and evil alignment then (IRTEpSoloStandard=1 OR IRTEpAscendedMaiden=1) (depending what you tell im join or not)
 if IRTNotMadCorrupt=1 and PlayerChoseEssence=0 then IRTEpJointStandard=1

 if IRTCorruptProposal=1 and PlayerChoseEssence=1 then  (IRTEpAscendedMaiden2=1 OR Aerie epilogue OR vanilla epilogue)
 if IRTCorruptProposal=1 =1 and PlayerChoseEssence=1 and evil alignment then (IRTEpAscendedMaiden2=1 OR Aerie epilogue OR vanilla epilogue)
 if IRTCorruptProposal=1 and PlayerChoseEssence=0 then vanilla epilogue
 

ALL ending dialogues end with a copy transition of Imoen2j 20 (18 used to be identical till we replaced it) which basically goes to all the other rest of people responding to your choice
which ends with epilogues.

Therefore the final variables that are important for endings from here are:

IRTEpSoloMad      //you become god but imoen remains mortal separate madly in love
IRTEpAscendedFull //you and imoen become gods madly in love
IRTEpJointMad     //you and imoen together as mortals madly in love

IRTEpSoloStandard //you and imoen mortals but separate ok love
IRTEpAscendedMaiden //you god and imoen mortal but your handmaiden ok love and corrupted her
IRTEpJointStandard //you and imoen mortals and together not madly in love

IRTEpAscendedMaiden2 //you god and imoen mortal but your handmaiden but friends and corrupted her

If none of these are set, then vanilla epilogues.

For all of these where Imoen doesn't become God or handmaiden, there are aerie variety.

For the last split heres is the tree

18 (GOD)
AA1		->	AAGod copytrans 18 (legacy)
AA2 	->	AAGod copytrans 18 (legacy)
BB1 	->	BBEnd copytrans 18 (legacy)
BB2 	-> copytrans 18 (legacy)
BB5 	->	BB1/BB2/BB3/BB4
BBEvil 	->	BB1/BB2
CC1		->	BBEnd
CC2		-> copytrans 18 (legacy)
CCEvil	->	CC1/CC2
DD1		-> copytrans 18 (legacy)
DD2		-> copytrans 18 (legacy)
DDEvil	->	DD1/DD2
Sol29a	-> copytrans 18 (legacy)
sol29b	-> copytrans 18 (legacy)

19 (Mortal)
AA3		->	AAMortal copytrans 20
AA4		->	AAMortal copytrans 20
BB3		->	BBMortal copytrans 20
BB4		->	BBMortal copytrans 20
CC4		->	CCN1 	copytrans 20
CC5		->	CCMortal copytrans 20
DD3		-> copytrans 20
Sol32a	-> copytrans 20
Sol32b	-> copytrans 20



*/

/*
Extend the exchange between Imoen and Solar:
the default choice remains at top, so if none of the below triggers the default legacy will.
Original line:
If I could have gotten rid of it voluntarily, I would have done it a long time ago. *shudder* Take it... I don't want it. I never wanted it.

note this is said mainly if your not romanced OR your IRTLoveMeter<30 why?
because really you need >30 for Imoen to even have a chance to be a god with you, so the dialogue above where she asks the solar to take her soul is actually fine.
*/
EXTEND_BOTTOM FINSOL01 7
	IF ~Global("ImoenRomanceActive","GLOBAL",2) GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN EXTERN IMOEN25J FinMad // If Imoen is madly in love
	IF ~OR(2)  Global("IRTImoenIsRavager","GLOBAL",1) Global("IRTImoenControlsSlayer","GLOBAL",2) GlobalGT("IRTCorruptImoen","GLOBAL",6) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTBhaalImoen","GLOBAL",1)~ EXTERN IMOEN25J FinCC // If Imoen is fully corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !GlobalGT("IRTLoveMeter","GLOBAL",30) !Global("IRTImoenIsRavager","GLOBAL",1) !Global("IRTImoenControlsSlayer","GLOBAL",2) GlobalGT("IRTCorruptImoen","GLOBAL",6)~ THEN EXTERN IMOEN25J FinC // If Imoen has been sort of corrupted but never embraced the taint in any way
END

CHAIN IMOEN25J FinC
	@0
	== FINSOL01 @1
	== IMOEN25J @2
END FINSOL01 8
	
CHAIN IMOEN25J FinCC
	@3
	== FINSOL01 @4
	== IMOEN25J IF ~Global("IRTImoenControlsSlayer","GLOBAL",2)~ THEN @5
	== IMOEN25J IF ~Global("IRTImoenIsRavager","GLOBAL",1)~ THEN @6
	== FINSOL01 @7
	= @8 
	== IMOEN25J @9
	== FINSOL01 @10
END FINSOL01 5

CHAIN IMOEN25J FinMad
	@0
	== FINSOL01 @1
	== IMOEN25J @11
	= @12
	== FINSOL01 @13
	== IMOEN25J @14
	== FINSOL01 @10
END FINSOL01 5


////////////////////////////////////

//REPLACE finsol01.dlg 27 final solar talk transition to imoen25j 15
REPLACE IMOEN25J
	IF ~~ THEN BEGIN 15
		SAY @18
		IF ~!Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTBhaalImoen","GLOBAL",1)~ THEN GOTO FDOld15
		IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ THEN GOTO FDWarned // Imoen was warned about the player probably leaving
		IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ THEN GOTO FDUnwarned // Imoen wasn't warned
		IF ~!Global("ImoenRomanceActive","GLOBAL",2) Global("IRTBhaalImoen","GLOBAL",1)~ THEN DO ~SetGlobal("IRTCorruptProposal","GLOBAL",1) ~ GOTO FDCorrupt // Imoen isn't romanced but the player corrupted her
	END
END

APPEND IMOEN25J
IF ~~ THEN 15IRA3
	SAY @15
	= @16
	COPY_TRANS IMOEN25J 16
END

IF ~~ THEN 15IRA3F
	SAY @17
	COPY_TRANS IMOEN25J 16
END
END

//holy shit is this line number gonna be the same in vanilla and EE? <_<
APPEND IMOEN25J
IF ~~ THEN BEGIN FDOld15 // from:
  SAY #67917 /* ~So... it's finally come down to this, has it? After all we've been through, right from Candlekeep and Baldur's Gate, through Irenicus and Bodhi and their plans... I wonder what Gorion would say now?~ [IMOE2527] */
  //SAY @200
  IF ~~ THEN GOTO 16 //old 15 transition
   	IF ~Global("ImoenRomanceActive","GLOBAL",3) !Global("IRTNeverForgive","GLOBAL",1)~ THEN GOTO 15IRA3
	IF ~Global("ImoenRomanceActive","GLOBAL",3) Global("IRTNeverForgive","GLOBAL",1)~ THEN GOTO 15IRA3F
END

IF ~~ THEN FDWarned
	SAY @19
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTBhaalImoen","GLOBAL",1) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadNotCorrupt","GLOBAL",1)~ GOTO FDW1 // Imoen was warned and she's not MADLY in love with the player and she's not corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTBhaalImoen","GLOBAL",1) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadCorrupt","GLOBAL",1)~ GOTO FDW2 // Imoen was warned and she's not MADLY in love with the player and she IS corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTMad","GLOBAL",1)~ GOTO FDW3 // Imoen was warned and she is MADLY in love with the player
END

IF ~~ THEN FDW1
	SAY @20
	= @21
	COPY_TRANS imoen25j 16
END

IF ~~ THEN FDW2
	SAY @22
	IF ~~ THEN EXTERN FINSOL01 FinChain2
END
END
	
CHAIN FINSOL01 FinChain2
	@23
   = @24
	= @25
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @26
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @27
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @28 DO ~SetGlobal("IRTNotMadCorrupt","GLOBAL",0) SetGlobal("IRTNotMadNotCorrupt","GLOBAL",1)~
	== IMOEN25J IF ~GlobalGT("IRTLoveMeter","GLOBAL",12)~ THEN @29
	== FINSOL01 @30
END 
	COPY_TRANS imoen25j 16
	
CHAIN IMOEN25J FDW3
	@31
	== FINSOL01 @23
   = @32
	= @33
	== IMOEN25J @34
END
	COPY_TRANS imoen25j 16


APPEND IMOEN25J
IF ~~ THEN FDUnwarned
	SAY @35
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTBhaalImoen","GLOBAL",1) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadNotCorrupt","GLOBAL",1)~ GOTO FDUnW1 // Imoen wasn't warned and she's not MADLY in love with the player and she's not corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) Global("IRTBhaalImoen","GLOBAL",1) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) !GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTNotMadCorrupt","GLOBAL",1)~ GOTO FDUnW2 // Imoen wasn't warned and she's not MADLY in love with the player and she IS corrupted
	IF ~Global("ImoenRomanceActive","GLOBAL",2) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) GlobalGT("IRTLoveMeter","GLOBAL",30)~ THEN DO ~SetGlobal("IRTMad","GLOBAL",1)~ GOTO FDUnW3 // Imoen wasn't warned and she is MADLY in love with the player
END

IF ~~ THEN FDUnW1
	SAY @36
	= @37
	COPY_TRANS imoen25j 16

END

IF ~~ THEN FDUnW2
	SAY @38
	IF ~~ THEN EXTERN FINSOL01 FinChain2
END
END

CHAIN IMOEN25J FDUnW3
	@39
	== FINSOL01 @23
   = @32
	= @33
	== IMOEN25J @40
END
	COPY_TRANS imoen25j 16

CHAIN IMOEN25J FDCorrupt
	@68
	== AERIE25J IF ~InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @69
	== IMOEN25J IF ~InParty("Aerie") GlobalGT("IRTAerImFriend","GLOBAL",0)~ THEN @70
	= @71
	== FINSOL01 @23
   = @72
	= @73
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @26
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @74
	== IMOEN25J IF ~!GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @75 DO ~SetGlobal("IRTCorruptProposal","GLOBAL",0)~
	== IMOEN25J IF ~GlobalGT("IRTLoveMeter","GLOBAL",2)~ THEN @76
	== FINSOL01 @30
END
	COPY_TRANS imoen25j 16



// Main decision super branch



/*
Default choices:
IF ~GlobalLT("PPEvilChoices","GLOBAL",2)~ THEN REPLY ~I will retain the essence of Bhaal that is my right and become a power of the planes.~ DO ~SetGlobal("PlayerChoseEssence","GLOBAL",1)~ GOTO 31
IF ~GlobalGT("PPEvilChoices","GLOBAL",1) GlobalLT("PPEvilChoices","GLOBAL",4)~ THEN REPLY ~I will retain the essence of Bhaal that is my right and become a power of the planes.~ DO ~SetGlobal("PlayerChoseEssence","GLOBAL",1)~ GOTO 30
IF ~GlobalGT("PPEvilChoices","GLOBAL",3) GlobalLT("PPEvilChoices","GLOBAL",6)~ THEN REPLY ~I will retain the essence of Bhaal that is my right and become a power of the planes.~ DO ~SetGlobal("PlayerChoseEssence","GLOBAL",1)~ GOTO 29
IF ~~ THEN REPLY ~I do not want the essence of Bhaal. Do what you will with it... I want to remain mortal.~ GOTO 32
*/

APPEND IMOEN25J
	IF ~~ THEN BEGIN FDOld18 // God Choice
	  SAY #68088 /* ~Good luck, <CHARNAME>. I'll miss ya... although somehow I just know we'll see each other again. Maybe I'll getcha out of trouble again... ya never know!~ [IMOE2526] */
	  COPY_TRANS imoen25j 18 //IMPORTANT this copies the OLD transition of 18 which was transitioning to other party members reacting from FINSOL01 29 30 or 31, then 18 will be fully replaced below
	END

	IF ~~ THEN BEGIN FDOld19 // Mortal Choice
	  SAY #68091 /* ~So you're going to stay a mortal? Wow, after all that, we're going to end up on the road again! Must feel good, though, to have your own future ahead of you again, though. No?~ [IMOE2525] */
	  IF ~~ THEN GOTO 20
	END
END


//replaces the transition from finsol01 29 30 31 32 to imoen25j 18 & 19
REPLACE IMOEN25J
	IF ~~ THEN 18
	   SAY @77
	// Imoen not romanced, not corrupt (Vanilla responses - since priority is given from bottom to top, these will only be followed if none of the stuff below is met)
		IF ~Global("PlayerChoseEssence","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",0)~ GOTO FDOld18
		

	// Imoen romanced but not madly in love, not corrupt
		IF ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO AA1 
		IF ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO AA2
		
	// Imoen madly in love | Let's just make something new
		IF ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) ~ THEN REPLY @78 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ GOTO BB1 //tell imoen to stay
		IF ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @79 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ GOTO BB2 //tell imoen to come
		+ ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,LAWFUL_EVIL)~ + @80 GOTO BBEvil 
	   + ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,NEUTRAL_EVIL)~ + @81 GOTO BBEvil 
	   + ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,CHAOTIC_EVIL)~ + @82 GOTO BBEvil
		IF ~Global("IRTMad","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @83 + BB5

	// Imoen not mad in love, corrupt
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~  THEN REPLY @78 DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO CC1 
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~  THEN  REPLY @84 DO ~SetGlobal("IRTEpAscendedMaiden","GLOBAL",1)~ GOTO CC2 


		+ ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,LAWFUL_EVIL)~ + @80 GOTO CCEvil
		+ ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,NEUTRAL_EVIL)~ + @81 GOTO CCEvil
		+ ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,CHAOTIC_EVIL)~ + @82 GOTO CCEvil

	// Imoen not romanced, corrupt

		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @78 GOTO DD1 // Non-mod epilogue displays (or Aerie friendship if applicable)
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1)~ THEN REPLY @87 DO ~SetGlobal("IRTEpAscendedMaiden2","GLOBAL",1)~ GOTO DD2
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,LAWFUL_EVIL)~ THEN REPLY @80 GOTO DDEvil
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,NEUTRAL_EVIL)~ THEN REPLY @81 GOTO DDEvil
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",1) Alignment(Player1,CHAOTIC_EVIL)~ THEN REPLY @82 GOTO DDEvil

		//vanilla choices
		    //ascended
		IF ~!Global("IRTCorruptProposal","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",3) Global("PlayerChoseEssence","GLOBAL",1)~ THEN GOTO Sol29a
		IF ~!Global("IRTCorruptProposal","GLOBAL",1) !Global("ImoenRomanceActive","GLOBAL",2) !Global("ImoenRomanceActive","GLOBAL",3) Global("PlayerChoseEssence","GLOBAL",1)~ THEN GOTO Sol29b
	END
END

REPLACE IMOEN25J
	IF ~~ THEN 19
	   SAY @77
	// Imoen not romanced, not corrupt (Vanilla responses - since priority is given from bottom to top, these will only be followed if none of the stuff below is met)
		IF ~Global("PlayerChoseEssence","GLOBAL",0) Global("ImoenRomanceActive","GLOBAL",0)~ GOTO FDOld19

	// Imoen romanced but not madly in love, not corrupt
		IF ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~ GOTO AA3 
		IF ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("IRTNotMadNotCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~ GOTO AA4 
		
	// Imoen madly in love | Let's just make something new
		IF ~Global("IRTMad","GLOBAL",1) Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ GOTO BB3 
		IF ~Global("IRTMad","GLOBAL",1) !Global("IRTImoenWarnedAboutLeaving","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~  THEN DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ GOTO BB4 

	// Imoen not mad in love, corrupt
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN REPLY @85 DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~  GOTO CC5
		IF ~Global("IRTNotMadCorrupt","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~  THEN REPLY @86 DO ~SetGlobal("IRTEpJointStandard","GLOBAL",1)~  GOTO CC4 

	// Imoen not romanced, corrupt
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN REPLY @88 GOTO DD3 // Non-mod epilogue displays (or Aerie friendship if applicable)
		IF ~Global("IRTCorruptProposal","GLOBAL",1) Global("PlayerChoseEssence","GLOBAL",0)~ THEN REPLY @86 GOTO CC4 // Non-mod epilogue displays (or Aerie friendship if applicable)
		//vanilla choices
		//mortal
		IF ~!Global("IRTCorruptProposal","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",3) Global("PlayerChoseEssence","GLOBAL",0)~ THEN GOTO Sol32a
		IF ~!Global("IRTCorruptProposal","GLOBAL",1) !Global("ImoenRomanceActive","GLOBAL",2) !Global("ImoenRomanceActive","GLOBAL",3) Global("PlayerChoseEssence","GLOBAL",0)~ THEN GOTO Sol32b
	END
END

APPEND IMOEN25J

IF ~~ THEN AA1
	SAY @89
	IF ~~ THEN GOTO AAGod
END

IF ~~ THEN AA2
	SAY @90
	IF ~~ THEN GOTO AAGod
	IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN GOTO AAMarry	
END

IF ~~ THEN AAMarry
	SAY @91
	IF ~~ THEN GOTO AAGod
END

IF ~~ THEN AAGod
	SAY @92
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN AA3
	SAY @93
	IF ~~ THEN GOTO AAMortal
END

IF ~~ THEN AA4
	SAY @94
	IF ~~ THEN GOTO AAMortal
END

IF ~~ THEN AAMortal
	SAY @95
	IF ~!Global("IRTWantsMarriage","GLOBAL",1)~ THEN GOTO AAMarryStay1
	IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN GOTO AAMarryStay2
END

IF ~~ THEN AAMarryStay1
	SAY @96
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN AAMarryStay2
	SAY @96
	=@97
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN BB1
	SAY @98
	= @99
	++ @100 + BB1a
	++ @101 + BB1a
	++ @102 DO ~IncrementGlobal("IRTLoveMeter","GLOBAL",-10)~ + BB1b
	++ @103 + BB1c
	++ @104 + BB1b
END

IF ~~ THEN BB1a
	SAY @105
	= @106
	= @107
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN BB1End
	SAY @108
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN BB1b
	SAY @109
	= @110
	= @111
	= @112
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN BB1c
	SAY @113
	= @114
	= @107
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN BB2
	SAY @115
	= @116
	COPY_TRANS IMOEN25J 18
END
END

APPEND FINSOL01
IF ~~ THEN 29R
	SAY @117
	IF ~~ THEN GOTO 33
END
	
IF ~~ THEN 30R
	SAY @118
	IF ~~ THEN GOTO 33
END

IF ~~ THEN 31R
	SAY @119
	IF ~~ THEN GOTO 33
END
END

APPEND IMOEN25J
IF ~~ THEN BB3
	SAY @93
	IF ~~ THEN GOTO BBMortal
END

IF ~~ THEN BB4
	SAY @120
	IF ~~ THEN GOTO BBMortal
END
END

CHAIN IMOEN25J BBMortal
	@121
	== IMOEN25J IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN @122
	== IMOEN25J IF ~!Global("IRTWantsMarriage","GLOBAL",1)~ THEN @123
	== IMOEN25J @124
END
  COPY_TRANS IMOEN25J 20

APPEND IMOEN25J
IF ~~ THEN BB5
	SAY @125
	++ @126 + BB5a
	++ @127 + BB5a
	++ @128 + BB5b
	++ @129 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ + BB1
	++ @130 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ + BB2
	+ ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB3
	+ ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB4
END

IF ~~ THEN BB5a
	SAY @132
	= @133
	= @134
	= @135
	IF ~~ THEN GOTO BB5End
END

IF ~~ THEN BB5b
	SAY @136
	IF ~~ THEN GOTO BB5End
END

IF ~~ THEN BB5End
	SAY @137
	++ @129 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ + BB1
	++ @130 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ + BB2
	+ ~Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB3
	+ ~!Global("IRTImoenWarnedAboutLeaving","GLOBAL",1)~ + @131 DO ~SetGlobal("IRTEpJointMad","GLOBAL",1)~ + BB4
END	

IF ~~ THEN BBEvil
	SAY @138
	= @139
	= @140
	= @141
	= @142
	++ @143 DO ~SetGlobal("IRTEpSoloMad","GLOBAL",1)~ GOTO BB1
	++ @144 DO ~SetGlobal("IRTEpAscendedFull","GLOBAL",1)~ GOTO BB2



END

IF ~~ THEN CC1
	SAY @145
	= @146
	++ @100 + BB1a
	++ @101 + BB1a
	++ @102 + CC1b
	++ @103 + BB1c
	++ @104 + CC1b
END

IF ~~ THEN CC1b
	SAY @109
	= @147
	= @148
	= @111
	= @112
	IF ~~ THEN GOTO BB1End
END

IF ~~ THEN CC2
	SAY @149
	= @150
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN CC4
	SAY @152
	IF ~~ THEN GOTO CCNuts
END 

IF ~~ THEN CCNuts
	SAY @153
	++ @154 + CCN1
	++ @155 + CCN1
	++ @156 + CCN2
END

IF ~~ THEN CCN1
	SAY @157
	= @158 
	= @159
	= @160
	= @161
	= @162
	COPY_TRANS IMOEN25J 20
END
	
IF ~~ THEN CCN2
	SAY @163
	IF ~~ THEN GOTO CCN1
END
	
IF ~~ THEN CC5
	SAY @164

	IF ~~ THEN GOTO CCMortal
END

END

CHAIN IMOEN25J CCMortal
	@166
	== IMOEN25J IF ~Global("IRTWantsMarriage","GLOBAL",1)~ THEN @167
	== IMOEN25J IF ~!Global("IRTWantsMarriage","GLOBAL",1)~ THEN @168
	== IMOEN25J @162
COPY_TRANS IMOEN25J 20

APPEND IMOEN25J
IF ~~ THEN CCEvil
	SAY @138
	= @169
	= @170
	= @171
	= @172
	++ @143 DO ~SetGlobal("IRTEpSoloStandard","GLOBAL",1)~ GOTO CC1
	++ @173 DO ~SetGlobal("IRTEpAscendedMaiden","GLOBAL",1)~ GOTO CC2
END

IF ~~ THEN DD1
	SAY @174
	= @175
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN DD2
	SAY @176
	= @177
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN DD3
	SAY @178
	= @179
	= @162
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN DDEvil
	SAY @138
	= @180
	= @181
	= @182
	++ @183 GOTO DD1 // Non-mod epilogue displays (or Aerie friendship if applicable)
	++ @184 DO ~SetGlobal("IRTEpAscendedMaiden2","GLOBAL",1)~ GOTO DD2

END
END

//dialogue path if not romanced and you make vanilla solar choices

APPEND IMOEN25J
   
IF ~~ THEN Sol32a
	SAY @185
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN Sol32b
	SAY @186
	= @187
	COPY_TRANS IMOEN25J 20
END

IF ~~ THEN Sol29a
	SAY @188
	COPY_TRANS IMOEN25J 18
END

IF ~~ THEN Sol29b
	SAY @189
	COPY_TRANS IMOEN25J 18
END

END