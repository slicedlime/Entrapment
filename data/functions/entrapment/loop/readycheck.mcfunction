function entrapment:loop/allmodes

# Individual player tracking
scoreboard players tag @a remove WasReady
scoreboard players tag @a remove WasNotReady
scoreboard players tag @a[score_Ready=1,score_Ready_min=1] add WasReady
scoreboard players tag @a[score_Ready=2,score_Ready_min=2] add WasNotReady
scoreboard players tag @a remove ReadyHelmet
scoreboard players tag @a remove NotReadyHelmet
scoreboard players tag @a add ReadyHelmet {Inventory:[{id:"minecraft:leather_helmet",Slot:103b,tag:{display:{Name:"Ready"}}}]}
scoreboard players tag @a add NotReadyHelmet {Inventory:[{id:"minecraft:leather_helmet",Slot:103b,tag:{display:{Name:"Not Ready"}}}]}
scoreboard players add @e[type=armor_stand,name=Wait] Tick 1
execute @a[tag=ReadyHelmet] ~ ~ ~ execute @s[tag=!WasReady] ~ ~ ~ tellraw @a [{"selector":"@p[tag=ReadyHelmet]"},{"text": " is ready."}]
execute @a[tag=NotReadyHelmet] ~ ~ ~ execute @s[tag=!WasNotReady] ~ ~ ~ tellraw @a [{"selector":"@p[tag=NotReadyHelmet]"},{"text": " is not ready."}]
clear @a[tag=ReadyHelmet]
clear @a[tag=NotReadyHelmet]
scoreboard players set @a[tag=ReadyHelmet] ReadyCheck 3
scoreboard players set @a[tag=ReadyHelmet] Ready 1
scoreboard players set @a[tag=NotReadyHelmet] ReadyCheck -1
scoreboard players set @a[tag=NotReadyHelmet] Ready 2

# Total ready check tracking

execute @e[type=armor_stand,score_Count_min=1] ~ ~ ~ scoreboard players operation @s Ready = @s Count
execute @a[team=red,score_Ready_min=1] ~ ~ ~ scoreboard players remove @e[type=armor_stand,name=JoinRed] Ready 1
execute @a[team=blue,score_Ready_min=1] ~ ~ ~ scoreboard players remove @e[type=armor_stand,name=JoinBlue] Ready 1
# Ready = 1 => ReadyCheck succeeded
execute @e[type=armor_stand,name=JoinRed,score_Ready=0] ~ ~ ~ execute @e[type=armor_stand,name=JoinBlue,score_Ready=0] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=Game] Ready 1
# Ready = 2 => ReadyCheck failed
execute @e[type=armor_stand,name=JoinRed,score_Ready=0] ~ ~ ~ execute @e[type=armor_stand,name=JoinBlue,score_Ready=0] ~ ~ ~ execute @p[score_Ready_min=2,score_Ready_min=2] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=Game] Ready 2

# Ready check failed

execute @e[type=armor_stand,name=Game,score_Ready_min=2] ~ ~ ~ tellraw @a [{"text":"Ready check failed. Not ready: "},{"selector":"@a[score_Ready_min=2]"},{"text":"."}]
execute @e[name=!Game,type=armor_stand,score_Ready_min=1,c=1] ~ ~ ~ execute @e[name=Wait,score_Tick_min=300,score_Tick=300] ~ ~ ~ tellraw @a [{"text":"Ready check timed out waiting for "},{"selector":"@a[score_Ready=0]"},{"text":"."}]
function entrapment:lobby/enterlobby if @e[type=armor_stand,name=Game,score_Ready_min=2]
execute @e[name=!Game,type=armor_stand,score_Ready_min=1,c=1] ~ ~ ~ function entrapment:lobby/enterlobby if @e[name=Wait,score_Tick_min=300]

# Ready check complete

scoreboard players add @e[type=armor_stand,name=Game,score_Ready=1,score_Ready_min=1] Tick 1
execute @e[type=armor_stand,name=Game,score_Ready=1,score_Ready_min=1,score_Tick=1] ~ ~ ~ tellraw @a [{"text":"Ready check passed. Stand by, preparing arenas..."}]

# Activate load selected arena line
execute @e[type=armor_stand,name=Game,score_Ready=1,score_Ready_min=1,score_Tick=1,score_Tick_min=1] ~ ~ ~ blockdata 1077 0 0 {auto:1}

# Title countdown
execute @e[name=Game,score_Tick=20,score_Tick_min=20] ~ ~ ~ title @a subtitle [{"text":""}]
execute @e[name=Game,score_Tick=100,score_Tick_min=100] ~ ~ ~ title @a title [{"text":"5"}]
execute @e[name=Game,score_Tick=120,score_Tick_min=120] ~ ~ ~ title @a title [{"text":"4"}]
execute @e[name=Game,score_Tick=140,score_Tick_min=140] ~ ~ ~ title @a title [{"text":"3"}]
execute @e[name=Game,score_Tick=160,score_Tick_min=160] ~ ~ ~ title @a title [{"text":"2"}]
execute @e[name=Game,score_Tick=180,score_Tick_min=180] ~ ~ ~ title @a title [{"text":"1"}]
function entrapment:game/startgame if @e[name=Game,score_Tick=200,score_Tick_min=200]

# Countdown sounds
execute @e[name=Game,score_Tick=100,score_Tick_min=100] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=120,score_Tick_min=120] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=140,score_Tick_min=140] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=160,score_Tick_min=160] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s
execute @e[name=Game,score_Tick=180,score_Tick_min=180] ~ ~ ~ execute @a ~ ~ ~ playsound minecraft:block.note.hat master @s

# Player control
scoreboard players tag @a[team=!none] remove Starting
execute @e[type=armor_stand,name=Game,score_Ready=1,score_Ready_min=1] ~ ~ ~ scoreboard players tag @a[team=!none] add Starting

replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.0 air
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.1 air
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.2 air
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.3 leather_helmet 1 0 {display:{Name:"Ready",color:49152}}
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.4 air
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.5 leather_helmet 1 0 {display:{Name:"Not Ready",color:2105376}}
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.6 air
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.7 air
replaceitem entity @a[team=!none,tag=!Starting] slot.hotbar.8 air
replaceitem entity @a[team=!none,tag=!Starting] slot.armor.head air
clear @a[team=!none,tag=Starting]

effect @a instant_health 3 1 true
effect @a[m=2] weakness 2 255 true

scoreboard players tag @e[type=item] add Helmet {Item:{id:"minecraft:leather_helmet"}}
kill @e[type=item,tag=Helmet]
