# Win messages
execute if entity @e[type=armor_stand,name=JoinRed,scores={Count=1..}] run title @a subtitle [{"text":"Team Redstone wins!","color":"red"}]
execute if entity @e[type=armor_stand,name=JoinBlue,scores={Count=1..}] run title @a subtitle [{"text":"Team Lapis wins!","color":"blue"}]
title @a title [{"text":"Game Over"}]
execute if entity @e[type=armor_stand,name=JoinRed,scores={Count=1..}] run tellraw @a [{"text":"Team Redstone wins!","color":"red"}]
execute if entity @e[type=armor_stand,name=JoinBlue,scores={Count=1..}] run tellraw @a [{"text":"Team Lapis wins!","color":"blue"}]

execute as @e[type=armor_stand,name=JoinRed,scores={Count=1..}] run scoreboard players add @a[team=red] Wins 1
execute as @e[type=armor_stand,name=JoinBlue,scores={Count=1}] run scoreboard players add @a[team=blue] Wins 1

# Cleanup
team leave *
tp @a 0 251 117 0 0
kill @e[type=!player,x=-60,y=220,z=-10,dx=40,dy=35,dz=106]
kill @e[type=!player,x=20,y=220,z=-10,dx=40,dy=35,dz=106]
execute as @e[type=armor_stand,tag=TreasureCD] run tag @s add Treasure
execute as @e[type=armor_stand,tag=TreasureCD] run tag @s remove TreasureCD
scoreboard players set @e[type=armor_stand,name=Game] ResetTime 80
kill @e[name=NewNTChest]
kill @e[name=NewPTChest]
kill @e[type=shulker]
worldborder set 60000000

# Make sure if someone disconnected during this game and reconnects during another
# they become spectators:
scoreboard players set * NotPlaying 1
scoreboard players reset @a[scores={NotPlaying=1}] NotPlaying

# Reset arena selection
scoreboard players reset * Selected
scoreboard players set @e[name=Blank,type=armor_stand] Selected 1

data merge block 3 253 144 {Text1:'{"text":"Arena:","color":"white"}',Text3:'{"text":"No Arena","color":"gold","clickEvent":{"action":"run_command","value":"trigger Action set 1"}}',Text4:''}

function entrapment:lobby/applypreview

scoreboard players set @e[type=armor_stand,name=Game] State 4
