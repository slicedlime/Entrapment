# Start the ready check

scoreboard players set @e[type=armor_stand,name=Game] State 1
gamerule gameLoopFunction entrapment:loop/readycheck

execute @a ~ ~ ~ playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 0.6

# Give each player two snowballs for selection
clear @a[m=adventure]

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
tp @a[score_HelpPos_min=1] 0 251 122 0 0
scoreboard players set @a HelpPos 0
