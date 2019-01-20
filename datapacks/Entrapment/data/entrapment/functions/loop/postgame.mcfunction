# Countdown state
gamemode adventure @a[gamemode=survival]
gamemode adventure @a[gamemode=spectator]

scoreboard players remove @e[type=armor_stand,name=Game] ResetTime 1
execute if score @e[type=armor_stand,name=Game,limit=1] ResetTime matches 0 run function entrapment:lobby/enterlobby

scoreboard players set $Game Tick 0
