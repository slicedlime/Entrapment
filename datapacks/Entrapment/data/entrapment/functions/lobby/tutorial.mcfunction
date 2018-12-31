# Make sure tutorial players don't see each other
effect give @a[scores={HelpPos=1}] minecraft:invisibility 1 1 true

# Tutorial text:
tellraw @a[scores={HelpPos=52}] ["",{"text":"Welcome to "},{"text":"Entrapment","color":"green","bold":true},{"text":" by ","color":"none","bold":false},{"text":"slicedlime","color":"gold","clickEvent":{"action":"open_url","value":"http://www.youtube.com/slicedlime"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"slicedlime on YouTube"}]}}},{"text":"."}]
tellraw @a[scores={HelpPos=160}] ["",{"text":"\nEntrapment is a PvP game where you never see the enemy\nteam.","color":"none"}]
tellraw @a[scores={HelpPos=270}] ["",{"text":"\nThe only way to win is to up set traps for your opponents.","color":"none"}]
tellraw @a[scores={HelpPos=350}] ["",{"text":"\nThere are two identical arenas - one for each team.","color":"none"}]
tellraw @a[scores={HelpPos=410}] ["",{"text":"\nRush out, get the chest and build your traps... but keep an\neye on the countdown.","color":"none"}]
tellraw @a[scores={HelpPos=500}] ["",{"text":"\nWhen the timer reaches 0, the teams will switch places.","color":"none"}]
tellraw @a[scores={HelpPos=600}] ["",{"text":"\nAt the start of each round you'll be in a spawn area.","color":"none"}]
tellraw @a[scores={HelpPos=665}] ["",{"text":"\nThis is a safe space - nothing can hurt you in here... but\na timer is counting down to the end of the safe time.","color":"none"}]
tellraw @a[scores={HelpPos=775}] ["",{"text":"\nAny coward still inside this chamber when the safe time is up\nwill end up outside of the world border and take damage...","color":"none"}]
tellraw @a[scores={HelpPos=890}] ["",{"text":"\nOne heart of damage per second until you get out!","color":"none"}]
tellraw @a[scores={HelpPos=1020}] ["",{"text":"\nNo blocks or mobs can be placed inside the spawn zone","color":"none"}]
tellraw @a[scores={HelpPos=1085}] ["",{"text":"\nand all lava within 3 blocks from the entrance is cleared at\nthe start of each round.","color":"none"}]
tellraw @a[scores={HelpPos=1180}] ["",{"text":"\nEach round a chest will spawn somewhere in the arena.","color":"none"}]
tellraw @a[scores={HelpPos=1245}] ["",{"text":"\nIt's lit up with a particle beam to indicate that there is still\nloot to be found inside.","color":"none"}]
tellraw @a[scores={HelpPos=1340}] ["",{"text":"\nThe contents is a random selection of trap-making material,\nand it's the same for both teams.","color":"none"}]
tellraw @a[scores={HelpPos=1480}] ["",{"text":"\nBe careful - the game is played without health regeneration,\nso every bit of damage counts!","color":"none"}]
tellraw @a[scores={HelpPos=1600}] ["",{"text":"\nIt is impossible to hit the other team directly with arrows\nfrom the top of the arena","color":"none"}]
tellraw @a[scores={HelpPos=1695}] ["",{"text":"\nand any attempts at leaving the arena will be punished.","color":"none"}]
tellraw @a[scores={HelpPos=1780}] ["",{"text":"\nThe winning team is the one that stays alive when all\nmembers of the opposing team have perished.","color":"none"}]
tellraw @a[scores={HelpPos=1890}] ["",{"text":"\nGood luck, and enjoy Entrapment!","color":"none"}]

# Tutorial VO
execute at @p[scores={HelpPos=102}] run playsound map.entrapment.welcome voice @a[scores={HelpPos=102}] ~ ~ ~ 1000
execute at @p[scores={HelpPos=350}] run playsound map.entrapment.arenasoverview voice @a[scores={HelpPos=350}] ~ ~ ~ 1000
execute at @p[scores={HelpPos=600}] run playsound map.entrapment.spawnarea voice @a[scores={HelpPos=600}] ~ ~ ~ 1000
execute at @p[scores={HelpPos=1020}] run playsound map.entrapment.spawnarearules voice @a[scores={HelpPos=1020}] ~ ~ ~ 1000
execute at @p[scores={HelpPos=1180}] run playsound map.entrapment.chest voice @a[scores={HelpPos=1180}] ~ ~ ~ 1000
execute at @p[scores={HelpPos=1480}] run playsound map.entrapment.regen voice @a[scores={HelpPos=1480}] ~ ~ ~ 1000
execute at @p[scores={HelpPos=1600}] run playsound map.entrapment.combatrules voice @a[scores={HelpPos=1600}] ~ ~ ~ 1000
execute at @p[scores={HelpPos=1780}] run playsound map.entrapment.wincondition voice @a[scores={HelpPos=1780}] ~ ~ ~ 1000

# Tutorial view positions
tp @a[scores={HelpPos=1..335}] -1020.3 33.0 8.3 39 30.5
tp @a[scores={HelpPos=336..575}] -957.6 46 12.5 44.4 21.4
tp @a[scores={HelpPos=576..990}] -959.5 16 -0.7 0 0
tp @a[scores={HelpPos=991..1155}] -953.5 18 12.5 138 23
tp @a[scores={HelpPos=1156..1455}] -978.5 29 57.5 -35 23
tp @a[scores={HelpPos=1456..1760}] -957.6 46 12.5 44.4 21.4
tp @a[scores={HelpPos=1761..1900}] -1020.3 33.0 8.3 39 30.5
tp @a[scores={HelpPos=1949}] 0 251 122 0 0

# Reset at end of tutorial
scoreboard players set @a[scores={HelpPos=1950..}] HelpPos 0