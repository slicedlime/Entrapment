# Start the ready check

scoreboard players set @e[type=armor_stand,name=Game] State 1

execute as @a at @s run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 0.6

# Give each player two helmets for selection
clear @a[gamemode=adventure]

scoreboard players reset * Tick
scoreboard players reset * Ready
scoreboard players set @a[team=!none] Ready 0

title @a title [{"text":"Ready check!","color":"gold"}]
title @a subtitle [{"text":"Equip the 'Ready' helmet when ready"}]
tellraw @a [{"text":"Ready check!","color":"gold"}]
tellraw @a [{"text":"Equip the 'Ready' helmet when ready"}]

scoreboard players reset * HeldReadyItem

scoreboard players set @a[team=!none] ReadyCheck 1
scoreboard objectives setdisplay sidebar ReadyCheck

# Tp players back from tutorial and cancel tutorial
teleport @a[scores={HelpPos=1..}] 0 251 122 0 0
scoreboard players set @a HelpPos 0
