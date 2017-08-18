# Make sure tutorial players don't see each others
effect @a[score_HelpPos_min=1] minecraft:invisibility 1 1 true

# Tutorial text:
tellraw @a[score_HelpPos_min=52,score_HelpPos=52] ["",{"text":"Welcome to "},{"text":"Entrapment","color":"green","bold":true},{"text":" by ","color":"none","bold":false},{"text":"slicedlime","color":"gold","clickEvent":{"action":"open_url","value":"http://www.youtube.com/slicedlime"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"slicedlime on YouTube"}]}}},{"text":"."}]
tellraw @a[score_HelpPos_min=160,score_HelpPos=160] ["",{"text":"\nEntrapment is a PvP game where you never see the enemy\nteam.","color":"none"}]
tellraw @a[score_HelpPos_min=270,score_HelpPos=270] ["",{"text":"\nThe only way to win is to set up traps for your opponents.","color":"none"}]
tellraw @a[score_HelpPos_min=350,score_HelpPos=350] ["",{"text":"\nThere are two identical arenas - one for each team.","color":"none"}]
tellraw @a[score_HelpPos_min=410,score_HelpPos=410] ["",{"text":"\nRush out, get the chest and build your traps... but keep an\neye on the countdown.","color":"none"}]
tellraw @a[score_HelpPos_min=500,score_HelpPos=500] ["",{"text":"\nWhen the timer reaches 0, the teams will switch places.","color":"none"}]
tellraw @a[score_HelpPos_min=600,score_HelpPos=600] ["",{"text":"\nAt the start of each round you'll be in a spawn area.","color":"none"}]
tellraw @a[score_HelpPos_min=665,score_HelpPos=665] ["",{"text":"\nThis is a safe space - nothing can hurt you in here... but\na timer is counting down to the end of the safe time.","color":"none"}]
tellraw @a[score_HelpPos_min=775,score_HelpPos=775] ["",{"text":"\nAny coward still inside this chamber when the safe time is up\nwill end up outside of the world border and take damage...","color":"none"}]
tellraw @a[score_HelpPos_min=890,score_HelpPos=890] ["",{"text":"\nOne heart of damage per second until you get out!","color":"none"}]
tellraw @a[score_HelpPos_min=1000,score_HelpPos=1000] ["",{"text":"\nNo blocks or mobs can be placed inside the spawn zone","color":"none"}]
tellraw @a[score_HelpPos_min=1085,score_HelpPos=1085] ["",{"text":"\nand all lava within 3 blocks from the entrance is cleared at\nthe start of each round.","color":"none"}]
tellraw @a[score_HelpPos_min=1180,score_HelpPos=1180] ["",{"text":"\nEach round a chest will spawn somewhere in the arena.","color":"none"}]
tellraw @a[score_HelpPos_min=1245,score_HelpPos=1245] ["",{"text":"\nIt's lit up with a particle beam to indicate that there is still\nloot to be found inside.","color":"none"}]
tellraw @a[score_HelpPos_min=1340,score_HelpPos=1340] ["",{"text":"\nThe contents is a random selection of trap-making material,\nand it's the same for both teams.","color":"none"}]
tellraw @a[score_HelpPos_min=1500,score_HelpPos=1500] ["",{"text":"\nBe careful - the game is played without health regeneration,\nso every bit of damage counts!","color":"none"}]
tellraw @a[score_HelpPos_min=1640,score_HelpPos=1640] ["",{"text":"\nIt is impossible to hit the other team directly with arrows\nfrom the top of the arena","color":"none"}]
tellraw @a[score_HelpPos_min=1725,score_HelpPos=1725] ["",{"text":"\nand any attempts at leaving the arena will be punished.","color":"none"}]
tellraw @a[score_HelpPos_min=1850,score_HelpPos=1850] ["",{"text":"\nThe winning team is the one that stays alive when all\nmembers of the opposing team have perished.","color":"none"}]
tellraw @a[score_HelpPos_min=1980,score_HelpPos=1980] ["",{"text":"\nGood luck, and enjoy Entrapment!","color":"none"}]

# Tutorial VO
execute @a[score_HelpPos_min=102,score_HelpPos=102] ~ ~ ~ playsound map.entrapment.welcome voice @s
execute @a[score_HelpPos_min=350,score_HelpPos=350] ~ ~ ~ playsound map.entrapment.arenasoverview voice @s
execute @a[score_HelpPos_min=600,score_HelpPos=600] ~ ~ ~ playsound map.entrapment.spawnarea voice @s
execute @a[score_HelpPos_min=1000,score_HelpPos=1000] ~ ~ ~ playsound map.entrapment.spawnarearules voice @s
execute @a[score_HelpPos_min=1180,score_HelpPos=1180] ~ ~ ~ playsound map.entrapment.chest voice @s
execute @a[score_HelpPos_min=1500,score_HelpPos=1500] ~ ~ ~ playsound map.entrapment.regen voice @s
execute @a[score_HelpPos_min=1640,score_HelpPos=1640] ~ ~ ~ playsound map.entrapment.combatrules voice @s
execute @a[score_HelpPos_min=1850,score_HelpPos=1850] ~ ~ ~ playsound map.entrapment.wincondition voice @s

# Tutorial view positions
tp @a[score_HelpPos_min=1,score_HelpPos=335] -1020.3 33.0 8.3 39 30.5
tp @a[score_HelpPos_min=336,score_HelpPos=589] -957.6 46 12.5 44.4 21.4
tp @a[score_HelpPos_min=590,score_HelpPos=990] -959.5 16 -0.7 0 0
tp @a[score_HelpPos_min=991,score_HelpPos=1165] -953.5 18 12.5 138 23
tp @a[score_HelpPos_min=1166,score_HelpPos=1485] -978.5 29 57.5 -35 23
tp @a[score_HelpPos_min=1486,score_HelpPos=1830] -957.6 46 12.5 44.4 21.4
tp @a[score_HelpPos_min=1831,score_HelpPos=1900] -1020.3 33.0 8.3 39 30.5
tp @a[score_HelpPos_min=2030,score_HelpPos=2030] 0 251 122 0 0

# Reset at end of tutorial
scoreboard players set @a[score_HelpPos_min=2030] HelpPos 0

# Cancel option
scoreboard players tag @a[score_HelpPos_min=1] add Cancel {SelectedItem:{id:"minecraft:filled_map"}}
scoreboard players set @a[tag=Cancel] HelpPos 0
scoreboard players tag @a[tag=Cancel] remove Cancel
replaceitem entity @a[score_HelpPos_min=1] slot.hotbar.4 minecraft:map 1 0 {display:{Name:"Cancel Tutorial"}}
