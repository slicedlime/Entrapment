# Win messages
execute @e[type=armor_stand,name=JoinRed,score_Count_min=1] ~ ~ ~ title @a subtitle [{"text":"Cool Boys wins!","color":"red"}]
execute @e[type=armor_stand,name=JoinBlue,score_Count_min=1] ~ ~ ~ title @a subtitle [{"text":"Leafless Clovers wins!","color":"blue"}]
title @a title [{"text":"Game Over"}]
execute @e[type=armor_stand,name=JoinRed,score_Count_min=1] ~ ~ ~ tellraw @a [{"text":"Cool Boys wins!","color":"red"}]
execute @e[type=armor_stand,name=JoinBlue,score_Count_min=1] ~ ~ ~ tellraw @a [{"text":"Leafless Clovers wins!","color":"blue"}]

execute @e[type=armor_stand,name=JoinRed,score_Count_min=1] ~ ~ ~ scoreboard players add @a[team=red] Wins 1
execute @e[type=armor_stand,name=JoinBlue,score_Count_min=1] ~ ~ ~ scoreboard players add @a[team=blue] Wins 1

# Cleanup
scoreboard teams leave *
tp @a 0 251 117 0 0
kill @e[type=!Player,x=-60,y=220,z=-10,dx=40,dy=35,dz=106]
kill @e[type=!Player,x=20,y=220,z=-10,dx=40,dy=35,dz=106]
entitydata @e[type=armor_stand,name=TreasureCD] {CustomName:Treasure}
scoreboard players set @e[type=armor_stand,name=Game] ResetTime 80
kill @e[name=NewNTChest]
kill @e[name=NewPTChest]
kill @e[type=shulker]
worldborder set 60000000

# Make sure if someone disconnected during this game and reconnects during another
# they become spectators:
scoreboard players set * NotPlaying 1
scoreboard players reset @a[score_NotPlaying_min=1] NotPlaying

# Reset arena selection
scoreboard players reset * Selected
scoreboard players set @e[name=Blank,type=armor_stand] Selected 1
execute @e[name=Blank,type=armor_stand] ~ ~ ~ blockdata ~ ~ ~ {auto:1}
execute @e[type=armor_stand,name=Blank] ~ ~ ~ blockdata ~ ~1 ~ {Text1:"{\"text\":\"Arena:\"}",Text3:"{\"text\":\"No Arena\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger Action set 1\"}}"}
execute @e[type=armor_stand,name=Blank] ~ ~ ~ clone ~ ~1 ~ ~ ~1 ~ 3 253 144

gamerule gameLoopFunction entrapment:loop/postgame
