Before learning about Galactic Conquest, you should understand how Interface Screens work to some degree. Please read shell_reference first.

Galactic Conquest is entirely controlled by interface screens. Campaign works the same way, but instead of "ifs_freeform..." it's files are "ifs_campaign...".
Since we have all the files, we can change how galactic conquest works.

This is the order of interface screens you would typically have in Galactic Conquest

ifs_sp_gc_main <-- choose galactic conquest from main menu
ifs_freeform_main <-- enter game
ifs_freeform_fleet <-- show move, select fleet buttons. move fleet
ifs_freeform_battle <-- if you moved to enemy planet, you enter this screen
ifs_freeform_battle_mode <-- choose mode (not used, it pretty much skips through. but it would allow us to pick CTF or Hunt as the battle mode if we wanted)
ifs_freeform_battle_card <-- enemy choose bonus
ifs_freeform_battle_card <-- player choose bonus -- then enter the mission (battle)
ifs_freeform_main < -- return to galactic conquest afer battle
ifs_freeform_result <-- show result
ifs_freeform_load <-- ask to save
ifs_freeform_summary <-- show turn summary
ifs_freeform_main <-- enemy turn
ifs_freeform_ai <-- ai completes move (they didn't end up attacking this round, thus no ifs_freeform_battle)
ifs_freeform_summary
ifs_freeform_main <-- back to player turn
ifs_freeform_fleet

(please note that this is not the screen stack, at the end of every turn, the stack is cleared with a call to ScriptCB_PopScreen("ifs_freeform_main"))

The tabs at the top of the screen correspond to these screens

Move: ifs_freeform_fleet
Bonus: ifs_freeform_purchase_tech
Units: ifs_freeform_purchase_unit

starting the Galactic Conquest

When you start the Galactic Conquest from the menu, for example "Republic Sovereignity" you actually call the function ifs_freeform_start_rep(ifs_freeform_main).
This applies the presets for that scenario onto the galactic conquest game (ifs_freeform_main). It sets which planets belong to which team, and where the fleets go.
Also it sets which players are on which team. ifs_freeform_start_rep calls ifs_freeform_init_cw,
which sets up more detailed things for the clone wars era, like which mission script goes for each planet. By the way, this is where you would add a CTF mode for a planet if you wanted.
ifs_freeform_init_cw calls ifs_freeform_init_common. This sets up very general things, like handling each controller.
After applying all these to ifs_freeform_main, the game is loaded and we are pushed to the ifs_freeform_main screen.

When you load an old save, this ifs_freeform_start_rep (or cis.. etc) function also called during loading.
If you wanted to contain your changes just to your new GC campaign, you would put all the ScriptCB_DoFile calls in this start function.


ifs_freeform_main

The most important screen is ifs_freeform_main. It loads all the objects and sets up all the fleets, planets, and all the tables we need.
When you are enter a screen, the Enter function is automatically called. In ifs_freeform_main, if the game is loaded for the first time from the menu, from a saved game,
or if you are re-entering the galactic conquest after a battle you will call the OneTimeInit function.
This loads the galactic map and sounds from a .lvl file. It sets up the sound, and does a lot of other stuff.
if you look in shell_interface.lua, you will see that it checks if there is a Galactic Conquest match going on.
This is the file loaded any time you start up the shell, like when you start the game for the first time, or exit a battle.
If there is a GC game, it will load, and push us back to ifs_freeform_main.

The ifs_freeform_main.Enter function will also figure out who just won the battle, since you will be in that function after re-entering GC after completing one.
Then it will apply the result of the battle, ie: destroying fleet, awarding money and planets.

the ifs_freeform_main.LoadState and ifs_freeform_main.SaveState funtions load and save the game. One of the values they save is curScreen. When you load the game,
you go to ifs_freeform_main.Enter and are pushed to that screen so you don't lose where you were.
If you are editing GC, if you add something to ScriptCB_SaveMetagameState, you also need to add it to ScriptCB_LoadMetagameState. This is data that you want to persist between turns.

ifs_freeform_main.SetActiveTeam is called to set the initial team or to switch teams. It also changes the active controller.

there are a couple important tables in ifs_freeform_main
planetFleet - the team of the fleet on this planet/ star. If there is a space battle, it will be 0
planetTeam - team of the planet. Stars will be neutral/ 0. Also your base will be set to 0 if it is caputred.
playerTeam - the team of the ACTIVE player, ie, whose turn it is. NOT necessarily the human player.
planetNext - the name of the planet which was just moved to, "dag" for dagobah. It should match the label of the planet in the gal.lvl file.
teamCode - the name of each team, ie "rep", "cis", so `this.teamCode[this.playerTeam]` would tell you which team was active.
teamController - which teams are a human. if the active team is a human, then `this.teamCode[this.playerTeam]` would be defined, otherwise it would be nil
joystick and joystick_other - used as booleans if the current team or the opposite team is a human.

ifs_freeform_fleet

the player will most of the time be on the ifs_freeform_fleet screen. That is what you see when you start GC and have not taken any actions.
After ifs_freeform_main loads everything you are sent there. It has the buttons: Select fleet, deselect fleet, Move fleet, skip.

ifs_freeform_battle ... _mode ... _card

When you enter the battle screen as the attacking player, you press Attack or Back.
If you press Back, you go back to the fleet screen. if you press Attack, you go to the battle_mode screen.

On the battle_mode screen, you will choose which mode you want to have, ie ctf or conquest, but since we usually only have one mode, conquest, it skips this dialogue.
But it does set the Launch Mission (ie which script we will load, like myg1c_con.lua for Mygeeto Clone Wars Conquest.

On the battle_card screen, we can set which bonus we want, and so can the other player. When we press Choose Bonus/ Next,
or if we dont have any available bonuses, We begin the battle.
We save the mission setup, which is what units we purchased for battle, and for space, which world, to setup the planet skybox.
Then we enter the mission, with the operative function being `ScriptCB_EnterMission()`.

Once the game is over, we load the shell again, and load Galactic Conquest again. Going into ifs_freeform_main, and then to ifs_freefrom_result, and so on like I described above.

I don't really know enough about the other screens to writ anything meaningful, but this should be the core gameplay loop.

if you want to edit the galactic conquest, you will need to use a the custom Galactic conquest feature from the v1.3 patch, or better,
use Anakin's Remaster mod's custom galactic conquest (which is what I did).

You can look at my mod for a reference: https://github.com/milehighguy-dev/swbf2_autoresolve
It adds an "Auto Resolve" button.

for development, I HIGHLY recommend tailing BFront2.log, which means reading the output in real time as it is appended by the debug exe.
I use a Linux terminal for it, but you could use this: https://sourceforge.net/projects/wintail/ or another program
You'll have to run the debug exe in windowed mode or put the tail window on a second screen to see it during gameplay.
Also, for print statements wrap your variables in tostring so it doesn't generate a stacktrace if something is nil. Like `print("player team is " .. tostring(this.playerTeam))`

Hope this was helpful!
