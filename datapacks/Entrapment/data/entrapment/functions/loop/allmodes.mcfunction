# Function run by all state loop functions

# tp players to spawn area
tp @a[gamemode=survival,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0
tp @a[gamemode=spectator,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0
tp @a[gamemode=adventure,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0

# Auto-join spectators
execute if entity @p[scores={NotPlaying=1..}] run tellraw @a [{"selector":"@a[scores={NotPlaying=1..}]","color":"gray"},{"text":" has joined ","color":"white"},{"text":"Spectators!","color":"gray"}]
team join none @a[scores={NotPlaying=1..}]
execute if entity @p[team=] run tellraw @a [{"selector":"@a[team=]","color":"gray"},{"text":" has joined ","color":"white"},{"text":"Spectators!","color":"gray"}]
team join none @a[team=]
scoreboard players reset @a[scores={NotPlaying=1..}] NotPlaying

# Reset lobby paintings & item frames
execute as @e[type=item_frame,x=-11,y=251,z=118,dx=22,dy=4,dz=28] run data merge entity @s {ItemRotation:0b}

# Make sure we don't get duplicates
tag @e[name=JoinRed,limit=1] add Keep
tag @e[name=JoinBlue,limit=1] add Keep
kill @e[type=armor_stand,scores={Team=1..},tag=!Keep]
tag @e[scores={Team=1..},tag=Keep] remove Keep

# Make sure we don't lose the team AS
execute unless entity @e[type=armor_stand,name=JoinRed] run summon armor_stand 1011 2 3 {CustomName:"\"JoinRed\"",Marker:1,NoGravity:1,Invisible:1}
scoreboard players set @e[type=armor_stand,name=JoinRed] Team 1

execute unless entity @e[type=armor_stand,name=JoinBlue] run summon armor_stand 1011 2 2 {CustomName:"\"JoinBlue\"",Marker:1,NoGravity:1,Invisible:1}
scoreboard players set @e[type=armor_stand,name=JoinBlue] Team 2

execute if score @e[type=armor_stand,name=Game,limit=1] State matches 0 run function entrapment:loop/lobby

# Debug mode
execute if entity @a[name=slicedlime,gamemode=creative] run gamerule sendCommandFeedback true
execute unless entity @a[name=slicedlime,gamemode=creative] run gamerule sendCommandFeedback false
