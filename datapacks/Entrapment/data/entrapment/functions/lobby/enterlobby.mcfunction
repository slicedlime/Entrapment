# Reset state
scoreboard players set @e[type=armor_stand,name=Game] State 0

# Clear scores
scoreboard players reset * ReadyCheck
scoreboard objectives setdisplay sidebar
scoreboard players reset * Tick

# Set environment
time set 18000
gamerule doDaylightCycle false
gamerule doMobSpawning false
gamerule naturalRegeneration true

# Player states
execute positioned 0 251 130 run teleport @a[distance=20..] 0 251 117 0 0
spawnpoint @a 0 251 117
clear @a

# Turn off collisions
team modify blue collisionRule never
team modify red collisionRule never

scoreboard objectives setdisplay list Wins
