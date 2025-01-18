execute as @n[type=armor_stand,tag=Treasure] at @s positioned ~ ~ ~2 run summon armor_stand ~ ~ ~ {Tags:[Treasure],Marker:1b,NoGravity:1b,CustomName:'"Treasure"',CustomNameVisible:1b}
execute as @n[type=armor_stand,tag=Treasure] at @s positioned ~ ~ ~ run setblock ~-1 ~ ~ chest
