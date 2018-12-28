# Function run by all state loop functions

# tp players to spawn area
tp @a[m=survival,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0
tp @a[m=spectator,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0
tp @a[m=adventure,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0

# Auto-join spectators
execute @p[score_NotPlaying_min=1] ~ ~ ~ tellraw @a [{"selector":"@a[score_NotPlaying_min=1]","color":"gray"},{"text":" has joined ","color":"white"},{"text":"Spectators!","color":"gray"}]
scoreboard teams join none @a[score_NotPlaying_min=1]
execute @p[team=] ~ ~ ~ tellraw @a [{"selector":"@a[team=]","color":"gray"},{"text":" has joined ","color":"white"},{"text":"Spectators!","color":"gray"}]
scoreboard teams join none @a[team=]
scoreboard players reset @a[score_NotPlaying_min=1] NotPlaying

# Reset lobby paintings & item frames
entitydata @e[type=item_frame,x=-11,y=251,z=118,dx=22,dy=4,dz=28] {ItemRotation:0b}

# Make sure we don't get duplicates
scoreboard players tag @e[name=JoinRed,c=1] add Keep
scoreboard players tag @e[name=JoinBlue,c=1] add Keep
kill @e[type=armor_stand,score_Team_min=1,tag=!Keep]
scoreboard players tag @e[score_Team_min=1,tag=Keep] remove Keep

# Make sure we don't lose the team AS
scoreboard players tag @e[type=armor_stand,name=Game] add RedMissing
execute @e[type=armor_stand,name=JoinRed] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=Game] remove RedMissing
execute @e[tag=RedMissing] ~ ~ ~ summon armor_stand 1011 2 3 {CustomName:JoinRed,Marker:1,NoGravity:1,Invisible:1}
execute @e[tag=RedMissing] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=JoinRed] Team 1

scoreboard players tag @e[type=armor_stand,name=Game] add BlueMissing
execute @e[type=armor_stand,name=JoinBlue] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=Game] remove BlueMissing
execute @e[tag=BlueMissing] ~ ~ ~ summon armor_stand 1011 2 2 {CustomName:JoinBlue,Marker:1,NoGravity:1,Invisible:1}
execute @e[tag=BlueMissing] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=JoinBlue] Team 2
