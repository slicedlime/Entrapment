# Set arena selection for the correct marker
execute as @e[scores={Arena=-2147483648..}] if score @s Arena = @p[scores={Op=1..}] ArenaSelection run scoreboard players set @s Selected 2
scoreboard players reset @a ArenaSelection

scoreboard players reset @e[scores={Selected=..1}] Selected
scoreboard players set @e[scores={Selected=2}] Selected 1
# Chat message
execute as @e[scores={Selected=1}] at @s run tellraw @a ["",{"text":"Selected arena \""},{"selector":"@s","color":"yellow"},{"text":"\" by ","color":"reset"},{"nbt":"ArmorItems[3].tag.author","entity":"@e[type=armor_stand,scores={Selected=1},sort=nearest,limit=1]","interpret":true,"color":"yellow"},{"text":".","color":"reset"}]
# Update sign
execute at @e[scores={Selected=1}] run data merge block 3 253 144 {Text1:'{"text":"Arena:","color":"white"}',Text2:'{"text":""}',Text3:'[{"selector":"@e[scores={Selected=1..,Arena=1..}]","color":"gold","clickEvent":{"action":"run_command","value":"trigger Action set 1"}}]',Text4:'[{"text":"by ","color":"white"},{"nbt":"ArmorItems[3].tag.author","entity":"@e[type=armor_stand,scores={Selected=1},sort=nearest,limit=1]","interpret":true,"color":"gold"}]'}

function entrapment:lobby/applypreview
