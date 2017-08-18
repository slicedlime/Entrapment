# Select previous arena

scoreboard players operation Previous Arena = @e[type=armor_stand,score_Arena_min=1,score_Selected_min=1] Arena
scoreboard players remove Previous Arena 1
scoreboard players operation @e[type=armor_stand,name=Game] Arena = Previous Arena
# Wrap around if we're now at 0
execute @e[type=armor_stand,name=Game,score_Arena=0] ~ ~ ~ scoreboard players operation Previous Arena > @e[type=armor_stand,score_Arena_min=-2147483648] Arena
scoreboard players reset @e[type=armor_stand,name=Game] Arena
# Set Selected score for new arena
scoreboard players operation @e[type=armor_stand,score_Arena_min=-2147483648] Arena -= Previous Arena
scoreboard players set @e[type=armor_stand,score_Arena=0,score_Arena_min=0] Selected 2
scoreboard players operation @e[type=armor_stand,score_Arena_min=-2147483648] Arena += Previous Arena
scoreboard players reset Previous Arena
function entrapment:lobby/arenaselected
