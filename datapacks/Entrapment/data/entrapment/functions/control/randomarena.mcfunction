# Select a random arena
scoreboard players set @e[type=armor_stand,score_Arena_min=1] Old 0
scoreboard players set @e[type=armor_stand,score_Selected_min=1] Old 1
scoreboard players reset * Selected
scoreboard players set @r[type=armor_stand,score_Arena_min=1,score_Old=0] Selected 2
function entrapment:lobby/arenaselected
