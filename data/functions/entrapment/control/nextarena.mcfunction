# Select next arena

scoreboard players operation Next Arena = @e[type=armor_stand,score_Arena_min=1,score_Selected_min=1] Arena
scoreboard players add Next Arena 1
# Check if we've exceeded highest
execute @e[type=armor_stand,score_Arena_min=-2147483648] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name=Game] Arena > @e[type=armor_stand,score_Arena_min=-2147483648,c=1] Arena
scoreboard players operation @e[type=armor_stand,name=Game] Arena -= Next Arena
execute @e[type=armor_stand,name=Game,score_Arena=-1] ~ ~ ~ scoreboard players set Next Arena 1
scoreboard players reset @e[type=armor_stand,name=Game] Arena
# Set Selected score for the new arena
scoreboard players operation @e[type=armor_stand,score_Arena_min=-2147483648] Arena -= Next Arena
scoreboard players set @e[type=armor_stand,score_Arena=0,score_Arena_min=0] Selected 2
scoreboard players operation @e[type=armor_stand,score_Arena_min=-2147483648] Arena += Next Arena
scoreboard players reset Next Arena
function entrapment:lobby/arenaselected
