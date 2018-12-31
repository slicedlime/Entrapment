# Select previous arena

scoreboard players operation Next Arena = @e[type=armor_stand,scores={Arena=1..,Selected=1..}] Arena
scoreboard players remove Next Arena 1

execute as @e[type=armor_stand,scores={Arena=-2147483648..}] run scoreboard players operation Max Arena > @s Arena
execute if score Next Arena matches 0 run scoreboard players operation Next Arena = Max Arena

# Set Selected score for the new arena
execute as @e[type=armor_stand,scores={Arena=-2147483648..}] if score Next Arena = @s Arena run scoreboard players set @s Selected 2
scoreboard players reset Next Arena
scoreboard players reset Max Arena
function entrapment:lobby/arenaselected
