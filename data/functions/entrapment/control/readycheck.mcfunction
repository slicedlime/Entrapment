# Check if ready check can be done, and if so activate it

scoreboard players tag @e[type=armor_stand,name=Game] add NeedArena
execute @e[score_Arena_min=1,score_Selected_min=1] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=Game] remove NeedArena
execute @e[tag=NeedArena] ~ ~ ~ execute @p[score_Action_min=3,score_Action=3,score_Op_min=1] ~ ~ ~ tellraw @a[score_Op_min=1] [{"text":"Please select an arena.","color":"red"}]
execute @e[type=armor_stand,score_Count=0,c=1] ~ ~ ~ tellraw @a[score_Op_min=1] [{"text":"Each team needs at least one player.","color":"red"}]
execute @e[type=armor_stand,name=Game,tag=!NeedArena] ~ ~ ~ execute @p[team=red] ~ ~ ~ execute @p[team=blue] ~ ~ ~ function entrapment:lobby/startreadycheck
scoreboard players tag @e[tag=NeedArena] remove NeedArena
