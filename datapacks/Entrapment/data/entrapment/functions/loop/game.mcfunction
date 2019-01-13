function entrapment:loop/allmodes

# Player modes
gamemode survival @a[team=!none,gamemode=adventure]
gamemode spectator @a[team=none,gamemode=adventure]
gamemode spectator @a[team=none,gamemode=survival]
gamemode spectator @a[scores={Deaths=1..}]
scoreboard players reset @a[scores={Deaths=1..}] Deaths
effect give @a saturation 3 1 true

# Make sure team AS don't unload
tp @e[type=armor_stand,name=JoinBlue] 1011 2 2
tp @e[type=armor_stand,name=JoinRed] 1011 2 3

# Timing
scoreboard players remove @e[type=armor_stand,name=Game] Tick 1
scoreboard players operation Seconds Tick = @e[type=armor_stand,name=Game] Tick
scoreboard players operation Seconds Tick /= 20 Const
scoreboard players operation Time Time = Seconds Tick
execute if score @e[type=armor_stand,name=Game,limit=1] Tick matches 1 run function entrapment:game/newround

# Countdown sounds
execute if score @e[name=Game] Tick matches 99 as @a at @s run playsound minecraft:block.note.hat master @s ~ ~ ~
execute if score @e[name=Game] Tick matches 79 as @a at @s run playsound minecraft:block.note.hat master @s ~ ~ ~
execute if score @e[name=Game] Tick matches 59 as @a at @s run playsound minecraft:block.note.hat master @s ~ ~ ~
execute if score @e[name=Game] Tick matches 39 as @a at @s run playsound minecraft:block.note.hat master @s ~ ~ ~
execute if score @e[name=Game] Tick matches 19 as @a at @s run playsound minecraft:block.note.hat master @s ~ ~ ~

# Display round counter on action bar
title @a actionbar [{"text":"Round "},{"score":{"objective":"Round","name":"Total"}}]

# Spawn area lamp protection
kill @e[type=minecraft:item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6,nbt={Item:{id:"minecraft:redstone_lamp"}}]
kill @e[type=minecraft:item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6,nbt={Item:{id:"minecraft:sea_lantern"}}]
kill @e[type=minecraft:item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6,nbt={Item:{id:"minecraft:prismarine_crystals"}}]

# Chests
spreadplayers -40 47 1 46 false @e[type=armor_stand,name=NewNTChest]
execute as @e[type=armor_stand,name=NewNTChest,x=-59,y=220,z=1,dx=38,dy=34,dz=94,nbt={OnGround:1b}] at @s if block ~ ~ ~ air run data merge entity @s {CustomName:"\"TChest\""}
spreadplayers 40 47 1 46 false @e[type=armor_stand,name=NewPTChest]
execute as @e[type=armor_stand,name=NewPTChest,x=21,y=220,z=0,dx=96,dy=34,dz=96,nbt={OnGround:1b}] at @s if block ~ ~ ~ air run data merge entity @s {CustomName:"\"TChest\""}

# See if we've used all the treasure items. '
execute unless entity @e[type=armor_stand,name=Game,name=Treasure] run data merge entity @e[type=armor_stand,name=TreasureCD] {CustomName:"\"Treasure\""}

# Particle beacons
execute at @e[type=armor_stand,name=OldTChest] run particle fireworksSpark ~ ~11 ~ 0 3 0 0 2 force

# Remove tracking of empty or destroyed chests
execute as @e[type=armor_stand,name=OldTChest] at @s if block ~ ~ ~ air kill @s
execute as @e[type=armor_stand,name=OldTChest] at @s store result score @s SuccessCount run data get block ~ ~ ~ Items
kill @e[type=armor_stand,name=OldTChest,scores={SuccessCount=0}]

# Place chest if valid spot found
execute at @e[type=armor_stand,name=TChest] as @e[type=armor_stand,tag=Treasure,score_Selected_min=1] run setblock ~ ~-1 ~ redstone_block

# Kill portal blocks
execute @a ~ ~ ~ fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air 0 replace portal

# Player confinement
scoreboard players set @a InArena 0
scoreboard players set @a[x=-59,y=221,z=1,dx=38,dy=50,dz=94] InArena 1
scoreboard players set @a[x=21,y=221,z=1,dx=38,dy=50,dz=94] InArena 1
scoreboard players set @a[x=-44,y=236,z=-8,dx=8,dy=5,dz=8] InArena 1
scoreboard players set @a[x=36,y=236,z=-8,dx=8,dy=5,dz=8] InArena 1
scoreboard players set @a[score_InArena_min=1] OutOfMap 0
scoreboard players add @a[score_InArena=0] OutOfMap 1
title @a[gamemode=survival,score_OutOfMap_min=1,score_OutOfMap=1] title [{"text":"Return to the arena!","color":"red"}]
effect @a[gamemode=survival,score_OutOfMap_min=100] wither 1 2

# Confine spectators
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] ~ ~ ~ tp @a[gamemode=spectator,team=red,score_InArena=0] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2,score_SpectatorLock_min=1] ~ ~ ~ tp @a[gamemode=spectator,team=blue,score_InArena=0] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2,score_SpectatorLock_min=1] ~ ~ ~ tp @a[gamemode=spectator,team=red,score_InArena=0] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] ~ ~ ~ tp @a[gamemode=spectator,team=blue,score_InArena=0] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] 20 0 -10 tp @a[team=red,gamemode=spectator,dx=42,dy=500,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2,score_SpectatorLock_min=1] 20 0 -10 tp @a[team=blue,gamemode=spectator,dx=42,dy=500,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] -60 0 -10 tp @a[team=blue,gamemode=spectator,dx=42,dy=500,dz=110] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2,score_SpectatorLock_min=1] -60 0 -10 tp @a[team=red,gamemode=spectator,dx=42,dy=500,dz=110] 40 236 -8 0 0

# Tp players in wrong arena (reconnects)
execute @e[type=armor_stand,name=Game,score_Round=1] 20 220 -10 tp @a[team=red,gamemode=survival,dx=42,dy=40,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2] 20 220 -10 tp @a[team=blue,gamemode=survival,dx=42,dy=40,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1] -60 220 -10 tp @a[team=blue,gamemode=survival,dx=42,dy=40,dz=110] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2] -60 220 -10 tp @a[team=red,gamemode=survival,dx=42,dy=40,dz=110] 40 236 -8 0 0

# Gates
scoreboard players set @e[type=armor_stand,name=Gate] Gate 1
execute @e[type=armor_stand,name=Gate] ~ ~ ~ execute @p[dx=10,dy=5,dz=3,gamemode=survival] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=Gate,c=1] Gate 0
execute @e[type=armor_stand,name=Gate,score_Gate_min=1] ~1 ~1 ~1 fill ~ ~ ~ ~8 ~3 ~ barrier 0 replace air 0
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~1 ~1 ~1 fill ~ ~ ~ ~8 ~3 ~ air 0 replace barrier 0
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~1 ~1 ~1 fill ~ ~ ~ ~8 ~3 ~ air 0 destroy
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~ ~ ~1 fill ~ ~1 ~ ~ ~4 ~ lit_redstone_lamp
execute @e[type=armor_stand,name=Gate,score_Gate_min=1] ~ ~ ~1 fill ~ ~1 ~ ~ ~4 ~ sea_lantern
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~10 ~ ~1 fill ~ ~1 ~ ~ ~4 ~ lit_redstone_lamp
execute @e[type=armor_stand,name=Gate,score_Gate_min=1] ~10 ~ ~1 fill ~ ~1 ~ ~ ~4 ~ sea_lantern
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~ ~ ~1 fill ~1 ~ ~ ~9 ~ ~ lit_redstone_lamp
execute @e[type=armor_stand,name=Gate,score_Gate_min=1] ~ ~ ~1 fill ~1 ~ ~ ~9 ~ ~ sea_lantern
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~ ~5 ~1 fill ~1 ~ ~ ~9 ~ ~ lit_redstone_lamp
execute @e[type=armor_stand,name=Gate,score_Gate_min=1] ~ ~5 ~1 fill ~1 ~ ~ ~9 ~ ~ sea_lantern
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~-1 ~ ~1 fill ~ ~1 ~ ~ ~4 ~ redstone_block
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~11 ~ ~1 fill ~ ~1 ~ ~ ~4 ~ redstone_block
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~ ~-1 ~1 fill ~1 ~ ~ ~9 ~ ~ redstone_block
execute @e[type=armor_stand,name=Gate,score_Gate=0] ~ ~6 ~1 fill ~1 ~ ~ ~9 ~ ~ redstone_block

# Spawn area protection
execute @e[type=armor_stand,name=Gate] ~1 ~1 ~ fill ~ ~ ~ ~8 ~3 ~-6 air 0 destroy
execute @e[type=armor_stand,name=Gate] ~1 ~1 ~2 fill ~ ~ ~ ~8 ~3 ~ air 0 destroy
scoreboard players reset * ShouldMove
scoreboard players set @e[type=!Item,x=-45,y=235,z=-9,dx=90,dy=5,dz=8] ShouldMove 1
scoreboard players reset @e[type=Arrow,score_ShouldMove_min=1] ShouldMove
entitydata @e[score_ShouldMove_min=1] {Motion:[0d,0d,1d]}
tp @e[type=!Player,score_ShouldMove_min=1] ~ ~ ~0.05

# Danger time
scoreboard players remove @e[type=armor_stand,name=Game] DangerTime 1
execute @e[type=armor_stand,name=Game,score_DangerTime_min=100] ~ ~ ~ execute @e[type=armor_stand,name=Gate] ~1 ~1 ~-6 effect @a[dx=8,dy=3,dz=8] minecraft:resistance 1 5
scoreboard players operation Seconds DangerTime = @e[type=armor_stand,name=Game] DangerTime
scoreboard players operation Seconds DangerTime /= 20 Const
execute @e[type=armor_stand,name=Game,score_DangerTime_min=0] ~ ~ ~ scoreboard players operation SpawnSafety Time = Seconds DangerTime

# Anti-camping in spawn zone
execute @e[type=armor_stand,name=Game,score_DangerTime_min=100,score_DangerTime=100] ~ ~ ~ tellraw @a [{"text":"5 second warning - leave the spawn zone!","color":"red"}]
execute @e[type=armor_stand,name=Game,score_DangerTime_min=0,score_DangerTime=0] ~ ~ ~ worldborder set 4020
execute @e[type=armor_stand,name=Game,score_DangerTime_min=0,score_DangerTime=0] ~ ~ ~ worldborder set 3998.25 10

# Barrier between arenas
kill @e[type=!Player,x=-15,y=0,z=0,dx=10,dy=500,dz=100]
kill @e[type=!Player,x=5,y=0,z=0,dx=10,dy=500,dz=100]
kill @a[gamemode=survival,x=-15,y=0,z=0,dx=10,dy=500,dz=100]
kill @a[gamemode=survival,x=5,y=0,z=0,dx=10,dy=500,dz=100]

# Get rid of totems of undying
scoreboard players tag @e[type=item] add Totem {Item:{id:"minecraft:totem_of_undying"}}
kill @e[type=item,tag=Totem]
clear @a totem_of_undying

# Count remaining players
scoreboard players set @e[type=armor_stand,score_Team_min=1] Count 0
execute @a[team=blue,gamemode=survival] ~ ~ ~ scoreboard players add @e[type=armor_stand,name=JoinBlue] Count 1
execute @a[team=red,gamemode=survival] ~ ~ ~ scoreboard players add @e[type=armor_stand,name=JoinRed] Count 1
function entrapment:game/gamewon if @e[type=armor_stand,score_Team_min=1,score_Count=0]

# Protect lobby, outside of arenas

kill @e[type=!player,x=-70,y=0,z=100,dx=140,dy=512,dz=10]
kill @a[gamemode=survival,x=-70,y=0,z=100,dx=140,dy=512,dz=10]

fill 19 220 96 19 255 0 air
fill -19 220 96 -19 255 0 air
fill 61 220 96 61 255 0 air
fill -61 220 96 -61 255 0 air
fill 20 242 -1 60 255 -1 air
fill -20 242 -1 -60 255 -1 air
fill 20 242 97 60 255 97 air
fill -20 242 97 -60 255 97 air

scoreboard players operation Time Info = Time Time
scoreboard players operation SpawnSafety Info = SpawnSafety Time
scoreboard players reset @a[team=!none,gamemode=spectator] Info
execute @a[gamemode=survival] ~ ~ ~ scoreboard players operation @s Info = @s Health
