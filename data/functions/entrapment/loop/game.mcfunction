function entrapment:loop/allmodes

# Player modes
gamemode survival @a[team=!none,m=adventure]
gamemode spectator @a[team=none,m=adventure]
gamemode spectator @a[team=none,m=survival]
gamemode spectator @a[score_Deaths_min=1]
scoreboard players reset @a[score_Deaths_min=1] Deaths
effect @a saturation 3 1 true

# Make sure team AS don't unload
tp @e[type=armor_stand,name=JoinBlue] 1011 2 2
tp @e[type=armor_stand,name=JoinRed] 1011 2 3

# Timing
scoreboard players remove @e[type=armor_stand,name=Game] Tick 1
scoreboard players operation Seconds Tick = @e[type=armor_stand,name=Game] Tick
scoreboard players operation Seconds Tick /= 20 Const
scoreboard players operation Time Time = Seconds Tick
function entrapment:game/newround if @e[type=armor_stand,name=Game,score_Tick=1,score_Tick_min=1]

# Countdown sounds
execute @e[name=Game,score_Tick=99,score_Tick_min=99] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=79,score_Tick_min=79] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=59,score_Tick_min=59] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=39,score_Tick_min=39] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=19,score_Tick_min=19] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s

# Display round counter on action bar
title @a actionbar [{"text":"Round "},{"score":{"objective":"Round","name":"Total"}}]

# Spawn area lamp protection
scoreboard players add @e[type=Item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6] SeaLantern 1 {Item:{id:"minecraft:redstone_lamp"}}
scoreboard players add @e[type=Item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6] SeaLantern 1 {Item:{id:"minecraft:sea_lantern"}}
scoreboard players add @e[type=Item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6] SeaLantern 1 {Item:{id:"minecraft:prismarine_crystals"}}
kill @e[type=Item,score_SeaLantern_min=1]

# Chests
spreadplayers -40 47 1 46 false @e[type=armor_stand,name=NewNTChest]
execute @e[type=armor_stand,name=NewNTChest,x=-59,y=220,z=1,dx=38,dy=34,dz=94] ~ ~ ~ detect ~ ~ ~ air 0 entitydata @e[type=armor_stand,name=NewNTChest,c=1] {CustomName:TChest}
spreadplayers 40 47 1 46 false @e[type=armor_stand,name=NewPTChest]
execute @e[type=armor_stand,name=NewPTChest,x=21,y=220,z=0,dx=96,dy=34,dz=96] ~ ~ ~ detect ~ ~ ~ air 0 entitydata @e[type=armor_stand,name=NewPTChest,c=1] {CustomName:TChest}
scoreboard players set @e[type=armor_stand,name=Game] TreasureCount 0
execute @e[type=armor_stand,name=Treasure] ~ ~ ~ scoreboard players add @e[type=armor_stand,name=Game] TreasureCount 1
execute @e[type=armor_stand,name=Game,score_TreasureCount=0] ~ ~ ~ entitydata @e[type=armor_stand,name=TreasureCD] {CustomName:Treasure}
execute @e[type=armor_stand,name=OldTChest] ~ ~ ~ detect ~ ~ ~ air 0 kill @e[type=armor_stand,name=OldTChest,c=1]
execute @e[type=armor_stand,name=OldTChest] ~ ~ ~ particle fireworksSpark ~ ~11 ~ 0 3 0 0 2 force
stats entity @e[type=armor_stand,name=OldTChest] set SuccessCount @e[name=OldTChest,c=1] SuccessCount
scoreboard players set @e[type=armor_stand,name=OldTChest] SuccessCount 0
execute @e[type=armor_stand,name=OldTChest] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1073 6 32
kill @e[type=armor_stand,name=OldTChest,score_SuccessCount_min=1]
execute @e[type=armor_stand,name=TChest] ~ ~ ~ execute @e[type=armor_stand,tag=Treasure,score_Selected_min=1] ~ ~ ~ setblock ~ ~-1 ~ redstone_block

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
title @a[m=0,score_OutOfMap_min=1,score_OutOfMap=1] title [{"text":"Return to the arena!","color":"red"}]
effect @a[m=0,score_OutOfMap_min=100] wither 1 2

# Confine spectators
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] ~ ~ ~ tp @a[m=spectator,team=red,score_InArena=0] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=2,score_SpectatorLock_min=1] ~ ~ ~ tp @a[m=spectator,team=blue,score_InArena=0] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=2,score_SpectatorLock_min=1] ~ ~ ~ tp @a[m=spectator,team=red,score_InArena=0] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] ~ ~ ~ tp @a[m=spectator,team=blue,score_InArena=0] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] 20 0 -10 tp @a[team=red,m=spectator,dx=42,dy=500,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2,score_SpectatorLock_min=1] 20 0 -10 tp @a[team=blue,m=spectator,dx=42,dy=500,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1,score_SpectatorLock_min=1] -60 0 -10 tp @a[team=blue,m=spectator,dx=42,dy=500,dz=110] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2,score_SpectatorLock_min=1] -60 0 -10 tp @a[team=red,m=spectator,dx=42,dy=500,dz=110] 40 236 -8 0 0

# Tp players in wrong arena (reconnects)
execute @e[type=armor_stand,name=Game,score_Round=1] 20 220 -10 tp @a[team=red,m=survival,dx=42,dy=40,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2] 20 220 -10 tp @a[team=blue,m=survival,dx=42,dy=40,dz=110] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1] -60 220 -10 tp @a[team=blue,m=survival,dx=42,dy=40,dz=110] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2] -60 220 -10 tp @a[team=red,m=survival,dx=42,dy=40,dz=110] 40 236 -8 0 0

# Gates
scoreboard players set @e[type=armor_stand,name=Gate] Gate 1
execute @e[type=armor_stand,name=Gate] ~ ~ ~ execute @p[dx=10,dy=5,dz=3,m=0] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=Gate,c=1] Gate 0
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

# Get rid of totems of undying
scoreboard players tag @e[type=item] add Totem {Item:{id:"minecraft:totem_of_undying"}}
kill @e[type=item,tag=Totem]
clear @a totem_of_undying

# Fix players carrying the ready check items in the crafting table into the game
clear @a leather_helmet -1 -1 {display:{Name:"Ready",color:49152}}
clear @a leather_helmet -1 -1 {display:{Name:"Not Ready",color:2105376}}

# Count remaining players
scoreboard players set @e[type=armor_stand,score_Team_min=1] Count 0
execute @a[team=blue,m=survival] ~ ~ ~ scoreboard players add @e[type=armor_stand,name=JoinBlue] Count 1
execute @a[team=red,m=survival] ~ ~ ~ scoreboard players add @e[type=armor_stand,name=JoinRed] Count 1
function entrapment:game/gamewon if @e[type=armor_stand,score_Team_min=1,score_Count=0]
