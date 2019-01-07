# Individual player tracking
tag @a remove WasReady
tag @a remove WasNotReady
tag @a[scores={Ready=1}] add WasReady
tag @a[scores={Ready=2}] add WasNotReady
tag @a remove ReadyHelmet
tag @a remove NotReadyHelmet
tag @a[nbt={Inventory:[{id:"minecraft:leather_helmet",Slot:103b,tag:{display:{Name:"\"Ready\""}}}]}] add ReadyHelmet 
tag @a[nbt={Inventory:[{id:"minecraft:leather_helmet",Slot:103b,tag:{display:{Name:"\"Not Ready\""}}}]}] add NotReadyHelmet
scoreboard players add @e[type=armor_stand,name=Wait] Tick 1

execute as @a[tag=ReadyHelmet,tag=!WasReady] run tellraw @a [{"selector":"@s"},{"text": " is ready."}]
execute as @a[tag=NotReadyHelmet,tag=!WasNotReady] run tellraw @a [{"selector":"@s"},{"text": " is not ready."}]

# Player control
clear @a[tag=ReadyHelmet]
clear @a[tag=NotReadyHelmet]

replaceitem entity @a[team=!none] hotbar.0 air
replaceitem entity @a[team=!none] hotbar.1 air
replaceitem entity @a[team=!none] hotbar.2 air
replaceitem entity @a[team=!none] hotbar.3 leather_helmet{display:{Name:"\"Ready\"",color:49152}}
replaceitem entity @a[team=!none] hotbar.4 air
replaceitem entity @a[team=!none] hotbar.5 leather_helmet{display:{Name:"\"Not Ready\"",color:2105376}}
replaceitem entity @a[team=!none] hotbar.6 air
replaceitem entity @a[team=!none] hotbar.7 air
replaceitem entity @a[team=!none] hotbar.8 air
replaceitem entity @a[team=!none] armor.head air

# Set scores based on tags
scoreboard players set @a[tag=ReadyHelmet] ReadyCheck 3
scoreboard players set @a[tag=ReadyHelmet] Ready 1
scoreboard players set @a[tag=NotReadyHelmet] ReadyCheck -1
scoreboard players set @a[tag=NotReadyHelmet] Ready 2

# Total ready check tracking
execute store result score @e[type=armor_stand,name=JoinRed,limit=1] Ready if entity @a[team=red,scores={Ready=1}]
execute store result score @e[type=armor_stand,name=JoinBlue,limit=1] Ready if entity @a[team=blue,scores={Ready=1}]

# Someone was not ready?
execute if score @e[type=armor_stand,name=Wait,limit=1] Tick matches 300 if entity @p[team=!none,scores={Ready=2}] run scoreboard players set @e[type=armor_stand,name=Game] Ready 2

# Someone didn't answer
execute if score @e[type=armor_stand,name=Wait,limit=1] Tick matches 300 unless entity @p[team=!none,scores={Ready=2}] run scoreboard players set @e[type=armor_stand,name=Game] Ready 3

# Everyone was ready!
execute if score @e[type=armor_stand,name=JoinRed,limit=1] Ready = @e[type=armor_stand,name=JoinRed,limit=1] Count if score @e[type=armor_stand,name=JoinBlue,limit=1] Ready = @e[type=armor_stand,name=JoinBlue,limit=1] Count run scoreboard players set @e[type=armor_stand,name=Game] Ready 1

# Ready check failed actions
execute if score @e[type=armor_stand,name=Game,limit=1] Ready matches 2 run tellraw @a [{"text":"Ready check failed. Not ready: "},{"selector":"@a[scores={Ready=2}]"},{"text":"."}]
execute if score @e[type=armor_stand,name=Game,limit=1] Ready matches 3 run tellraw @a [{"text":"Ready check timed out waiting for "},{"selector":"@a[scores={Ready=0}]"},{"text":"."}]
execute if score @e[type=armor_stand,name=Game,limit=1] Ready matches 2.. run function entrapment:lobby/enterlobby

# Ready check complete
execute if score @e[type=armor_stand,name=Game,limit=1] Ready matches 1 run function entrapment:readycheck/readycheckcomplete

effect give @a instant_health 3 1 true
effect give @a[gamemode=adventure] weakness 2 255 true

kill @e[type=item,nbt={Item:{id:"minecraft:leather_helmet"}}]
