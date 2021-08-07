/*Irenicus dungeon first talk */
APPEND IMOENJ

	IF ~Global("MRLeaveDungeon","GLOBAL",2)~ THEN BEGIN MRLeaveDungeon
	 SAY @93 
	 IF ~~ THEN REPLY @94 DO ~SetGlobal("MRLeaveDungeon","GLOBAL",3)~ GOTO MRLeaveDungeonNext
	 IF ~~ THEN REPLY @95 DO ~SetGlobal("MRLeaveDungeon","GLOBAL",3)~ GOTO MRLeaveDungeonNext
	 ++ @96 DO ~SetGlobal("MRLeaveDungeon","GLOBAL",3)~ + MRLeaveDungeonQuiet
        END
        
        IF ~~ THEN BEGIN MRLeaveDungeonQuiet
           SAY @97
           IF ~~ THEN EXIT
        END

	IF ~~ THEN BEGIN MRLeaveDungeonNext
	 SAY @98
	 IF ~~ THEN REPLY @99 GOTO MRLeaveDungeonAche
	 IF ~IfValidForPartyDialogue("Jaheira")~ THEN REPLY @100 GOTO MRLeaveDungeonAche
	 IF ~~ THEN REPLY @101 GOTO MRLeaveDungeonHug
	 IF ~~ THEN REPLY @102 GOTO MRLeaveDungeonSilence
	END

	IF ~~ THEN BEGIN MRLeaveDungeonHug
	 SAY @103
	 IF ~~ THEN GOTO MRLeaveDungeonHug2
	END

	IF ~~ THEN BEGIN MRLeaveDungeonHug2
	 SAY @104
	 IF ~~ THEN REPLY @105 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @106 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @107 GOTO MRLeaveDungeonDeath
	 IF ~~ THEN REPLY @102 GOTO MRLeaveDungeonSilence
	END

	IF ~~ THEN BEGIN MRLeaveDungeonAche
	 SAY @108
	 IF ~~ THEN REPLY @105 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @106 GOTO MRLeaveDungeonClose
	 IF ~~ THEN REPLY @107 GOTO MRLeaveDungeonDeath
	 IF ~~ THEN REPLY @102 GOTO MRLeaveDungeonSilence
	END

	IF ~~ THEN BEGIN MRLeaveDungeonClose
	 SAY @109
         = @110
         IF ~~ THEN REPLY @111 GOTO MRLeaveDungeonPromise
	 IF ~~ THEN REPLY @112 GOTO MRLeaveDungeonSplit
	 IF ~~ THEN REPLY @113 GOTO MRLeaveDungeonSilence
	 IF ~~ THEN REPLY @114 GOTO MRLeaveDungeonBurden
	END

	IF ~~ THEN BEGIN MRLeaveDungeonPromise
	 SAY @115
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonSilence
	 SAY @116
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonSplit
	 SAY @117
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonDeath
	 SAY @118
         = @119
	 IF ~~ THEN GOTO MRLeaveDungeonDeath2
	END

	IF ~~ THEN BEGIN MRLeaveDungeonDeath2
	 SAY @120
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeonBurden
	 SAY @121
	 IF ~~ THEN EXIT
	END



	 /* second talk */

	IF ~Global("MRAtExit","GLOBAL",1)~ THEN BEGIN MRLeaveDungeon2
	 SAY @122
	 IF ~~ THEN DO ~SetGlobal("MRAtExit","GLOBAL",2) ActionOverride("TALKERMR",DestroySelf())~ GOTO MRLeaveDungeon2next
	END

	IF ~~ THEN BEGIN MRLeaveDungeon2next
	 SAY @123
	 = @124
	 IF ~~ THEN REPLY @125 GOTO MRLeaveDungeon2Anger
	 IF ~~ THEN REPLY @126 GOTO MRLeaveDungeon2Leave
	 IF ~~ THEN REPLY @127 GOTO MRLeaveDungeon2Revenge
	END


	IF ~~ THEN BEGIN MRLeaveDungeon2Anger
	 SAY @128
	 = @129
	 = @130
	 IF ~~THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeon2Leave
	 SAY @131
	 =@132
	 IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN MRLeaveDungeon2Revenge
	 SAY @133
	 = @134
	 IF ~~ THEN EXIT
	END
END