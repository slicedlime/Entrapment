# Reset state
scoreboard players set @e[type=armor_stand,name=Game] State 0
gamerule gameLoopFunction entrapment:loop/lobby

# Clear scores
scoreboard players reset * ReadyCheck
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay list Wins
scoreboard players reset * Tick

# Set environment
time set 18000
gamerule doDaylightCycle false
gamerule doMobSpawning false
gamerule naturalRegeneration true

# Player states
execute @p 0 251 130 tp @a[rm=20] 0 251 117 0 0
spawnpoint @a 0 251 117 0 0
clear @a

# Turn off collisions
scoreboard teams option blue collisionRule never
scoreboard teams option red collisionRule never
