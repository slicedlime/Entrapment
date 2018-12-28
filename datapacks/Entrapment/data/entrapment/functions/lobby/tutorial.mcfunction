# Make sure tutorial players don't see each others
effect @a[score_HelpPos_min=1] minecraft:invisibility 1 1 true

# Tutorial text:
tellraw @a[score_HelpPos_min=52,score_HelpPos=52] ["",{"text":"Welcome to "},{"text":"Entrapment","color":"green","bold":true},{"text":" by ","color":"none","bold":false},{"text":"slicedlime","color":"gold","clickEvent":{"action":"open_url","value":"http://www.youtube.com/slicedlime"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"slicedlime on YouTube"}]}}},{"text":"."}]
tellraw @a[score_HelpPos_min=160,score_HelpPos=160] ["",{"text":"\nEntrapment is a PvP map where you never see the enemy team.","color":"none"}]
tellraw @a[score_HelpPos_min=270,score_HelpPos=270] ["",{"text":"\nThe only way to win is to up set traps for your opponents.","color":"none"}]
tellraw @a[score_HelpPos_min=350,score_HelpPos=350] ["",{"text":"\nThere are two identical arenas - one for each team.","color":"none"}]
tellraw @a[score_HelpPos_min=410,score_HelpPos=410] ["",{"text":"\nRush out, get the chest and build your traps... but keep an\neye on the countdown.","color":"none"}]
tellraw @a[score_HelpPos_min=500,score_HelpPos=500] ["",{"text":"\nWhen the timer reaches 0, the teams will switch places.","color":"none"}]
tellraw @a[score_HelpPos_min=600,score_HelpPos=600] ["",{"text":"\nAt the start of each round you'll be in a spawn area.","color":"none"}]
tellraw @a[score_HelpPos_min=665,score_HelpPos=665] ["",{"text":"\nThis is a safe space - nothing can hurt you in here... but\na timer is counting down to the end of the safe time.","color":"none"}]
tellraw @a[score_HelpPos_min=775,score_HelpPos=775] ["",{"text":"\nAny coward still inside this chamber when the safe time is up\nwill end up outside of the world border and take damage...","color":"none"}]
tellraw @a[score_HelpPos_min=890,score_HelpPos=890] ["",{"text":"\nOne heart of damage per second until you get out!","color":"none"}]
tellraw @a[score_HelpPos_min=1020,score_HelpPos=1020] ["",{"text":"\nNo blocks or mobs can be placed inside the spawn zone","color":"none"}]
tellraw @a[score_HelpPos_min=1085,score_HelpPos=1085] ["",{"text":"\nand all lava within 3 blocks from the entrance is cleared at\nthe start of each round.","color":"none"}]
tellraw @a[score_HelpPos_min=1180,score_HelpPos=1180] ["",{"text":"\nEach round a chest will spawn somewhere in the arena.","color":"none"}]
tellraw @a[score_HelpPos_min=1245,score_HelpPos=1245] ["",{"text":"\nIt's lit up with a particle beam to indicate that there is still\nloot to be found inside.","color":"none"}]
tellraw @a[score_HelpPos_min=1340,score_HelpPos=1340] ["",{"text":"\nThe contents is a random selection of trap-making material,\nand it's the same for both teams.","color":"none"}]
tellraw @a[score_HelpPos_min=1480,score_HelpPos=1480] ["",{"text":"\nBe careful - the game is played without health regeneration,\nso every bit of damage counts!","color":"none"}]
tellraw @a[score_HelpPos_min=1600,score_HelpPos=1600] ["",{"text":"\nIt is impossible to hit the other team directly with arrows\nfrom the top of the arena","color":"none"}]
tellraw @a[score_HelpPos_min=1695,score_HelpPos=1695] ["",{"text":"\nand any attempts at leaving the arena will be punished.","color":"none"}]
tellraw @a[score_HelpPos_min=1780,score_HelpPos=1780] ["",{"text":"\nThe winning team is the one that stays alive when all\nmembers of the opposing team have perished.","color":"none"}]
tellraw @a[score_HelpPos_min=1890,score_HelpPos=1890] ["",{"text":"\nGood luck, and enjoy Entrapment!","color":"none"}]

# Tutorial VO
execute @p[score_HelpPos_min=102,score_HelpPos=102] ~ ~ ~ playsound map.entrapment.welcome voice @a[score_HelpPos_min=102,score_HelpPos=102]
execute @p[score_HelpPos_min=350,score_HelpPos=350] ~ ~ ~ playsound map.entrapment.arenasoverview voice @a[score_HelpPos_min=350,score_HelpPos=350]
execute @p[score_HelpPos_min=600,score_HelpPos=600] ~ ~ ~ playsound map.entrapment.spawnarea voice @a[score_HelpPos_min=600,score_HelpPos=600]
execute @p[score_HelpPos_min=1020,score_HelpPos=1020] ~ ~ ~ playsound map.entrapment.spawnarearules voice @a[score_HelpPos_min=1020,score_HelpPos=1020]
execute @p[score_HelpPos_min=1180,score_HelpPos=1180] ~ ~ ~ playsound map.entrapment.chest voice @a[score_HelpPos_min=1180,score_HelpPos=1180]
execute @p[score_HelpPos_min=1480,score_HelpPos=1480] ~ ~ ~ playsound map.entrapment.regen voice @a[score_HelpPos_min=1480,score_HelpPos=1480]
execute @p[score_HelpPos_min=1600,score_HelpPos=1600] ~ ~ ~ playsound map.entrapment.combatrules voice @a[score_HelpPos_min=1600,score_HelpPos=1600]
execute @p[score_HelpPos_min=1780,score_HelpPos=1780] ~ ~ ~ playsound map.entrapment.wincondition voice @a[score_HelpPos_min=1780,score_HelpPos=1780]

# Tutorial view positions
tp @a[score_HelpPos_min=1,score_HelpPos=335] -1020.3 33.0 8.3 39 30.5
tp @a[score_HelpPos_min=336,score_HelpPos=575] -957.6 46 12.5 44.4 21.4
tp @a[score_HelpPos_min=576,score_HelpPos=990] -959.5 16 -0.7 0 0
tp @a[score_HelpPos_min=991,score_HelpPos=1155] -953.5 18 12.5 138 23
tp @a[score_HelpPos_min=1156,score_HelpPos=1455] -978.5 29 57.5 -35 23
tp @a[score_HelpPos_min=1456,score_HelpPos=1760] -957.6 46 12.5 44.4 21.4
tp @a[score_HelpPos_min=1761,score_HelpPos=1900] -1020.3 33.0 8.3 39 30.5
tp @a[score_HelpPos_min=1949,score_HelpPos=1949] 0 251 122 0 0

# Reset at end of tutorial
scoreboard players set @a[score_HelpPos_min=1950] HelpPos 0