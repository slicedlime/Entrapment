# Select a random arena
scoreboard players set @e[type=armor_stand,scores={Arena=1..}] Old 0
scoreboard players set @e[type=armor_stand,scores={Selected=1..}] Old 1
scoreboard players reset * Selected
scoreboard players set @e[type=armor_stand,scores={Arena=1..,Old=0},sort=random,limit=1] Selected 2
function entrapment:lobby/arenaselected
